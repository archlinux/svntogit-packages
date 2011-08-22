# $Id$
# Maintainer: AndyRTR <andyrtr@archlinux.org>

pkgname=ghostscript
pkgver=9.04
pkgrel=4
pkgdesc="An interpreter for the PostScript language"
arch=('i686' 'x86_64')
license=('GPL3' 'custom')
depends=('libxt' 'libcups' 'fontconfig' 'jasper' 'zlib' 'libpng' 'libjpeg' 'libtiff' 'lcms') # 'lcms2' won't get used) # move in libpaper from community?
makedepends=('gtk2' 'gnutls')
optdepends=('texlive-core:      needed for dvipdf'
            'gtk2:              needed for gsx')
url="http://www.ghostscript.com/"
source=(http://downloads.ghostscript.com/public/ghostscript-${pkgver}.tar.bz2
	ghostscript-cups-rgbw.patch)
options=('!libtool' '!makeflags')
md5sums=('9f6899e821ab6d78ab2c856f10fa3023'
         '7c1477e1cadd9c451ea8d6ec3fbbc670')

build() {
  cd ${srcdir}/ghostscript-${pkgver}
  
  # fix broken color printing https://bugs.archlinux.org/task/25519
  patch -Np1 -i ${srcdir}/ghostscript-cups-rgbw.patch

  # force it to use system-libs
  rm -rf jpeg libpng zlib jasper expat tiff freetype lcms

  ./configure --prefix=/usr \
	--enable-dynamic \
	--with-ijs \
	--with-jbig2dec \
	--with-omni \
	--with-x \
	--with-drivers=ALL\
	--with-fontpath=/usr/share/fonts/Type1:/usr/share/fonts \
	--with-install-cups \
	--enable-fontconfig \
	--enable-freetype \
	--without-luratech \
	--disable-compile-inits #--help # needed for linking with system-zlib
  make
  
  # Build IJS
  cd ${srcdir}/ghostscript-${pkgver}/ijs
  ./autogen.sh
  ./configure --prefix=/usr --enable-shared --disable-static
  make
}

package() {
  cd ${srcdir}/ghostscript-${pkgver}
  make DESTDIR=${pkgdir} \
	cups_serverroot=${pkgdir}/etc/cups \
	cups_serverbin=${pkgdir}/usr/lib/cups install soinstall

  # install missing doc files # http://bugs.archlinux.org/task/18023
  install -m 644 ${srcdir}/ghostscript-${pkgver}/doc/{Ps2ps2.htm,gs-vms.hlp,gsdoc.el,pscet_status.txt} ${pkgdir}/usr/share/ghostscript/$pkgver/doc/
  
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/

  # remove unwanted localized man-pages
  rm -rf $pkgdir/usr/share/man/[^man1]*

  # install IJS
  cd ${srcdir}/ghostscript-${pkgver}/ijs
  make DESTDIR=${pkgdir} install
}
