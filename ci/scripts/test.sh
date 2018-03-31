#!/bin/bash
set -ex
export TERM=${TERM:-dumb}
cd sampleproduct-1-services
chmod 755 gradlew
./gradlew --no-daemon build test jacocoTestReport
cd build/reports/coverage
apt-get update
apt-get install -y zip
zip -r sampleproduct1test.war .
echo sampleproduct1test
echo $appname
echo app.unittest.name
appstatus=$(curl -u $managerusername:$managerpassword "$managerurl/list" | grep sampleproduct1test)
if [ ! -z "$appstatus" ]; then
	echo "Undeploying sampleproduct1test $managerurl/text/undeploy?path=/sampleproduct1test .."
	UNDEPLOY_STATUS=$(curl -v -u $managerusername:$managerpassword "$managerurl/undeploy?path=/sampleproduct1test" | head -n1)
	
	if [[ $UNDEPLOY_STATUS == OK* ]]; then
		echo "Undeploy Completed, hence deploying unit test results .."
	else 
		echo "Undeploy failed .."
		exit 1
	fi
else
	echo "sampleproduct1test is not up and running, hence deploying unit test results .."
fi
curl -v -u $managerusername:$managerpassword -T sampleproduct1test.war "$managerurl/deploy?path=/sampleproduct1test"
