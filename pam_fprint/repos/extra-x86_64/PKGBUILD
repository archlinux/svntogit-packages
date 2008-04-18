# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>

pkgname=pam_fprint
pkgver=0.2
pkgrel=1
pkgdesc="pam module for fingerprint authentication"
arch=('i686' 'x86_64')
url="http://reactivated.net/fprint/wiki/Main_Page"
groups=('fprint')
license=('LGPL')
depends=('libfprint' 'pam')
source=(http://downloads.sourceforge.net/sourceforge/fprint/$pkgname-$pkgver.tar.bz2)
md5sums=('abfb041ed856aaac5c5c416973451226 ')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
