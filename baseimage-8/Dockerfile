FROM 192.168.2.253:5000/development/centos-systemd:8.4.2105

RUN dnf -y --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos && \
    dnf -y distro-sync

COPY dnf_requirements.txt dnf_requirements.txt

RUN dnf -y install 'dnf-command(config-manager)' && \
    dnf -y config-manager --set-enabled powertools && \
    dnf -y install epel-release && \
    dnf -y install epel-next-release && \
    dnf -y group install "Development Tools" && \
    dnf -y install $(cat dnf_requirements.txt) && \
    dnf -y clean all && \
    rm -rf /var/cache/dnf

RUN rm -rf /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime

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
