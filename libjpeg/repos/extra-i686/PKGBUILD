# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=libjpeg
pkgver=6b
pkgrel=4
pkgdesc="Library of JPEG support functions"
depends=('glibc')
source=(ftp://ftp.uu.net/graphics/jpeg/jpegsrc.v$pkgver.tar.gz)
md5sums=('dbd5f3b47ed13132f04c685d608a7547')

build() {
  cd $startdir/src/jpeg-$pkgver
  ./configure --prefix=/usr --enable-shared --enable-static
  make || return 1
  mkdir -p $startdir/pkg/usr/{bin,lib,include,man/man1}
  make prefix=$startdir/pkg/usr install

  find $startdir/pkg -name '*.la' -exec rm {} \;
}
