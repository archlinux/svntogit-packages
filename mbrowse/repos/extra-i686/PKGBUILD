# Contributor: Tom K <tomk@runbox.com>
pkgname=mbrowse
pkgver=0.3.1
pkgrel=2
pkgdesc="A SNMP MIB browser based on GTK and net-snmp."
depends=('gtk' 'net-snmp>=5.4')
arch=('i686')
license="GPL"
url="http://www.kill-9.org/mbrowse"
source=(http://www.kill-9.org/mbrowse/mbrowse-$pkgver.tar.gz gcc.patch)
md5sums=('52c6b0a7ad9bcc7be70a35ed6b0d0d89' '7a05ce5d207ae3200c186db35b8eb206')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../gcc.patch
  ./configure --prefix=/usr --disable-gtktest --with-snmp-type=net
  make || return 1
  make DESTDIR=$startdir/pkg install
}
