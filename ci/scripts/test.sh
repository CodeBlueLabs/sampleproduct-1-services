#!/bin/bash
export TERM=${TERM:-dumb}
cd PAL-Immersion-Services
chmod 755 gradlew
./gradlew --no-daemon build test jacocoTestReport
cd build/reports/coverage
apt-get update
apt-get install -y zip
zip -r $appname.war .
appstatus=$(curl --silent -u $managerusername:$managerpassword "$managerurl/list" | grep $appname)
if [ ! -z "$appstatus" ]; then
	echo "Undeploying $appname $managerurl/text/undeploy?path=/$appname .."
	UNDEPLOY_STATUS=$(curl -v -u $managerusername:$managerpassword "$managerurl/undeploy?path=/$appname" | head -n1)
	
	if [[ $UNDEPLOY_STATUS == OK* ]]; then
		echo "Undeploy Completed, hence deploying unit test results .."
	else 
		echo "Undeploy failed .."
		exit 1
	fi
else
	echo "$appname is not up and running, hence deploying unit test results .."
fi
curl -v -u $managerusername:$managerpassword -T $appname.war "$managerurl/deploy?path=/$appname"
