# $Id$
# Contributor: John Proctor <jproctor@prium.net>
# Maintainer: Jason Chu <jason@archlinux.org>
pkgname=ctags
pkgver=5.7
pkgrel=1
pkgdesc="Generates an index file of language objects found in source files"
arch=(i686 x86_64)
license=('GPL')
depends=('glibc')
url="http://ctags.sourceforge.net/"
source=(http://umn.dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('643cab63b39c8a24377dc4c781547d40')

build() {
  cd $startdir/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
