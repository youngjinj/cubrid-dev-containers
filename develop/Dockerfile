FROM dev-docker-hub:5000/centos-systemd:7

MAINTAINER Joo Youngjin <youngjinj@cubrid.com>

RUN yum install -y epel-release
RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum install -y https://repo.ius.io/ius-release-el7.rpm
RUN yum install -y http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-1.noarch.rpm

RUN yum update -y --exclude=abrt-*,audit-*

RUN yum groupinstall -y "Core"              --setopt=group_package_types=mandatory                  --exclude=abrt-*,audit-*
RUN yum groupinstall -y "Base"              --setopt=group_package_types=mandatory,default          --exclude=abrt-*,audit-*
RUN yum groupinstall -y "Development Tools" --setopt=group_package_types=mandatory,default,optional --exclude=abrt-*,audit-*

RUN yum install -y cockpit cockpit-dashboard

RUN yum install -y centos-release-scl
RUN yum install -y devtoolset-8-\*

RUN yum install -y systemtap systemtap-sdt-devel
RUN yum install -y ncurses-devel
RUN yum install -y ant
RUN yum install -y elfutils-libelf-devel
RUN yum install -y openssl openssl-devel

RUN yum install -y cgdb ctags cscope

RUN yum install -y java-11-openjdk java-11-openjdk-devel

COPY adoptopenjdk.repo /etc/yum.repos.d/adoptopenjdk.repo
RUN yum install -y adoptopenjdk-8-hotspot
RUN yum install -y adoptopenjdk-11-hotspot

RUN yum install -y python3 python3-devel

# CMake 3.20.4
RUN mkdir -p /home/package/cmake
RUN curl -L https://github.com/Kitware/CMake/releases/download/v3.20.4/cmake-3.20.4.tar.gz -o /home/package/cmake/cmake-3.20.4.tar.gz
RUN tar -zxvf /home/package/cmake/cmake-3.20.4.tar.gz -C /home/package/cmake
RUN cd /home/package/cmake/cmake-3.20.4 && ./bootstrap && make && make install
RUN cd / && rm -rf /home/package/cmake/cmake-3.20.4

# Bison 3.7.6
RUN mkdir -p /home/package/bison
RUN curl -L https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz -o /home/package/bison/bison-3.7.6.tar.xz
RUN tar -Jxvf /home/package/bison/bison-3.7.6.tar.xz -C /home/package/bison
RUN cd /home/package/bison/bison-3.7.6 && ./configure && make && make install
RUN cd / && rm -rf /home/package/bison/bison-3.7.6

# Flex 2.6.4
RUN mkdir -p /home/package/flex
RUN curl -L https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz -o /home/package/flex/flex-2.6.4.tar.gz
RUN tar -zxvf /home/package/flex/flex-2.6.4.tar.gz -C /home/package/flex
RUN cd /home/package/flex/flex-2.6.4 && ./configure && make && make install
RUN cd / && rm -rf /home/package/flex/flex-2.6.4

RUN  yum install -y indent

# Artistic Style 3.1
RUN mkdir -p /home/package/astyle/astyle-3.1
RUN curl -L https://jaist.dl.sourceforge.net/project/astyle/astyle/astyle%203.1/astyle_3.1_linux.tar.gz -o /home/package/astyle/astyle_3.1_linux.tar.gz
RUN tar -zxvf /home/package/astyle/astyle_3.1_linux.tar.gz -C /home/package/astyle/astyle-3.1 --strip-components=1
RUN cd /home/package/astyle/astyle-3.1 && cmake . && make && make install

RUN yum clean all
RUN yum makecache

# RUN systemctl disable abrtd.service
# RUN systemctl disable abrt-oops.service
# RUN systemctl disable auditd.service
RUN systemctl disable avahi-daemon.service
RUN systemctl disable kdump.service

RUN systemctl disable NetworkManager.service
RUN systemctl disable network.service

RUN systemctl disable firewalld.service
RUN systemctl enable sshd.service
RUN systemctl enable cockpit.socket

COPY limits.conf /etc/security/limits.conf
COPY 20-nproc.conf /etc/security/limits.d/20-nproc.conf

COPY .custom_profile /root/.custom_profile
RUN echo -e "\nsource \$HOME/.custom_profile"    >> /root/.bash_profile
RUN echo -e "\nsource \$HOME/.custom_profile"    >> /root/.bashrc

COPY .custom_profile /etc/skel/.custom_profile
RUN echo -e "\nsource \$HOME/.custom_profile"    >> /etc/skel/.bash_profile
RUN echo -e "\nsource \$HOME/.custom_profile"    >> /etc/skel/.bashrc

RUN echo "root:password" | chpasswd

ENTRYPOINT ["/usr/sbin/init"]
