# $Id$
# Maintainer: AndyRTR <andyrtr@archlinux.org>

pkgname=ghostscript
pkgver=8.63
pkgrel=1
pkgdesc="An interpreter for the PostScript language"
arch=(i686 x86_64)
license=('GPL' 'custom')
depends=('libxext' 'libxt' 'libcups>=1.3.7-2' 'fontconfig' 'gtk2')
makedepends=('automake' 'autoconf')
replaces=('ghostscript-lrpng')
provides=('ghostscript-lprng')
url="http://www.cs.wisc.edu/~ghost/"
#url="http://www.cups.org/espgs/"
install=ghostscript.install
source=(ftp://mirror.cs.wisc.edu/pub/mirrors/ghost/GPL/gs863/ghostscript-${pkgver}.tar.bz2)
options=('!libtool' '!makeflags')
md5sums=('c770eedfdd846a53e211e3ba5339de21')

build() {
  cd ${srcdir}/ghostscript-${pkgver}
  [ "${CARCH}" = "x86_64" ] && export CFLAGS="${CFLAGS} -fPIC"
  # Build IJS
  cd ${srcdir}/ghostscript-${pkgver}/ijs
  ./autogen.sh
  ./configure --prefix=/usr --enable-shared --disable-static
  make || return 1
  make DESTDIR=${pkgdir}/g install || return 1
  cd ..
  ./configure --prefix=/usr --enable-dynamic --enable-threads --with-ijs \
              --with-jbig2dec --with-omni --with-x --with-drivers=ALL\
	      --with-fontpath=/usr/share/fonts/Type1:/usr/share/fonts
  make || return 1
  make DESTDIR=${pkgdir} \
	cups_serverroot=${pkgdir}/etc/cups \
	cups_serverbin=${pkgdir}/usr/lib/cups install soinstall

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/

  # remove unwanted localized man-pages
  rm -rf $pkgdir/usr/share/man/[^man1]*
}
