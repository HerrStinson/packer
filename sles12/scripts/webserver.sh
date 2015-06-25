#!/bin/bash

REPO1="http://10.0.2.2:8080/DVD1"
REPO2="http://10.0.2.2:8080/DVD2"

SRCRPMS="libmcrypt tidy"

if ! zypper lr | grep -q SDK; then
  zypper addrepo $REPO1 'SLES12-SDK DVD1'
  zypper addrepo $REPO1 'SLES12-SDK DVD2'
fi

for srcrpm in $SRCRPMS; do
  if ! rpm -qa | grep -q $srcrpm; then
    zypper --quiet --non-interactive si $srcrpm
    cd /usr/src/packages/SPECS
    rpmbuild --quiet -bb ${srcrpm}.spec 2>&1 >/dev/null
    zypper --quiet --non-interactive install /usr/src/packages/RPMS/x86_64/*${srcrpm}*.rpm
  fi
done

zypper --quiet --non-interactive install --no-recommends \
  ImageMagick-devel \
  freetype-devel \
  freetype2-devel \
  libXpm-devel \
  libbz2-devel \
  libcurl-devel \
  libicu-devel \
  libjpeg8-devel \
  libmjpegutils-devel \
  libopenssl-devel \
  libpng16-devel \
  libtidyp-devel \
  libvpx-devel \
  libxml2-devel \
  libxslt-devel \
  libzio-devel \
  libzip-devel \
  lua51-devel \
  mozilla-nss-devel \
  pcre-devel \
  rpm-build \
  zlib-devel
