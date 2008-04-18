# $Id$
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>

pkgname=dia
pkgver=0.96.1
pkgrel=1
pkgdesc="DIAgram editor"
arch=(i686 x86_64)
license=('GPL')
depends=('gtk2' 'libart-lgpl' 'popt' 'libxslt' 'desktop-file-utils' 'scrollkeeper')
makedepends=('intltool' 'perlxml')
source=(ftp://ftp.gnome.org/pub/gnome/sources/$pkgname/0.96/$pkgname-$pkgver.tar.bz2)
md5sums=('7b81b22baa2df55efe4845865dddc7b6')
install=dia.install
url="http://www.gnome.org/projects/dia/"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  mv ${startdir}/pkg/usr/share/help/dia ${startdir}/pkg/usr/share/dia/help
  rm -r ${startdir}/pkg/usr/share/help
}

