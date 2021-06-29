FROM 192.168.2.253:5000/rnd-dev/centos-systemd:7

MAINTAINER Joo Youngjin <youngjinj@cubrid.com>

RUN sed -i "s/enabled=1/enabled=0/" /etc/yum/pluginconf.d/fastestmirror.conf
RUN sed -i "s/override_install_langs=en_US.utf8/# override_install_langs=en_US.utf8/" /etc/yum.conf

RUN yum install -y epel-release
RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum install -y https://repo.ius.io/ius-release-el7.rpm
RUN yum install -y http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-1.noarch.rpm

RUN yum update -y

#
# Fedora Remix for Windows Subsystem for Linux (WSL)
#  - https://www.whitewaterfoundry.com/fedora-remix-for-wsl
#  - https://github.com/WhitewaterFoundry/Fedora-Remix-for-WSL
#
# The following packages have been removed from the default install of Fedora Remix for WSL:
#  - grub
#  - plymouth
#  - kernel
#  - sssd
#  - linux-firmware
#  - dracut
#  - parted
#  - e2fsprogs
#  - iprutils
#  - ppc64-utils
#  - selinux-policy
#  - policycoreutils
#  - sendmail
#  - firewalld
#  - fedora-release
#  - fedora-logos
#  - fedora-release-notes
#

#
# Group-Id: core
#
# RUN yum groups mark install -y "Core" --setopt=group_package_types=mandatory
#
#  - Mandatory Packages:
RUN yum install -y \
	# audit \
	basesystem \
	bash \
	# btrfs-progs \
	coreutils \
	cronie \
	curl \
	dhclient \
	# e2fsprogs \
	filesystem \
	firewalld \
	glibc \
	hostname \
	initscripts \
	iproute \
	# iprutils \
	iptables \
	iputils \
	irqbalance \
	# kbd \
	# kexec-tools \
	less \
	man-db \
	ncurses \
	openssh-clients \
	openssh-server \
	# parted \
	# passwd \
	# plymouth \
	# policycoreutils \
	procps-ng \
	rootfiles \
	rpm \
	rsyslog \
	# selinux-policy-targeted \
	setup \
	shadow-utils \
	sudo \
	systemd \
	tar \
	tuned \
	util-linux \
	vim-minimal \
	xfsprogs \
	yum \
	;

#  - Default Packages: NULL
#  - Optional Packages: NULL

#
# Group-Id: base
#
# RUN yum groupinstall -y "Base" --setopt=group_package_types=mandatory,default

#  - Mandatory Packages:
RUN yum install -y \
	acl \
	at \
	attr \
	bc \
	bind-utils \
	# centos-indexhtml \
	cpio \
	# crda \
	crontabs \
	# cyrus-sasl-plain \
	dbus \
	ed \
	file \
	logrotate \
	lsof \
	man-db \
	net-tools \
	# ntsysv \
	pciutils \
	psacct \
	# quota \
	# setserial \
	traceroute \
	# usb_modeswitch \
	;

#  - Default Packages:
RUN yum install -y \
	# abrt-addon-ccpp \
	# abrt-addon-python \
	# abrt-cli \
	# abrt-console-notification \
	bash-completion \
	blktrace \
	bpftool \
	bridge-utils \
	bzip2 \
	chrony \
	# cryptsetup \
	# dmraid \
	dosfstools \
	ethtool \
	# fprintd-pam \
	gnupg2 \
	hunspell \
	hunspell-en \
	# kmod-kvdo \
	# kpatch \
	# ledmon \
	libaio \
	# libreport-plugin-mailx \
	# libstoragemgmt \
	# lvm2 \
	man-pages \
	man-pages-overrides \
	# mdadm \
	mlocate \
	mtr \
	nano \
	ntpdate \
	pinfo \
	# plymouth \
	# pm-utils \
	rdate \
	# rfkill \
	rng-tools \
	rsync \
	scl-utils \
	setuptool \
	# smartmontools \
	# sos \
	# sssd-client \
	strace \
	sysstat \
	systemtap-runtime \
	tcpdump \
	tcsh \
	# teamd \
	time \
	unzip \
	# usbutils \
	# vdo \
	vim-enhanced \
	virt-what \
	wget \
	which \
	words \
	# xfsdump \
	xz \
	yum-langpacks \
	yum-utils \
	zip \
	;

#  - Optional Packages: NULL
#  - Conditional Packages: NULL

RUN yum install -y hunspell-ko

#
# Group-Id: development
#
RUN yum groupinstall -y "Development Tools" --setopt=group_package_types=mandatory,default,optional

#  - Mandatory Packages: ALL
# RUN yum install -y \
#	autoconf \
#	automake \
#	binutils \
#	bison \
#	flex \
#	gcc \
#	gcc-c++ \
#	gettext \
#	libtool \
#	make \
#	patch \
#	pkgconfig \
#	redhat-rpm-config \
#	rpm-build \
#	rpm-sign \
#	;

#  - Default Packages: ALL
# RUN yum install -y \
#	byacc \
#	cscope \
#	ctags \
#	diffstat \
#	doxygen \
#	elfutils \
#	gcc-gfortran \
#	git \
#	indent \
#	intltool \
#	patchutils \
#	rcs \
#	subversion \
#	swig \
#	systemtap \
#	;

#  - Optional Packages: ALL
# RUN yum install -y \
#	ElectricFence \
#	ant \
#	babel \
#	bzr \
#	ccache \
#	chrpath \
#	clips \
#	clips-devel \
#	clips-doc \
#	clips-emacs \
#	clips-xclips \
#	clipsmm-devel \
#	clipsmm-doc \
#	cmake \
#	cmucl \
#	colordiff \
#	compat-gcc-44 \
#	compat-gcc-44-c++ \
#	cvs \
#	cvsps \
#	darcs \
#	dejagnu \
#	email2trac \
#	expect \
#	ftnchek \
#	gcc-gnat \
#	gcc-objc \
#	gcc-objc++ \
#	ghc \
#	git \
#	haskell-platform \
#	imake \
#	javapackages-tools \
#	ksc \
#	lua \
#	mercurial \
#	mock \
#	mod_dav_svn \
#	nasm \
#	nqc \
#	nqc-doc \
#	ocaml \
#	perltidy \
#	qgit \
#	rpmdevtools \
#	rpmlint \
#	sbcl \
#	scorep \
#	systemtap-sdt-devel \
#	systemtap-server \
#	trac \
#	trac-git-plugin \
#	trac-mercurial-plugin \
#	trac-webadmin \
#	translate-toolkit \
#	;

RUN yum install -y cockpit cockpit-dashboard

RUN yum install -y centos-release-scl
RUN yum install -y devtoolset-8-\*

RUN yum install -y \
	cgdb \
	elfutils-libelf-devel \
	ncurses-devel \
	openssl \
	openssl-devel \
	python3 \
	python3-devel \
	;

# CMake 3.20.4
RUN mkdir -p /home/package/cmake \
	&& curl -L https://github.com/Kitware/CMake/releases/download/v3.20.4/cmake-3.20.4.tar.gz -o /home/package/cmake/cmake-3.20.4.tar.gz \
	&& tar -zxvf /home/package/cmake/cmake-3.20.4.tar.gz -C /home/package/cmake \
	&& cd /home/package/cmake/cmake-3.20.4 && ./bootstrap && make && make install \
	&& cd / && rm -rf /home/package/cmake/cmake-3.20.4 \
	;

# Flex 2.6.4
RUN mkdir -p /home/package/flex \
	&& curl -L https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz -o /home/package/flex/flex-2.6.4.tar.gz \
	&& tar -zxvf /home/package/flex/flex-2.6.4.tar.gz -C /home/package/flex \
	&& cd /home/package/flex/flex-2.6.4 && ./configure && make && make install \
	&& cd / && rm -rf /home/package/flex/flex-2.6.4 \
	;

# Bison 3.7.6
RUN mkdir -p /home/package/bison \
	&& curl -L https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz -o /home/package/bison/bison-3.7.6.tar.xz \
	&& tar -Jxvf /home/package/bison/bison-3.7.6.tar.xz -C /home/package/bison \
	&& cd /home/package/bison/bison-3.7.6 && ./configure && make && make install \
	&& cd / && rm -rf /home/package/bison/bison-3.7.6 \
	;

# Artistic Style 3.1
RUN mkdir -p /home/package/astyle/astyle-3.1 \
	&& curl -L https://jaist.dl.sourceforge.net/project/astyle/astyle/astyle%203.1/astyle_3.1_linux.tar.gz -o /home/package/astyle/astyle_3.1_linux.tar.gz \
	&& tar -zxvf /home/package/astyle/astyle_3.1_linux.tar.gz -C /home/package/astyle/astyle-3.1 --strip-components=1 \
	&& cd /home/package/astyle/astyle-3.1 && cmake . && make && make install \
	;

RUN yum install -y java-11-openjdk java-11-openjdk-devel

COPY adoptopenjdk.repo /etc/yum.repos.d/adoptopenjdk.repo
RUN yum install -y adoptopenjdk-8-hotspot
RUN yum install -y adoptopenjdk-11-hotspot

RUN yum clean all \
	&& rm -rf /var/cache/yum \
	&& rm -rf /var/log/* \
	&& rm -rf /tmp/* \
	;

RUN yum makecache

# Disable
RUN systemctl disable NetworkManager.service
RUN systemctl disable network.service
RUN systemctl disable firewalld.service

# Enable
RUN systemctl enable sshd.service
RUN systemctl enable cockpit.socket

COPY limits.conf   /etc/security/limits.conf
COPY 20-nproc.conf /etc/security/limits.d/20-nproc.conf

COPY .custom_profile /root/.custom_profile
COPY .custom_profile /etc/skel/.custom_profile

RUN echo -e "\nsource ~/.custom_profile" >> /root/.bash_profile
RUN echo -e "\nsource ~/.custom_profile" >> /root/.bashrc
RUN echo -e "\nsource ~/.custom_profile" >> /etc/skel/.bash_profile
RUN echo -e "\nsource ~/.custom_profile" >> /etc/skel/.bashrc

COPY package/cmake.sh  /home/package/cmake/cmake.sh
COPY package/flex.sh   /home/package/flex/flex.sh
COPY package/bison.sh  /home/package/bison/bison.sh
COPY package/astyle.sh /home/package/astyle/astyle.sh

RUN echo "root:password" | chpasswd

ENTRYPOINT ["/usr/sbin/init"]
