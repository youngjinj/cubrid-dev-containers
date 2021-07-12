FROM 192.168.2.253:5000/development/centos-systemd:7

RUN    sed -i "s/^enabled=1/enabled=0/" /etc/yum/pluginconf.d/fastestmirror.conf \
     ; sed -i "s/^override_install_langs=en_US.utf8/# override_install_langs=en_US.utf8/" /etc/yum.conf \
     ; sed -i "s/^tsflags=nodocs/# tsflags=nodocs/" /etc/yum.conf

RUN    rm -f /var/lib/rpm/__* \
     ; rpm --rebuilddb -v -v \
     ; yum clean all \
     ; yum makecache \

RUN    yum install -y deltarpm \
                      yum-utils \
     ; yum update -y

RUN    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
                      https://rpms.remirepo.net/enterprise/remi-release-7.rpm \
                      https://repo.ius.io/ius-release-el7.rpm \
    && sed -i "s/^#\(baseurl.*\)/\1/" /etc/yum.repos.d/epel.repo \
    && sed -i "s/^\(metalink.*\)/# \1/" /etc/yum.repos.d/epel.repo

# Reference:
# CentOS Docker build scripts
#   - https://github.com/CentOS/sig-cloud-instance-build/blob/master/docker/centos-7-x86_64.ks

# Reference:
# Fedora Remix for Windows Subsystem for Linux (WSL)
#   - https://www.whitewaterfoundry.com/fedora-remix-for-wsl
#   - https://github.com/WhitewaterFoundry/Fedora-Remix-for-WSL
#
# The following packages have been removed from the default install of Fedora Remix for WSL:
#   - dracut
#   - e2fsprogs
#   - fedora-logos
#   - fedora-release
#   - fedora-release-notes
#   - firewalld
#   - grub
#   - iprutils
#   - kernel
#   - linux-firmware
#   - parted
#   - plymouth
#   - policycoreutils
#   - ppc64-utils
#   - selinux-policy
#   - sendmail
#   - sssd

RUN yum install -y man \
                   man-pages \
                   kernel-doc

# KSC (Kernel Source Checker)
#   - The Linux Kernel Module Source Checker (ksc) is a tool to check for non whitelist symbols in a given kernel module.

# VCS (Version Control System)
#   - CVCS (Centralized Version Control System): CVS, Subversion, Perforce
#   - DVCS (Distributed Version Control System): Git, Mecurial, Bazaar(bzr), Darcs, Monotone

# Haskell: ghc, haskell-platform
#   - https://www.haskell.org/
#   - https://www.haskell.org/ghc/
#   - https://www.haskell.org/platform/
#   - Haskell is a modern, standard, non-strict, purely-functional programming language.

# CMUCL
#   - https://www.cons.org/cmucl/
#   - CMUCL is a free implementation of the Common Lisp programming language which runs on most major Unix platforms.

# SBCL (Steel Bank Common Lisp)
#   - http://www.sbcl.org/
#   - Steel Bank Common Lisp (SBCL) is a high performance Common Lisp compiler.

# Lua
#   - https://www.lua.org/
#   - Lua is a powerful, efficient, lightweight, embeddable scripting language.

# NQC (Not Quite C)
#   - http://bricxcc.sourceforge.net/nqc/
#   - Not Quite C is a simple language with a C-like syntax that can be used to program Lego's RCX programmable brick (from the Mindstorms set).

# OCaml (Objective Caml)
#   - https://ocaml.org/
#   - OCaml is a general purpose programming language with an emphasis on expressiveness and safety.

# Trac
#   - https://trac.edgewall.org/
#   - Trac is an enhanced wiki and issue tracking system for software development projects.

# Babel
#   - http://babel.pocoo.org/
#   - Babel includes a command-line interface for working with message catalogs, similar to the various GNU gettext tools commonly available on Linux/Unix systems. 

# CLIPS (C Language Integrated Production System)
#   - http://www.clipsrules.net/
#   - the C Language Integrated Production System (CLIPS) is a rule-based programming language useful for creating expert systems and other programs where a heuristic solution is easier to implement and maintain than an algorithmic solution.

# Group-Id: development
# RUN yum groupinstall -y "Development Tools" --setopt=group_package_types=mandatory,default,optional
# # Mandatory Packages:
RUN yum install -y \
                   autoconf \
                   automake \
                   binutils \
                   bison \
                   flex \
                   gcc \
                   gcc-c++ \
                   gettext \
                   libtool \
                   make \
                   patch \
                   pkgconfig \
                   redhat-rpm-config \
                   rpm-build \
                   rpm-sign \
# Default Packages:
                   byacc \
                   cscope \
                   ctags \
                   diffstat \
                   doxygen \
                   elfutils \
                   gcc-gfortran \
                   git \
                   indent \
                   intltool \
                   patchutils \
                   rcs \
                   # subversion \
                   swig \
                   systemtap \
# Optional Packages:
                   ElectricFence \
                   ant \
                   # babel \
                   # bzr \
                   ccache \
                   chrpath \
                   # clips \
                   # clips-devel \
                   # clips-doc \
                   # clips-emacs \
                   # clips-xclips \
                   # clipsmm-devel \
                   # clipsmm-doc \
                   cmake \
                   # cmucl \
                   colordiff \
                   compat-gcc-44 \
                   compat-gcc-44-c++ \
                   # cvs \
                   # cvsps \
                   # darcs \
                   dejagnu \
                   # email2trac \
                   expect \
                   ftnchek \
                   gcc-gnat \
                   gcc-objc \
                   gcc-objc++ \
                   # ghc \
                   git \
                   # haskell-platform \
                   imake \
                   javapackages-tools \
                   # ksc \
                   # lua \
                   # mercurial \
                   mock \
                   # mod_dav_svn \
                   nasm \
                   # nqc \
                   # nqc-doc \
                   # ocaml \
                   perltidy \
                   qgit \
                   rpmdevtools \
                   rpmlint \
                   # sbcl \
                   # scorep \
                   systemtap-sdt-devel \
                   systemtap-server \
                   # trac \
                   # trac-git-plugin \
                   # trac-mercurial-plugin \
                   # trac-webadmin \
                   # translate-toolkit \
                   ;

# Group-Id: base
# RUN yum groupinstall -y "Base" --setopt=group_package_types=mandatory,default
# Mandatory Packages:
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
# Deult Packages:
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
                   # ntpdate \
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
# Optional Packages: NULL
# Conditional Packages: NULL
                   hunspell-ko \
                   ;

# Group-Id: core
# RUN yum groupinstall -y "Core" --setopt=group_package_types=mandatory
# Mandatory Packages:
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
                   passwd \
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
                   # tuned \
                   util-linux \
                   vim-minimal \
                   xfsprogs \
                   yum \
# Default Packages: NULL
# Optional Packages: NULL
                   ;

RUN    yum install -y centos-release-scl \
     ; yum install -y devtoolset-8-\* \
                      elfutils-libelf-devel \
                      ncurses-devel \
                      openssl \
                      openssl-devel

RUN    yum install -y java-1.8.0-openjdk \
                      java-1.8.0-openjdk-devel \
                      java-11-openjdk \
                      java-11-openjdk-devel

RUN    set -x \
    && echo $'[AdoptOpenJDK] \
\nname=AdoptOpenJDK \
\nbaseurl=http://adoptopenjdk.jfrog.io/adoptopenjdk/rpm/centos/$releasever/$basearch \
\nenabled=1 \
\ngpgcheck=1 \
\ngpgkey=https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public' > /etc/yum.repos.d/adoptopenjdk.repo \
    && yum install -y adoptopenjdk-8-hotspot \
                      adoptopenjdk-11-hotspot

RUN yum install -y python3 \
                   python3-devel

RUN yum install -y cgdb \
                   cmake3 \
                   glances \
                   htop \
                   jq \
                   maven \
                   samba \
                   telnet \
                   zsh

RUN yum install -y dh-autoreconf \
                   curl-devel \
                   expat-devel \
                   gettext-devel \
                   openssl-devel \
                   perl-devel \
                   zlib-devel \
                   asciidoc \
                   xmlto \
                   docbook2X

RUN yum install -y cockpit \
                   cockpit-dashboard

RUN    systemctl disable avahi-daemon.service \
                         kdump.service \
                         NetworkManager.service \
                         firewalld.service \
    && systemctl enable  cockpit.socket \
                         sshd.service

# Git 2.32.0
RUN    mkdir -p /usr/local/src/git-2.32.0 \
    && curl -L https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.32.0.tar.xz -o /usr/local/src/git-2.32.0.tar.xz \
    && tar -Jxvf /usr/local/src/git-2.32.0.tar.xz -C /usr/local/src/git-2.32.0 --strip-components=1 \
    && ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi \
    && cd /usr/local/src/git-2.32.0 && make configure && ./configure && make all doc info && sudo make install install-doc install-html install-info

# Artistic Style 3.1
#   - make uninstall: `xargs rm < /usr/local/src/astyle_3.1_linux/install_manifest.txt`
RUN    mkdir -p /usr/local/src/astyle_3.1_linux \
    && curl -L https://jaist.dl.sourceforge.net/project/astyle/astyle/astyle%203.1/astyle_3.1_linux.tar.gz -o /usr/local/src/astyle_3.1_linux.tar.gz \
    && tar -zxvf /usr/local/src/astyle_3.1_linux.tar.gz -C /usr/local/src/astyle_3.1_linux --strip-components=1 \
    && cd /usr/local/src/astyle_3.1_linux && cmake3 . && make && make install

# CPPCHECK 2.4.1
RUN mkdir -p /usr/local/src/cppcheck/cppcheck-2.4.1 \
        && curl -L https://github.com/danmar/cppcheck/archive/2.4.1.tar.gz -o /usr/local/src/cppcheck/2.4.1.tar.gz \
        && tar -zxvf /usr/local/src/cppcheck/2.4.1.tar.gz -C /usr/local/src/cppcheck/cppcheck-2.4.1 --strip-components=1 \
        && cd /usr/local/src/cppcheck/cppcheck-2.4.1 \
        && make -j4 SRCDIR=build CFGDIR=cfg CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function" \
        ;

### For Dev1-team
#mysql, zsh, telnet, samba
RUN yum install -y http://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm

RUN yum install -y \
  zsh \
  telnet \
  samba \
  mysql-community-server \
  ;

COPY smb.conf /etc/samba/smb.conf

##USE RVM
RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import - \
       && curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import - \
       && curl -sSL https://get.rvm.io | bash -s stable \
       && /usr/local/rvm/bin/rvm reload \
       && /usr/local/rvm/bin/rvm requirements run \
       && /usr/local/rvm/bin/rvm install 2.6.5 \
       ;

# PHP 7.4
RUN yum --enablerepo=remi-php74 install -y php php-common php-devel php-bcmath php-gd php-pdo php-pear php-mysqlnd php-mbstring php-xml php-tidy php-soap
COPY package/php.sh /usr/local/scripts/php.sh

# For Manual
RUN /usr/bin/pip3 install sphinx==1.7.9 && /usr/bin/pip3 install sphinx_rtd_theme

### End For Dev1-team

RUN    rm -rf /etc/localtime \
    && ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime

RUN    sed -i "s/^#RemoveIPC=no/RemoveIPC=no/" /etc/systemd/logind.conf

###############################################################################################################################################################

# Reference:
# ISO 8601, RFC 3339
#   - Command: $(date -u +'%Y-%m-%dT%H:%M:%SZ')
ARG CREATED

# Reference:
# Semantic Versioning Specification (SemVer)
#  - https://semver.org
#
# A normal version number MUST take the form X.Y.Z where X, Y, and Z are non-negative integers, and MUST NOT contain leading zeroes.
ARG VERSION

# Git commit ID
#   - Command: $(git log -1 --format=%h)
ARG REVISION

# Docker Image Tag
#   - Command: $(git symbolic-ref -q --short HEAD)
#   - or Command: $(git describe --tags --exact-match)
ARG REF_NAME

# Reference:
# OCI Image Format Specification
#   - https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.created=$CREATED \
      org.opencontainers.image.authors="youngjinj@cubrid.com" \
      org.opencontainers.image.url="https://github.com/youngjinj/cubrid-dev-containers.git" \
      org.opencontainers.image.version=$VERSION \
      org.opencontainers.image.revision=$REVISION \
      org.opencontainers.image.vendor="CUBRID" \
      org.opencontainers.image.ref.name=$REF_NAME \
      org.opencontainers.image.title="CUBRID Development Base Image"
