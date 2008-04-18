# $Id$
# Maintainer : Damir Perisa <damir.perisa@bluewin.ch>

pkgname=ttf-tibetan-machine
pkgver=20020930
pkgrel=1
pkgdesc="Tibetan Machine TTFont"
arch=(i686 x86_64)
url="http://www.thdl.org/tools/fonts/tibfonts.php?l=uva10928423419921"
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
install=ttf.install
licence=('GPL')
source=("http://www.thdl.org/tools/dls/fonts/TibetanMachineUnicodeFont.zip")

build() {
  cd ${startdir}/src
  mkdir -p ${startdir}/pkg/usr/share/fonts/TTF
  install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/
}


