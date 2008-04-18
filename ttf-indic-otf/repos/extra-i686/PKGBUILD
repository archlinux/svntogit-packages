# $Id$
# Maintainer : Damir Perisa <damir.perisa@bluewin.ch>

pkgname=ttf-indic-otf
provides=('ttf-freebanglafont')
conflicts=('ttf-freebanglafont')
pkgver=0.2
pkgrel=3
pkgdesc="Indic Opentype Fonts collection"
arch=(i686 x86_64)
url="http://www.indlinux.org/wiki/index.php/Downloads"
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
install=ttf.install
source=(http://www.indlinux.org/downloads/files/indic-otf-0.2.tar.gz)
md5sums=('d50bb65a39d78608be3560f38f003d21')

build() {
  cd ${startdir}/src/indic/OpenType
  mkdir -p ${startdir}/pkg/usr/share/fonts/TTF
  install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/

}
