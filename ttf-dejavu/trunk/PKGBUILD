# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=ttf-dejavu
pkgver=2.24
pkgrel=1
pkgdesc="Font family based on the Bitstream Vera Fonts. Dejavu fonts cover a wider range of characters"
arch=('i686' 'x86_64')
license=('custom')
url="http://dejavu.sourceforge.net/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=(http://downloads.sourceforge.net/sourceforge/dejavu/dejavu-fonts-ttf-${pkgver}.tar.bz2)
md5sums=('7b56c9db1e2a3bf9c80d20ea1c823623')

build() {
  cd ${startdir}/src/dejavu-fonts-ttf-${pkgver}
  mkdir -p ${startdir}/pkg/usr/share/fonts/TTF
  install -m644 ttf/*.ttf ${startdir}/pkg/usr/share/fonts/TTF/
  mkdir -p ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/
}
