# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=gnupg2
pkgver=2.0.8
pkgrel=1
pkgdesc="GNU Privacy Guard 2 - a PGP replacement tool"
arch=(i686 x86_64)
depends=('libldap' 'curl>=7.16.2' 'bzip2' 'zlib' 'libksba>=1.0.2' 'libgcrypt' 'pth' 'libusb' 'libassuan>=1.0.4' 'pinentry' 'dirmngr')
license=('GPL')
options=('!makeflags')
source=(ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-$pkgver.tar.bz2)
url="http://www.gnupg.org/"

build() {
  cd $startdir/src/gnupg-$pkgver

  # O2 breaks it on x86_64
  [ "$CARCH" = "x86_64" ] && EXTRAOPTS="--disable-optimization"

  ./configure --prefix=/usr --libexecdir=/usr/lib/gnupg2 $EXTRAOPTS
  make || return 1
  make DESTDIR=$startdir/pkg install
  # move conflicting files
  mv $startdir/pkg/usr/share/gnupg{,2}
}
md5sums=('fc4377ca67e1bf687eeaf22e79c0b9d1')
