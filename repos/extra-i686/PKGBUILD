# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
pkgname=libxslt
pkgver=1.1.22
pkgrel=1
pkgdesc="XML stylesheet transformation library"
arch=(i686 x86_64)
license=('custom')
depends=('libxml2>=2.6.30' 'libgcrypt')
makedepends=('python>=2.5')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/1.1/${pkgname}-${pkgver}.tar.bz2)
url="http://xmlsoft.org/XSLT/"
md5sums=('f2061dddea77257488601e20e2f3b5a7')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
