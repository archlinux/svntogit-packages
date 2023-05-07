# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=openconnect
pkgver=9.10
pkgrel=1
epoch=1
pkgdesc='Open client for Cisco AnyConnect VPN'
url='https://www.infradead.org/openconnect/'
arch=('x86_64')
license=('LGPL2.1')
depends=('libxml2' 'gnutls' 'libproxy' 'vpnc' 'krb5' 'lz4' 'pcsclite'
         'stoken' 'tpm2-tss' 'oath-toolkit' 'libproxy' 'libp11-kit'
         'xdg-utils'
         libstoken.so libtss2-esys.so libtss2-mu.so libtss2-tctildr.so
         libxml2.so libproxy.so libhogweed.so libp11-kit.so libpskc.so
         libgssapi_krb5.so libpcsclite.so)
makedepends=('intltool' 'python')
checkdepends=('python-flask')
optdepends=('python: tncc-wrapper')
provides=('libopenconnect.so')
options=('!emptydirs')
source=(https://www.infradead.org/openconnect/download/openconnect-${pkgver}.tar.gz{,.asc})
sha256sums=('f1e0c4eed0ba79b87d6a0406a1500775c145c7b8392fa82094fc3e37dfab6547'
            'SKIP')
validpgpkeys=('BE07D9FD54809AB2C4B0FF5F63762CDA67E2F359') # David Woodhouse <dwmw2@infradead.org>

build() {
  cd ${pkgname}-${pkgver}
  PYTHON=/usr/bin/python \
    ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
