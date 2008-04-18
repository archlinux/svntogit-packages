# $Id$
# Maintainer: damir <damir@archlinux.org>
pkgname=abcm2ps
pkgver=4.12.30
pkgrel=1
pkgdesc="abcm2ps is a command line program which converts ABC to music sheet in PostScript format. It is an extension of abc2ps which may handle many voices per staff."
arch=('i686' 'x86_64')
url="http://moinejf.free.fr/"
license=('GPL')
depends=('glibc')
source=(http://moinejf.free.fr/$pkgname-$pkgver.tar.gz)
md5sums=('fed5c486509b1c2f569a1e5216fa7890')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr docdir=$startdir/pkg/usr/doc install
}

