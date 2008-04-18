# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=pinentry
pkgver=0.7.3
pkgrel=2
pkgdesc="a collection of simple PIN or passphrase entry dialogs which utilize the Assuan protocol"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnupg.org/aegypten2"
depends=('ncurses' 'libcap')
makedepends=('gtk' 'qt3' 'gtk2')
source=(ftp://ftp.gnupg.org/gcrypt/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  [ "$QTDIR" = "" ] && source /etc/profile.d/qt3.sh
  ./configure --prefix=/usr \
	--enable-pinentry-curses \
	--enable-pinentry-gtk \
	--enable-pinentry-gtk2 \
	--enable-pinentry-qt \
	--enable-fallback-curses
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('59282278405a8264b39ea28678c78cf4')
