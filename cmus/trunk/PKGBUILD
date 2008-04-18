# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=cmus
pkgver=2.2.0
pkgrel=4
pkgdesc="A very feature-rich ncurses-based music player"
url="http://cmus.sourceforge.net/"
arch=(i686 x86_64)
license=('GPL')
# namcap assured me it was safe to remove ncurses and the like... /shrug
depends=(libao libmpcdec ffmpeg flac libmad)
source=(http://mirror.greaterscope.net/cmus/$pkgname-$pkgver.tar.bz2)
md5sums=('7a9895ecfc10cd16577c73051436962f')

build() {
  cd $startdir/src/$pkgname-$pkgver
  export CONFIG_ARTS=n
  ./configure prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
