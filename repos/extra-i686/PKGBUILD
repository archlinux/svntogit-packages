# $Id$
# Maintainer: Simo Leone <simo@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=aspell-nl
pkgver=0.50
pkgrel=3
pkgdesc="Dutch dictionary for aspell"
depends=('aspell')
url="http://aspell.net/"
source=(ftp://ftp.gnu.org/gnu/aspell/dict/nl/$pkgname-0.50-2.tar.bz2)
md5sums=('c3ef9fd7dc4c47d816eee9ef5149c76a')

build() {
  cd $startdir/src/$pkgname-0.50-2
  ./configure
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install
}
# vim: ts=2 sw=2 et ft=sh
