#!/usr/bin/env bash

pwd

rm Docker/ServiceMix/config/esb.xml
echo "esb.xml deleted"

rm Artifacts/Configuration-1.0.0.jar
rm Docker/ServiceMix/deploy/Configuration-1.0.0.jar
echo "Configuration-1.0.0.jar deleted"

rm Artifacts/DataModel-1.0.0.jar
rm Docker/ServiceMix/deploy/DataModel-1.0.0.jar
echo "DataModel-1.0.0.jar deleted"

rm Artifacts/DocumentumAdapter-1.0.0.jar
rm Docker/ServiceMix/deploy/DocumentumAdapter-1.0.0.jar
echo "DocumentumAdapter-1.0.0.jar deleted"

rm Artifacts/EmailAdapter-1.0.0.jar
rm Docker/ServiceMix/deploy/EmailAdapter-1.0.0.jar
echo "EmailAdapter-1.0.0.jar deleted"

rm Artifacts/ServiceRequestMediator-1.0.0.jar
rm Docker/ServiceMix/deploy/ServiceRequestMediator-1.0.0.jar
echo "ServiceRequestMediator-1.0.0.jar deleted"

rm Artifacts/SiebelAdapter-1.0.0.jar
rm Docker/ServiceMix/deploy/SiebelAdapter-1.0.0.jar
echo "SiebelAdapter-1.0.0.jar deleted"