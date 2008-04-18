# $Id$
# Contributor: Ben <ben@benmazer.net>
# Maintainer: damir <damir@archlinux.org>

pkgname=cln
pkgver=1.2.0
pkgrel=1
pkgdesc="Class library for numbers"
arch=("i686" "x86_64")
url="http://www.ginac.de/CLN/"
license=('GPL')
options=('!libtool')
depends=('gmp' 'bash')
neededpatches=()
source=("ftp://ftpthep.physik.uni-mainz.de/pub/gnu/$pkgname-$pkgver.tar.bz2")
md5sums=('d30bca7c30e61985cf67b3f97e019786')

build() {
  cd $startdir/src/$pkgname-$pkgver
    for patch in $neededpatches ; do
        cat $startdir/src/$patch | patch -p1 || return 1
    done
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}

