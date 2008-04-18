# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=randline
pkgver=20070111
pkgrel=1
pkgdesc="A filter for selecting random lines from text files."
url="http://www.eskimo.com/~scs/src/#randline"
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(ftp://ftp.eskimo.com/u/s/scs/src/$pkgname.tar.gz)
md5sums=('e5dca575e0a11467d0642fdca0cfecfd')

build() {
  cd $startdir/src/$pkgname
  make || return 1
  install -D -m755 randline $startdir/pkg/usr/bin/randline
  install -D -m644 randline.1 $startdir/pkg/usr/man/man1/randline.1
}
