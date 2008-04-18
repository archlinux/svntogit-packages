# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=culmus
pkgver=0.101
pkgrel=7
pkgdesc="Culmus collection of Hebrew Type1 fonts for X Windows"
arch=('i686' 'x86_64')
url="http://culmus.sf.net"
depends=('fontconfig' 'xorg-fonts-alias' 'xorg-font-utils' 'xorg-fonts-encodings')
install=('culmus.install')
source=("http://puzzle.dl.sourceforge.net/sourceforge/culmus/culmus-$pkgver.tar.gz")
md5sums=('4dff942d859b9cac569d791c664e66a5')

build() {
# install fonts
mkdir -p ${startdir}/pkg/usr/share/fonts/Type1
install -m644 ${startdir}/src/culmus-$pkgver/{*.afm,*.pfa} \
              ${startdir}/pkg/usr/share/fonts/Type1

# install provided conifg file with priority 61
mkdir -p ${startdir}/pkg/etc/fonts/conf.avail/
install -m644 ${startdir}/src/culmus-$pkgver/culmus.conf \
              ${startdir}/pkg/etc/fonts/conf.avail/61-culmus.conf
}
