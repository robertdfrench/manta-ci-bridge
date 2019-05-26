#!/bin/bash -ex
PATH=$PATH:/opt/local/bin:/usr/sbin
pkgin update
pkgin -y install git

pkgin -y install apache
svcadm enable -r svc:/pkgsrc/apache:default

pkgin -y install postgresql11-server
svcadm enable -r svc:/pkgsrc/postgresql:default
