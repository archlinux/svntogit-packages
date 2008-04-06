# $Id
# Maintainer: dorphell <dorphell@archlinux.org>

pkgname=ttf-bitstream-vera
pkgver=1.10
pkgrel=5
pkgdesc="Bitstream vera fonts"
arch=(i686 x86_64)
license=(custom)
url="http://www.gnome.org/fonts"
depends=(fontconfig xorg-fonts-encodings xorg-font-utils)
install=vera.install
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/1.10/${pkgname}-${pkgver}.tar.bz2)
md5sums=(bb22bd5b4675f5dbe17c6963d8c00ed6)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  mkdir -p  ${startdir}/pkg/usr/share/fonts/TTF
  install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/
  mkdir -p ${startdir}/pkg/usr/share/licenses/custom/ttf-bitstream-vera
  install -m644 COPYRIGHT.TXT ${startdir}/pkg/usr/share/licenses/custom/ttf-bitstream-vera/license.txt
}
