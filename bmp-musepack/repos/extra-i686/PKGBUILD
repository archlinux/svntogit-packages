# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Nikos Kouremenos <nk@ebox.gr>

pkgname=bmp-musepack
pkgver=1.2
pkgrel=2
pkgdesc="A BMP plugin for playing sounds in Musepack (MPC) format"
arch=(i686 x86_64)
depends=('bmp' 'libmpcdec>=1.2.5' 'taglib')
groups=('bmp-plugins' 'bmp-io-plugins')
options=('nolibtool')
url="http://musepack.net/"
source=(http://files.musepack.net/linux/plugins/${pkgname}-${pkgver}.tar.bz2)
md5sums=('5fe0c9d341ca37d05c780a478f829a5f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
