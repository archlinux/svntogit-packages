# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>
pkgname=irssi
pkgver=0.8.12
pkgrel=3
pkgdesc="Modular text mode IRC client with Perl scripting"
arch=(i686 x86_64)
license=('GPL')
url="http://irssi.org/"
depends=('glib2' 'openssl' 'ncurses' 'perl>=5.10.0-1')
source=(http://irssi.org/files/$pkgname-$pkgver.tar.bz2)
md5sums=('e407b557b3cfc7c91ce4de2571dd79cb')
options=('!libtool')

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr --enable-ipv6 --with-proxy --sysconfdir=/etc \
  --with-perl-lib=vendor
  make || return 1
  make DESTDIR=$startdir/pkg install
  rm $startdir/pkg/usr/lib/perl5/core_perl/perllocal.pod
}
