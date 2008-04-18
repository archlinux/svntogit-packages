# $Id$
# Maintainer: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=unixodbc
pkgver=2.2.12
pkgrel=1
pkgdesc="ODBC is an open specification for providing application developers with a predictable API with which to access Data Sources"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.unixodbc.org/"
backup=('etc/odbc.ini' 'etc/odbcinst.ini')
depends=('readline')
source=(http://www.unixodbc.org/unixODBC-$pkgver.tar.gz)
md5sums=('9a116aad4059c31d231b626ffdf1869a')

build() {
  cd $startdir/src/unixODBC-$pkgver
  sed -i 's/YY_FLUSH_BUFFER/yy_flush_buffer(YY_CURRENT_BUFFER)/' sqp/lex.l
  ./configure --prefix=/usr --sysconfdir=/etc --enable-gui=no
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
