# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=dosfstools
pkgver=2.11
pkgrel=2
pkgdesc="DOS filesystem utilities"
arch=(i686 x86_64)
depends=('glibc')
source=(ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/$pkgname/$pkgname-$pkgver.src.tar.gz linux-2.6.patch)
url="ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/"
md5sums=('407d405ade410f7597d364ab5dc8c9f6' 'f7abc7e0a50c24fb52396e2752ef25e7'\
         '6689fb7693ed213e6c3289b533b4f66d')

build() {
   cd $startdir/src/$pkgname-$pkgver
   patch -p1 -i $startdir/src/linux-2.6.patch
   patch -Np0 -i $startdir/src/dosfstools_$pkgver-1.diff
   make || return 1
   make PREFIX=$startdir/pkg install
}
