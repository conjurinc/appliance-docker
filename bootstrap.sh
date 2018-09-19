#!/bin/bash -e

# Used by test-kitchen, converge looks for 'bootstrap.sh' by default

echo "Running bootstrap.sh..."

echo "Waiting for container to be ready (TODO switch to polling)"
sleep 60

echo "Fetching instance hostname..."
hostname=$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)
password=testing
orgaccount=kitchen

echo "Configuring for master..."
docker exec conjur-appliance evoke configure master -h $hostname -p $password $orgaccount
