# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
pkgname=gftp
pkgver=2.0.18
pkgrel=2
pkgdesc="A multithreaded ftp client for X Windows"
arch=(i686 x86_64)
depends=('gtk2' 'openssl' 'readline')
source=(http://www.gftp.org/$pkgname-$pkgver.tar.bz2)
url="http://www.gftp.org/"
md5sums=('44b19442d06f6dc68c7211d66029d826')

build() {
   cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/usr
   make || return 1
   make DESTDIR=$startdir/pkg install
}
