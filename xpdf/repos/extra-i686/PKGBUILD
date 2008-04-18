# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=xpdf
_srcver=3.02
_patchlevel=pl2
pkgver=${_srcver}_${_patchlevel}
#pkgver=${_srcver}
pkgrel=1
pkgdesc="Xpdf is a viewer for Portable Document Format (PDF) files."
arch=(i686 x86_64)
license=('GPL')
depends=('gcc>=4.1' 'lesstif' 't1lib' 'gsfonts')
backup=(etc/xpdfrc)
url="http://www.foolabs.com/xpdf/"
options=('force')
install=${pkgname}.install
source=(ftp://ftp.foolabs.com/pub/${pkgname}/${pkgname}-${_srcver}.tar.gz \
        ftp://ftp.foolabs.com/pub/${pkgname}/${pkgname}-${_srcver}pl1.patch \
        ftp://ftp.foolabs.com/pub/${pkgname}/${pkgname}-${_srcver}${_patchlevel}.patch \
        ${pkgname}.desktop)
md5sums=('599dc4cc65a07ee868cf92a667a913d2' '877118786dfe27d1b7aa5a6759cc6e45' \
         '3a5cb165ae66781e0b21e6219ae06795' '6c606eeca046cc9f32835f98f635c084')

build() {
  cd ${startdir}/src/${pkgname}-${_srcver}
  patch -Np1 -i ../${pkgname}-${_srcver}pl1.patch || return 1
  patch -Np1 -i ../${pkgname}-${_srcver}${_patchlevel}.patch || return 1
  sed -i 's:/usr/share/fonts/type1/gsfonts:/usr/share/fonts/Type1:' xpdf/GlobalParams.cc || return 1
  ./configure                                                  \
    --prefix=/usr                                              \
    --sysconfdir=/etc                                          \
    --enable-multithreaded --enable-wordlist                   \
    --with-freetype2-library=/usr/lib                          \
    --with-freetype2-includes=/usr/include/freetype2           \
    --with-t1-library=/usr/lib                                 \
    --with-t1-includes=/usr/include                            \
    --x-includes=/usr/include                                  \
    --with-Xm-library=/usr/lib                                 \
    --with-Xm-includes=/usr/include
  make || return 1
  make DESTDIR=${startdir}/pkg install
  # remove some libs and manpages provided by poppler now
  for tool in pdffonts pdfimages pdfinfo pdftoppm pdftops pdftotext ; do
    rm -f ${startdir}/pkg/usr/bin/${tool}
    rm -f ${startdir}/pkg/usr/man/man1/${tool}.1
  done
  install -Dm644 ../${pkgname}.desktop \
    ${startdir}/pkg/usr/share/applications/${pkgname}.desktop
  install -Dm644 xpdf/xpdfIcon.xpm \
    ${startdir}/pkg/usr/share/pixmaps/xpdf.xpm
}
