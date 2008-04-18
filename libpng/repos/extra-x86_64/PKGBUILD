# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Maintainer: Travis Willard <travis@archlinux.org>

pkgname=libpng
pkgver=1.2.25
pkgrel=1
pkgdesc="A collection of routines used to create PNG format graphics files"
arch=('i686' 'x86_64')
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=('zlib')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2
        http://littlesvr.ca/apng/diff/${pkgname}-${pkgver}-apng.patch)
md5sums=('0c1df914de7fd3b6a129af569889c856'
         '94a0bced7e4e18e6cf0aed2e6036bb3d')
options=('!libtool')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  # Add animated PNG (apng) support
  patch -Np0 -i $startdir/src/${pkgname}-${pkgver}-apng.patch

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install

  cd contrib/pngminus
  make PNGLIB="-L${startdir}/pkg/usr/lib -lpng" -f makefile.std png2pnm pnm2png
  install -m755 png2pnm pnm2png ${startdir}/pkg/usr/bin/
  install -D -m644 ../../LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE

  # Removing unneeded symlink
  rm ${startdir}/pkg/usr/lib/libpng.la
}

