# $Id$
# Maintainer : Damir Perisa <damir.perisa@bluewin.ch>

pkgname=ttf-fireflysung
pkgver=1.4.2
pkgrel=1
pkgdesc="firefly embedded (truetype) bitmap font"
arch=("i686" "x86_64")
url="http://www.study-area.org/apt/firefly-font/"
depends=(fontconfig xorg-font-utils)
install=ttf.install
#source=(${url}/fireflysung-${pkgver}.tar.gz)
source=("ftp://ftp.opendesktop.org.tw/odp/ODOFonts/OpenFonts/opendesktop-fonts-${pkgver}.tar.gz")

build() {
  cd ${startdir}/src/opendesktop-fonts-${pkgver}
  mkdir -p  ${startdir}/pkg/usr/share/fonts/TTF
  install -m 644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF
  install -m 644 *.ttc ${startdir}/pkg/usr/share/fonts/TTF
}
