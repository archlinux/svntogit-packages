# $Id$
# Maintainer: AndyRTR <andyrtr@archlinux.org>

pkgname=ghostscript
pkgver=8.70
pkgrel=4
pkgdesc="An interpreter for the PostScript language"
arch=('i686' 'x86_64')
license=('GPL3' 'custom')
depends=('libxext' 'libxt' 'libcups>=1.4.2-3' 'fontconfig>=2.6.0' 'gnutls>=2.8.3' 'cairo>=1.8.8-2'
          'jasper>=1.900.1-4' 'zlib' 'libpng>=1.4.0' 'libjpeg>=8')
makedepends=('automake' 'autoconf' 'gtk2>=2.18.6')
optdepends=('texlive-core:	dvipdf'
            'gtk2:		gsx')
replaces=('ghostscript-lrpng')
provides=('ghostscript-lprng')
url="http://www.cs.wisc.edu/~ghost/"
source=(http://ghostscript.com/releases/ghostscript-${pkgver}.tar.bz2
	ghostscript-fPIC.patch
	ghostscript-system-jasper.patch
	libpng14.patch)
options=('!libtool') # '!makeflags')
md5sums=('526366f8cb4fda0d3d293597cc5b984b'
         '1a8fcacf0005214db823225c870f093d'
         '03e27cd02471ab3b642c344fa06b623e'
         'be94ee357986f7f63d1b470da5bdc99e')

build() {
  cd ${srcdir}/ghostscript-${pkgver}
  # force it to use system-libs
  rm -rf jpeg libpng zlib jasper expat

  patch -Np1 -i ${srcdir}/libpng14.patch || return 1

  # fix build with systems jasper
  patch -Np1 -i ${srcdir}/ghostscript-system-jasper.patch || return 1

  if [ "$CARCH" = "x86_64" ]; then
    patch -Np1 -i ${srcdir}/ghostscript-fPIC.patch || return 1
  fi

  # Build IJS
  cd ${srcdir}/ghostscript-${pkgver}/ijs
  ./autogen.sh
  ./configure --prefix=/usr --enable-shared --disable-static
  make || return 1
  make -j1 DESTDIR=${pkgdir} install || return 1

  cd ..
  ./autogen.sh
  ./configure --prefix=/usr --enable-dynamic --with-ijs \
              --with-jbig2dec --with-omni --with-x --with-drivers=ALL\
	      --with-fontpath=/usr/share/fonts/Type1:/usr/share/fonts \
	      --disable-compile-inits # needed for linking with system-zlib
  make || return 1
  make -j1 DESTDIR=${pkgdir} \
	cups_serverroot=${pkgdir}/etc/cups \
	cups_serverbin=${pkgdir}/usr/lib/cups install soinstall

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/

  # remove unwanted localized man-pages
  rm -rf $pkgdir/usr/share/man/[^man1]*
}
