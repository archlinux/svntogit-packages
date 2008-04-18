# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=rcs
pkgver=5.7
pkgrel=3
pkgdesc="Revision Control System"
url="http://www.cs.purdue.edu/homes/trinkle/RCS/"
depends=('glibc')
source=(http://www.cs.purdue.edu/homes/trinkle/RCS/rcs-$pkgver.tar.Z \
        rcs-5.7.patch)
md5sums=('423282f0edb353296d9f3498ab683abf' '7ae4b7cb79259ccdf5eee0ab94fe2a2a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../rcs-5.7.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
