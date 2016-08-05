#!/bin/bash

puppet module install garethr/docker

cp -r modules /etc/puppet/
cp -r manifests /etc/puppet/
