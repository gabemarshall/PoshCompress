#!/bin/bash
echo "Building docker image..this may take a few minutes"
docker build -t ps_test . > /dev/null 2>&1
echo ""
docker run --rm ps_test 
