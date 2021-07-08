FROM 192.168.2.253:5000/development/centos-systemd:7

RUN    sed -i "s/^enabled=1/enabled=0/" /etc/yum/pluginconf.d/fastestmirror.conf \
     ; sed -i "s/^override_install_langs=en_US.utf8/# override_install_langs=en_US.utf8/" /etc/yum.conf \
     ; sed -i "s/^tsflags=nodocs/# tsflags=nodocs/" /etc/yum.conf

RUN    yum install -y epel-release \
     ; yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm \
     ; yum install -y https://repo.ius.io/ius-release-el7.rpm \

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

RUN    yum update -y \
     ; yum install -y cockpit cockpit-dashboard

# Group-Id: development
RUN yum groups install -y "Development Tools" --setopt=group_package_types=mandatory,default,optional
# # Mandatory Packages: ALL
# RUN    yum install -y \
#                       autoconf \
#                       automake \
#                       binutils \
#                       bison \
#                       flex \
#                       gcc \
#                       gcc-c++ \
#                       gettext \
#                       libtool \
#                       make \
#                       patch \
#                       pkgconfig \
#                       redhat-rpm-config \
#                       rpm-build \
#                       rpm-sign \
# # Default Packages: ALL
#      ; yum install -y \
#                       byacc \
#                       cscope \
#                       ctags \
#                       diffstat \
#                       doxygen \
#                       elfutils \
#                       gcc-gfortran \
#                       git \
#                       indent \
#                       intltool \
#                       patchutils \
#                       rcs \
#                       subversion \
#                       swig \
#                       systemtap \
# # Optional Packages: ALL
#      ; yum install -y \
#                       ElectricFence \
#                       ant \
#                       babel \
#                       bzr \
#                       ccache \
#                       chrpath \
#                       clips \
#                       clips-devel \
#                       clips-doc \
#                       clips-emacs \
#                       clips-xclips \
#                       clipsmm-devel \
#                       clipsmm-doc \
#                       cmake \
#                       cmucl \
#                       colordiff \
#                       compat-gcc-44 \
#                       compat-gcc-44-c++ \
#                       cvs \
#                       cvsps \
#                       darcs \
#                       dejagnu \
#                       email2trac \
#                       expect \
#                       ftnchek \
#                       gcc-gnat \
#                       gcc-objc \
#                       gcc-objc++ \
#                       ghc \
#                       git \
#                       haskell-platform \
#                       imake \
#                       javapackages-tools \
#                       ksc \
#                       lua \
#                       mercurial \
#                       mock \
#                       mod_dav_svn \
#                       nasm \
#                       nqc \
#                       nqc-doc \
#                       ocaml \
#                       perltidy \
#                       qgit \
#                       rpmdevtools \
#                       rpmlint \
#                       sbcl \
#                       scorep \
#                       systemtap-sdt-devel \
#                       systemtap-server \
#                       trac \
#                       trac-git-plugin \
#                       trac-mercurial-plugin \
#                       trac-webadmin \
#                       translate-toolkit \
#                       ;

# Group-Id: base
# RUN yum groups install -y "Base" --setopt=group_package_types=mandatory,default

# Mandatory Packages:
RUN    yum install -y \
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
# Default Packages:
     ; yum install -y \
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
     ; yum install -y hunspell-ko

# Group-Id: core
# RUN yum groups install -y "Core" --setopt=group_package_types=mandatory

# Mandatory Packages:
RUN    yum install -y \
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
                      openssl-devel \

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

RUN    yum install -y python3 \
                      python3-devel

RUN    rpm -e --nodeps git perl-Git \
    && yum install -y git224 \
    && yum install -y cmake3

RUN    yum clean all \
    && yum makecache

RUN yum remove -y scorep-\*

RUN    systemctl disable avahi-daemon.service \
                         kdump.service \
                         NetworkManager.service \
                         network.service \
                         firewalld.service \
    && systemctl enable  cockpit.socket \
                         sshd.service

# Artistic Style 3.1
#   - make uninstall: `xargs rm < /usr/local/src/astyle_3.1_linux/install_manifest.txt`
RUN    mkdir -p /usr/local/src/astyle_3.1_linux \
    && curl -L https://jaist.dl.sourceforge.net/project/astyle/astyle/astyle%203.1/astyle_3.1_linux.tar.gz -o /usr/local/src/astyle_3.1_linux.tar.gz \
    && tar -zxvf /usr/local/src/astyle_3.1_linux.tar.gz -C /usr/local/src/astyle_3.1_linux --strip-components=1 \
    && cd /usr/local/src/astyle_3.1_linux && cmake3 .&& make && make install

RUN    rm -rf /etc/localtime \
    && ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime

###############################################################################################################################################################

# Reference:
# RFC3339
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
      org.opencontainers.image.url="hhttps://github.com/youngjinj/dev-server.git" \
      org.opencontainers.image.version=$VERSION \
      org.opencontainers.image.revision=$REVISION \
      org.opencontainers.image.vendor="CUBRID" \
      org.opencontainers.image.ref.name=$REF_NAME
