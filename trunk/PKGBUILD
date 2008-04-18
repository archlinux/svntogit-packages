# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=gsfonts
pkgver=8.11
pkgrel=4
pkgdesc="Ghostscript standard Type1 fonts"
arch=(i686 x86_64)
depends=('xorg-font-utils' 'fontconfig')
install=xfonts.install
url="http://sourceforge.net/projects/ghostscript"
source=(http://switch.dl.sourceforge.net/ghostscript/ghostscript-fonts-std-8.11.tar.gz)
md5sums=('6865682b095f8c4500c54b285ff05ef6')

build() {
  mkdir -p ${startdir}/pkg/usr/share/fonts/Type1
  install -m644 ${startdir}/src/fonts/*.{pfb,pfm,afm} \
                ${startdir}/pkg/usr/share/fonts/Type1/ || return 1
}
