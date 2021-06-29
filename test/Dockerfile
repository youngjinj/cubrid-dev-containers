FROM dev-docker-hub:5000/centos-systemd:7

MAINTAINER Joo Youngjin <youngjinj@cubrid.com>

RUN yum install -y epel-release
RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum install -y https://repo.ius.io/ius-release-el7.rpm
RUN yum install -y http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-1.noarch.rpm

RUN yum update -y

RUN yum groupinstall -y "Core" --setopt=group_package_types=mandatory
RUN yum groupinstall -y "Base" --setopt=group_package_types=mandatory,default
