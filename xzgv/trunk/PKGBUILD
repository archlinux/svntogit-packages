# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
pkgname=xzgv
pkgver=0.9
pkgrel=1
pkgdesc="xzgv is a GTK+/Imlib-based picture viewer for X"
arch=(i686 x86_64)
depends=('gtk2')
makedepends=('pkgconfig')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/xzgv/${pkgname}-${pkgver}.tar.gz)
url="http://rus.members.beeb.net/xzgv.html"

build() {
   cd ${startdir}/src/${pkgname}-${pkgver}
   if [ "${CARCH}" = "x86_64" ]; then
     # from gentoo
    sed -i -e "s:-O2 -Wall:${CFLAGS}:" config.mk
    case "${ARCH}" in "x86");; *)
     sed -i -e "s/CFLAGS+=-DINTERP_MMX/#&/" config.mk;;
    esac
   fi
   
   make all || return 1
   cd src
   make BINDIR=${startdir}/pkg/usr/bin \
        MANDIR=${startdir}/pkg/usr/man/man1 \
        install

   cd ../doc
   install -D -m644 xzgv.1 $startdir/pkg/usr/man/man1/xzgv.1
}
md5sums=('7e2dfad595c97c2abbb392b61ea69f1b')
