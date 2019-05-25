#!/bin/bash -ex
PATH=$PATH:/opt/local/bin
pkgin -y install \
	apache-2.4.35 \
	nodejs-10.11.0 \
	postgresql10-client \
	postgresql10-server
