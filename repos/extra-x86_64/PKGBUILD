# $Id: PKGBUILD,v 1.36 2008/01/01 16:32:17 andyrtr Exp $
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=gnupg
pkgver=1.4.8
pkgrel=1
pkgdesc="GNU Privacy Guard - a PGP replacement tool"
arch=(i686 x86_64)
license=('GPL3')
depends=('zlib' 'bzip2' 'libldap' 'libusb' 'curl>=7.16.2')
source=(#ftp://ftp.gnupg.org/gcrypt/gnupg/$pkgname-$pkgver.tar.bz2
	ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt/gnupg/$pkgname-$pkgver.tar.bz2)
url="http://www.gnupg.org/"
md5sums=('e5be39ea81bb07de006e7dd44439cb76')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make || return 1
  ln -s $pkgname-$pkgver/scripts ..
  make DESTDIR=$startdir/pkg install
}
