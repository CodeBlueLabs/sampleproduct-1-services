#!/bin/bash
set -ex
cd PAL-Immersion-Services
cf login -a api.run.pivotal.io -u onedigitaladmin@cognizant.com -p Pass123$ -o AutoLoan -s PALImmersion
cf push
