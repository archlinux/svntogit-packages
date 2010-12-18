# $Id$
# Maintainer: AndyRTR <andyrtr@archlinux.org>

pkgname=ghostscript
pkgver=9.00
pkgrel=2
pkgdesc="An interpreter for the PostScript language"
arch=('i686' 'x86_64')
license=('GPL3' 'custom')
depends=('libxt' 'libcups' 'fontconfig' 'jasper' 'zlib' 'libpng' 'libjpeg' 'libtiff')
makedepends=('gtk2' 'gnutls')
optdepends=('texlive-core:      needed for dvipdf'
            'gtk2:              needed for gsx')
url="http://www.ghostscript.com/"
source=(http://ghostscript.com/releases/ghostscript-${pkgver}.tar.xz
	ghostscript-fPIC.patch
	ghostscript-system-jasper.patch
	svn_rev11948.diff)
options=('!libtool' '!makeflags')
md5sums=('1ca5f245677f78f573e6490bdb40702f'
         '766d44c47c693f96941b658e360c1277'
         '03e27cd02471ab3b642c344fa06b623e'
         '78f2b9c2d6a5a60891b2d8b593a15b00')

build() {
  cd ${srcdir}/ghostscript-${pkgver}
  # force it to use system-libs
  rm -rf jpeg libpng zlib jasper expat tiff

  # fix build with systems jasper
  patch -Np1 -i ${srcdir}/ghostscript-system-jasper.patch

  if [ "$CARCH" = "x86_64" ]; then
    patch -Np1 -i ${srcdir}/ghostscript-fPIC.patch
  fi

  # part of https://bugs.archlinux.org/task/22006 - http://bugs.ghostscript.com/show_bug.cgi?id=691831
  patch -Np2 -i ${srcdir}/svn_rev11948.diff
  
  ./autogen.sh
  ./configure --prefix=/usr \
	--enable-dynamic \
	--with-ijs \
	--with-jbig2dec \
	--with-omni \
	--with-x \
	--with-drivers=ALL\
	--with-fontpath=/usr/share/fonts/Type1:/usr/share/fonts \
	--disable-compile-inits # needed for linking with system-zlib
  make || return 1
  
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
