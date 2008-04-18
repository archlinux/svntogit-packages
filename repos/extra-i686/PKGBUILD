# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=imlib2
pkgver=1.4.0
pkgrel=1
pkgdesc="Imlib2 is the successor to Imlib. It is NOT a newer version -- Imlib 2 can be installed alongside Imlib 1.x"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/enlightenment"
depends=('libtiff' 'libungif' 'bzip2' 'freetype2' 'libxext' 'libpng' 'libid3tag')
source=(http://heanet.dl.sourceforge.net/sourceforge/enlightenment/$pkgname-$pkgver.tar.gz)
options=('nolibtool')
md5sums=('69f7ee996c943142332b4c98597b095c')

build() {
  cd $startdir/src/$pkgname-$pkgver

  # Enable x86 MMX optimizations for i686 (32-bit assembler code not compatible with x86_64)
  [ "${CARCH}" = "i686" ] && EXTRAOPTS="--disable-mmx"
  # Disable AMD64 optimizations due to bug in assembler code
  [ "${CARCH}" = "x86_64" ] && EXTRAOPTS="--disable-amd64"

  ./configure --prefix=/usr --sysconfdir=/etc/imlib2 $EXTRAOPTS
  make || return 1
  make DESTDIR=$startdir/pkg install
}
