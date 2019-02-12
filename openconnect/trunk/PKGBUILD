# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=openconnect
pkgver=8.02
pkgrel=1
epoch=1
pkgdesc='Open client for Cisco AnyConnect VPN'
url='https://www.infradead.org/openconnect.html'
arch=('x86_64')
license=('LGPL2.1')
depends=('libxml2' 'gnutls' 'libproxy' 'vpnc' 'krb5' 'lz4' 'pcsclite')
makedepends=('intltool' 'python2')
optdepends=('python2: tncc-wrapper')
provides=('libopenconnect.so')
options=('!emptydirs')
source=(ftp://ftp.infradead.org/pub/openconnect/openconnect-${pkgver}.tar.gz{,.asc})
sha256sums=('1ca8f2c279f12609bf061db78b51e5f913b3bce603a0d4203230a413d8dfe012'
            'SKIP')
validpgpkeys=('BE07D9FD54809AB2C4B0FF5F63762CDA67E2F359') # David Woodhouse <dwmw2@infradead.org>

build() {
  cd ${pkgname}-${pkgver}
  PYTHON=/usr/bin/python2 \
    ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --disable-static
  make
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
