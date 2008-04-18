# $Id$
# Maintainer : Damir Perisa <damir.perisa@bluewin.ch>

pkgname=ttf-junicode
pkgver=0.6.15
pkgrel=1
pkgdesc="Junius-Unicode TTFont - for medieval latin scripts"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.engl.virginia.edu/OE/junicode/junicode.html"
depends=("xorg-fonts-encodings" "xorg-fonts-alias" "xorg-font-utils" "fontconfig")
makedepends=(unzip)
install=ttf.install
source=("http://switch.dl.sourceforge.net/sourceforge/junicode/junicode-$pkgver.zip")

build() {
  cd ${startdir}/src
  mkdir -p ${startdir}/pkg/usr/share/fonts/TTF
  install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF
}

