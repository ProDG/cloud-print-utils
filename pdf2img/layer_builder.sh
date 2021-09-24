#!/bin/bash
set -e
yum install -y yum-utils rpmdevtools
cd /tmp
yumdownloader --resolve \
    poppler-utils.x86_64 \

rpmdev-extract -- *rpm

mkdir /opt/lib
cp -P -r /tmp/*/usr/lib64/* /opt/lib

RUNTIME=$(echo "$AWS_EXECUTION_ENV" | cut -d _ -f 3)
export RUNTIME
mkdir -p "/opt/python/lib/$RUNTIME/site-packages"
python -m pip install "pdf2image==1.14.0" -t "/opt/python/lib/$RUNTIME/site-packages"

cd /opt
zip -r9 /out/layer.zip lib/* python/*