# $Id$
# Maintainer : Damir Perisa <damir.perisa@bluewin.ch>

pkgname=ttf-arphic-ukai
pkgver=0.1.20060928
pkgrel=1
pkgdesc="Kaiti (brush stroke) unicode TTFonts"
arch=("i686" "x86_64")
url="http://www.freedesktop.org/wiki/Software/CJKUnifonts"
depends=(fontconfig xorg-font-utils)
install=ttf.install
source=("http://apt.debian.org.tw/pool/t/ttf-arphic-ukai/ttf-arphic-ukai_${pkgver}.orig.tar.gz")

build()
{
  cd ${startdir}/src/$pkgname-${pkgver}
  mkdir -p  ${startdir}/pkg/usr/share/fonts/TTF/
  install -m 644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF
}
