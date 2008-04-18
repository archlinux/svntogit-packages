# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=gdk-pixbuf
pkgver=0.22.0
pkgrel=4
pkgdesc="Image loading and manipulation library"
depends=(gtk libtiff libpng)
options=(NOLIBTOOL)
arch=(i686 x86_64)
source=(ftp://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.22/${pkgname}-${pkgver}.tar.bz2
	gdk-pixbuf-0.22.0-bmp_reject_corrupt.patch
	gdk-pixbuf-0.22.0-bmp_secure.patch
	gdk-pixbuf-0.22.0-loaders.patch
	gdk-pixbuf-0.22.0-m4.patch)
md5sums=(05fcb68ceaa338614ab650c775efc2f2 d1fb93f1ae994875158a7e0c108c36f8
         5f59d5772b1482d885a180dbc581cf84 3cf31ae0509747f72ac27a9fd96109c2
         3edfa9fe9382fd8206d6238ec121a5af)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  export SED=/bin/sed
  patch -Np1 -i ${startdir}/src/gdk-pixbuf-0.22.0-bmp_reject_corrupt.patch || return 1
  patch -Np0 -i ${startdir}/src/gdk-pixbuf-0.22.0-bmp_secure.patch || return 1
  patch -Np1 -i ${startdir}/src/gdk-pixbuf-0.22.0-loaders.patch || return 1
  patch -Np1 -i ${startdir}/src/gdk-pixbuf-0.22.0-m4.patch || return 1
  libtoolize --force --copy --automake
  ./configure --prefix=/usr --disable-gtk-doc
  make || return 1
  make DESTDIR=${startdir}/pkg install
  rm -rf ${startdir}/pkg/usr/share/gnome
}
