# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=whois
pkgver=4.7.24
pkgrel=1
pkgdesc="The whois client by Marco d'Itri"
arch=(i686 x86_64)
license=('GPL')
depends=('glibc')
makedepends=('perl')
source=(http://ftp.debian.org/debian/pool/main/w/whois/${pkgname}_$pkgver.tar.gz)
url="http://www.linux.it/~md/software/"

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/usr/bin $startdir/pkg/usr/share/man/man1
  sed 's|INSTALL= /usr|INSTALL= |' -i po/Makefile
  make prefix=/usr || return 1
  make prefix=/usr BASEDIR=$startdir/pkg install
}
md5sums=('479ebc79d1e8189e16ab51b4d8981529')
