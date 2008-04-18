# $Id$
# Contributer: Jason Chu <jchu@xentac.net>
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=ices
pkgver=2.0.1
pkgrel=1
pkgdesc="Encoding application for icecast server"
depends=('libshout' 'alsa-lib' 'libxml2')
source=(http://downloads.us.xiph.org/releases/ices/${pkgname}-${pkgver}.tar.gz)
url="http://www.icecast.org/"

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make DESTDIR=${startdir}/pkg install
  mkdir -p ${startdir}/pkg/usr/share/ices
  cp conf/*.xml ${startdir}/pkg/usr/share/ices
}
md5sums=('0d95ac34d59fed337028d5e7771076d8')
