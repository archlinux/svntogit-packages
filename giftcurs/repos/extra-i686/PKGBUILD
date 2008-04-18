# $Id$
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=giftcurs
pkgver=0.6.2
pkgrel=1
pkgdesc="A curses frontend to the giFT daemon."
makedepends=('gpm')
depends=('ncurses' 'gift' 'glib2')
install="$pkgname.install"
url="http://www.nongnu.org/giftcurs/"
source=(http://fnord.csbnet.se/$pkgname/giFTcurs-$pkgver.tar.gz \
        rungift)
md5sums=('9a34b924ea10ce0a1d62441ee2bacfff' \
         '39ea35aec64533100b9c79e47dedd3a1')

build() {
  cd $startdir/src/giFTcurs-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m755 $startdir/rungift \
    $startdir/pkg/usr/bin/rungift
}
