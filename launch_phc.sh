#!/bin/bash
set -x
docker run -d -v ./phc_data:/phc_data -p 20060:20060 -p 20061:20061 phcv2
