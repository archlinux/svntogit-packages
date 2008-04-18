# $Id$
# Maintainer: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Todd Musall <tmusall@comcast.net>
pkgname=at
pkgver=3.1.10
pkgrel=1
pkgdesc="AT and batch delayed command scheduling utility and daemon."
arch=(i686 x86_64)
url="http://www.debian.org"
depends=('pam')
backup=('etc/at.deny')
source=(http://ftp.debian.org/debian/pool/main/a/at/at_$pkgver.tar.gz atd)
md5sums=('6e5857e23b3c32ea6995fb7f8989987e' '35574e34829e7df07a3269d4ab646a29')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --with-jobdir=/var/spool/atd \
              --with-atspool=/var/spool/atd
  make || return 1
  make IROOT=$startdir/pkg install
  install -D -m755 ../atd $startdir/pkg/etc/rc.d/atd
}
