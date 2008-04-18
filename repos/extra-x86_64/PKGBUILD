# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=libksba
pkgver=1.0.2
pkgrel=1
pkgdesc="Libksba is a CMS and X.509 access library"
arch=(i686 x86_64)
license=('GPL')
url="ftp://ftp.gnupg.org/gcrypt/alpha/libksba"
depends=('bash' 'libgpg-error' 'glibc')
source=(ftp://ftp.gnupg.org/gcrypt/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('3cccb3ef697e1e69eeceeea0715ff220')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
