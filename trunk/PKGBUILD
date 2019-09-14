# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=openconnect
pkgver=8.05
pkgrel=1
epoch=1
pkgdesc='Open client for Cisco AnyConnect VPN'
url='https://www.infradead.org/openconnect/'
arch=('x86_64')
license=('LGPL2.1')
depends=('libxml2' 'gnutls' 'libproxy' 'vpnc' 'krb5' 'lz4' 'pcsclite'
         'stoken' 'libstoken.so')
makedepends=('intltool' 'python2')
optdepends=('python2: tncc-wrapper')
provides=('libopenconnect.so')
options=('!emptydirs')
source=(ftp://ftp.infradead.org/pub/openconnect/openconnect-${pkgver}.tar.gz{,.asc})
sha256sums=('335c2952d0cb36822acb112eaaf5e3b4acffc6874985fb614fec0b76c4c12992'
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
