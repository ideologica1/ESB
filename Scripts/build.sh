#!/usr/bin/env bash

pwd

cp Configuration/config/esb.xml Docker/ServiceMix/config/esb.xml
echo "esb.xml copied to Docker"

cp Configuration/target/Configuration-1.0.0.jar Artifacts/Configuration-1.0.0.jar
cp Configuration/target/Configuration-1.0.0.jar Docker/ServiceMix/deploy/Configuration-1.0.0.jar
echo "Configuration-1.0.0.jar copied to Artifacts and Docker"

cp DataModel/target/DataModel-1.0.0.jar Artifacts/DataModel-1.0.0.jar
cp DataModel/target/DataModel-1.0.0.jar Docker/ServiceMix/deploy/DataModel-1.0.0.jar
echo "DataModel-1.0.0.jar copied to Artifacts and Docker"

cp DocumentumAdapter/target/DocumentumAdapter-1.0.0.jar Artifacts/DocumentumAdapter-1.0.0.jar
cp DocumentumAdapter/target/DocumentumAdapter-1.0.0.jar Docker/ServiceMix/deploy/DocumentumAdapter-1.0.0.jar
echo "DocumentumAdapter-1.0.0.jar copied to Artifacts and Docker"

cp EmailAdapter/target/EmailAdapter-1.0.0.jar Artifacts/EmailAdapter-1.0.0.jar
cp EmailAdapter/target/EmailAdapter-1.0.0.jar Docker/ServiceMix/deploy/EmailAdapter-1.0.0.jar
echo "EmailAdapter-1.0.0.jar copied to Artifacts and Docker"

cp ServiceRequestMediator/target/ServiceRequestMediator-1.0.0.jar Artifacts/ServiceRequestMediator-1.0.0.jar
cp ServiceRequestMediator/target/ServiceRequestMediator-1.0.0.jar Docker/ServiceMix/deploy/ServiceRequestMediator-1.0.0.jar
echo "ServiceRequestMediator-1.0.0.jar copied to Artifacts and Docker"

cp SiebelAdapter/target/SiebelAdapter-1.0.0.jar Artifacts/SiebelAdapter-1.0.0.jar
cp SiebelAdapter/target/SiebelAdapter-1.0.0.jar Docker/ServiceMix/deploy/SiebelAdapter-1.0.0.jar
echo "SiebelAdapter-1.0.0.jar copied to Artifacts and Docker"
