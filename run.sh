#!/bin/bash
docker build -t ps_test . > /dev/null 2>&1
docker run --rm ps_test 
