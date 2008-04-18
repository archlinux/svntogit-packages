# $Id$
# Maintainer : Damir Perisa <damir.perisa@bluewin.ch>

pkgname=ttf-freebanglafont
pkgver=0.5
pkgrel=5
pkgdesc="TTFonts for Bangla (Bengali)"
arch=(i686 x86_64)
url="http://www.bengalinux.org/downloads/"
url2="http://www.omicronlab.com/avrokeyboard/bangla-fonts/"
depends=(xorg-fonts-encodings xorg-font-utils fontconfig)
makedepends=(unzip)
install=ttf.install
source=(http://www.omicronlab.com/avrokeyboard/bangla-fonts/all_bangla_fonts.zip)
md5sums=('8bc4064da62a3ea9e26d12e0301032d5')

build() {
  cd ${startdir}/src/
  mkdir -p ${startdir}/pkg/usr/share/fonts/TTF
  install *.ttf ${startdir}/pkg/usr/share/fonts/TTF
}
