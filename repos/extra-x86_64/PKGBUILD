# $Id$
# Maintainer: AndyRTR <andyrtr@archlinux.org>
pkgname=ghostscript
pkgver=8.62
pkgrel=2
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
source=(ftp://mirror.cs.wisc.edu/pub/mirrors/ghost/GPL/gs862/ghostscript-${pkgver}.tar.bz2)
md5sums=('40d673a3c6e11d2bf14f972b84551104')
options=('!libtool' '!makeflags')

build() {
  cd ${startdir}/src/ghostscript-${pkgver}
  [ "${CARCH}" = "x86_64" ] && export CFLAGS="${CFLAGS} -fPIC"
  # Build IJS
  cd ${startdir}/src/ghostscript-${pkgver}/ijs
  ./autogen.sh
  ./configure --prefix=/usr --enable-shared --disable-static
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  cd ..
  ./configure --prefix=/usr --enable-dynamic --enable-threads --with-ijs \
              --with-jbig2dec --with-omni --with-x --with-drivers=ALL\
	      --with-fontpath=/usr/share/fonts/Type1:/usr/share/fonts
  make || return 1
  make DESTDIR=${startdir}/pkg \
	cups_serverroot=${startdir}/pkg/etc/cups \
	cups_serverbin=${startdir}/pkg/usr/lib/cups install soinstall

  mkdir -p ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/
}
