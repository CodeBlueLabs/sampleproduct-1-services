#!/bin/bash
set -ex
export TERM=${TERM:-dumb}
cd sampleproduct-1-services
chmod 755 gradlew
./gradlew --no-daemon clean build
cd build/spock-reports
apt-get update
apt-get install -y zip
zip -r $acceptappname.war .
echo $acceptappname
echo $managerusername
echo $managerpassword
echo $managerurl
appstatus=$(curl -u $managerusername:$managerpassword "$managerurl/list" | grep $acceptappname)
echo $appstatus
if [ ! -z "$appstatus" ]; then
	echo "Undeploying $acceptappname $managerurl/text/undeploy?path=/$acceptappname .."
	UNDEPLOY_STATUS=$(curl -v -u $managerusername:$managerpassword "$managerurl/undeploy?path=/$acceptappname" | head -n1)
	
	if [[ $UNDEPLOY_STATUS == OK* ]]; then
		echo "Undeploy Completed, hence deploying unit test results .."
	else 
		echo "Undeploy failed .."
		exit 1
	fi
else
	echo "$acceptappname is not up and running, hence deploying unit test results .."
fi
echo "Processing"
curl -v -u $managerusername:$managerpassword -T $acceptappname.war "$managerurl/deploy?path=/$acceptappname"
