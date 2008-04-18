# $Id$
# Maintainer : Damir Perisa <damir.perisa@bluewin.ch>

pkgname=ttf-isabella
pkgver=1.003
pkgrel=3
pkgdesc="Historic Isabella TTFont - based on Isabella Breviary, made around 1497, in Holland, for Isabella of Castille, the first queen of united Spain"
arch=(i686 x86_64)
url="http://www.thibault.org/fonts/isabella/"
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
install=ttf.install
source=("http://www.thibault.org/fonts/isabella/Isabella.tar.gz")
md5sums=('07894a5e5291fcb6a24d628fd9702c5e')

build() {
  cd ${startdir}/src/
  mkdir -p ${startdir}/pkg/usr/share/fonts/TTF
  install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/
}

# 
