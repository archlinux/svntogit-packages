# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>

pkgname=mpc
pkgver=0.12.1
pkgrel=3
pkgdesc="A command line tool for MPD"
arch=('i686' 'x86_64')
url="http://musicpd.org"
license="GPL"
depends=('glibc')
source=(http://musicpd.org/uploads/files/$pkgname-$pkgver.tar.gz)
md5sums=('0be8cc9ba282f467631ee0b1b8a0c494')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  # adding bash autocompletition scripts to right place:
  mkdir -p $startdir/pkg/etc/bash_completion.d/
  install -m644 $startdir/src/$pkgname-$pkgver/doc/mpc-bashrc $startdir/pkg/etc/bash_completion.d/mpc
}
