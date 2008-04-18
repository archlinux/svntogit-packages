# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=obexftp
pkgver=0.20
pkgrel=2
pkgdesc="A tool for transfer files to/from any OBEX enabled device"
arch=(i686 x86_64)
url="http://openobex.triq.net/obexftp/obexftp"
depends=('openobex>=1.2' 'bluez-libs')
source=("http://dl.sourceforge.net/sourceforge/openobex/$pkgname-$pkgver.tar.gz")
md5sums=('085b9edc0504c0d79e7479a54e2018c5')
options=(NOLIBTOOL)

build() {
  #export OPENOBEX_LIBS="-L/usr/lib -lopenobex"
  #export OPENOBEX_CFLAGS="-I/usr/include/openobex/"
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg/ install || return 1

  # remove nasty files
  rm -rf $startdir/pkg/usr/lib/perl5/5.8.8/
  mv $startdir/pkg/usr/lib/perl5/site_perl/5.8.8 $startdir/pkg/usr/lib/perl5/site_perl/current
}
