# $Id$
# Maintainer: AndyRTR <andyrtr@archlinux.org>

pkgname=ghostscript
pkgver=8.64
pkgrel=6
pkgdesc="An interpreter for the PostScript language"
arch=(i686 x86_64)
license=('GPL' 'custom')
depends=('libxext' 'libxt' 'libcups>=1.3.10-3' 'fontconfig>=2.6.0' 'gnutls>=2.6.3' 'cairo>=1.8.6')
makedepends=('automake' 'autoconf' 'gtk2>=2.16.2-2')
optdepends=('texlive-core: dvipdf' 'gtk2: gsx')
replaces=('ghostscript-lrpng')
provides=('ghostscript-lprng')
url="http://www.cs.wisc.edu/~ghost/"
source=(http://ghostscript.com/releases/ghostscript-${pkgver}.tar.bz2
	ghostscript-fPIC.patch
	gdevbit.c.patch
	ghostscript-CVE-2009-0583_and_0584.patch
	jbig2_symbol_dict.patch)
options=('!libtool' '!makeflags')
md5sums=('b13289cb2115f38f40c5e064f87e228a'
         '1a8fcacf0005214db823225c870f093d'
         '47cda3310c19cd19bd822012a12f1e07'
         '777ee8cb08cb4fee9aeb3b8b6494b957'
         '7fa28af9e59749a168d1881f5b35c466')

build() {
  cd ${srcdir}/ghostscript-${pkgver}
  #fix http://bugs.ghostscript.com/show_bug.cgi?id=690287 / http://bugs.archlinux.org/task/13259
  patch -Np0 -i ${srcdir}/gdevbit.c.patch || return 1

  # security fixes from Fedora
  patch -Np1 -i ${srcdir}/ghostscript-CVE-2009-0583_and_0584.patch || return 1
  # https://bugzilla.redhat.com/show_bug.cgi?id=493379
  patch -Np0 -i ${srcdir}/jbig2_symbol_dict.patch || return 1
  
  if [ "$CARCH" = "x86_64" ]; then
    patch -Np1 -i ${srcdir}/ghostscript-fPIC.patch || return 1
  fi

  # Build IJS
  cd ${srcdir}/ghostscript-${pkgver}/ijs
  ./autogen.sh
  ./configure --prefix=/usr --enable-shared --disable-static
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

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
