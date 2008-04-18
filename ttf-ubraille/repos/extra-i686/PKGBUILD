# $Id$
# Maintainer : Damir Perisa <damir.perisa@bluewin.ch>
pkgname=ttf-ubraille
pkgver=001.000
pkgrel=3
pkgdesc="Unicode TTFonts for braille"
arch=(i686 x86_64)
url="http://yudit.org/download/fonts/UBraille/"
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
install=ttf.install
source=("http://yudit.org/download/fonts/UBraille/UBraille.ttf")
md5sums=('4a8b8d06a4d6955a5c7319ce8440970c')

build() {
  cd ${startdir}/src
  mkdir -p ${startdir}/pkg/usr/share/fonts/TTF
  install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/
}

# http://www.travelphrases.info/gallery/Fonts_Braille.html
