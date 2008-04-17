# $Id: PKGBUILD,v 1.36 2008/01/01 16:32:17 andyrtr Exp $
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=gnupg
pkgver=1.4.9
pkgrel=1
pkgdesc="GNU Privacy Guard - a PGP replacement tool"
arch=(i686 x86_64)
license=('GPL3')
depends=('zlib' 'bzip2' 'libldap' 'libusb' 'curl>=7.16.2')
source=(#ftp://ftp.gnupg.org/gcrypt/gnupg/$pkgname-$pkgver.tar.bz2
	ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt/gnupg/$pkgname-$pkgver.tar.bz2
	buildfix.patch)
url="http://www.gnupg.org/"
md5sums=('cc52393087480ac8d245625004a6a30c'
         'f7e9f40964bed7e9722ec07ba4fae9a6')

build() {
  cd $startdir/src/$pkgname-$pkgver
  # http://lists.gnupg.org/pipermail/gnupg-devel/2008-April/024344.html
  patch -Np0 -i ../buildfix.patch || return 1
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make || return 1
  ln -s $pkgname-$pkgver/scripts ..
  make DESTDIR=$startdir/pkg install
}
