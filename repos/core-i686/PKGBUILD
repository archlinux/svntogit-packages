# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Aaron Griffin <aaron@archlinux.org>
pkgname=libarchive
pkgver=2.4.17
pkgrel=1
pkgdesc="library that can create and read several streaming archive formats"
arch=(i686 x86_64)
url="http://people.freebsd.org/~kientzle/libarchive/"
license=('BSD')
groups=('base')
depends=('zlib' 'bzip2' 'acl')
source=(http://people.freebsd.org/~kientzle/libarchive/src/libarchive-$pkgver.tar.gz
        no_uudecode.patch)

# The libarchive .a static lib isn't linked correctly, so pacman.static
#   build fails unless we keep the libtool files
#options=(!libtool)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  # patch out the parts that require uudecode (from sharutils, in extra)
  patch -Np0 < ../no_uudecode.patch

  make || return 1
  make DESTDIR=$startdir/pkg install

  # install license
  mkdir -p $startdir/pkg/usr/share/licenses/libarchive
  install -m644 COPYING $startdir/pkg/usr/share/licenses/libarchive/
}

md5sums=('13a6dd5f21b08713dccdd6489685fe77'
         '5f159da70a1e09417d9599f43c9e19e2')
