# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=tin
pkgver=1.8.3
pkgrel=2
pkgdesc="Curses based threaded NNTP and spool based UseNet newsreader"
arch=(i686 x86_64)
url="http://www.tin.org"
license=('BSD')
depends=('ncurses' 'libidn' "icu>=3.8")
source=(ftp://ftp.tin.org/pub/news/clients/tin/stable/$pkgname-$pkgver.tar.bz2 LICENSE)
md5sums=('e6ed45205020665c097556822b0d575b' '22de35b1bdc6f0df87c93ae794198b21')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make build || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install
  rm -f $startdir/pkg/usr/man/man5/mbox.5
  rm -f $startdir/pkg/usr/man/man5/mmdf.5
  mv  $startdir/pkg/usr/bin/url_handler.sh  $startdir/pkg/usr/bin/tin_url_handler.sh
  install -D -m644 ../LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
