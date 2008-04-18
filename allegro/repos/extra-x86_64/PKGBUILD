# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: arjan <arjan@archlinux.org>
pkgname=allegro
pkgver=4.2.2
pkgrel=1
pkgdesc="Allegro is a multi-platform game library"
arch=(i686 x86_64)
url="http://alleg.sourceforge.net/"
license=('custom')
depends=('jack-audio-connection-kit' 'libxpm' 'libxxf86vm' 'libxxf86dga' \
         'libxcursor')
options=('!makeflags')
source=(http://downloads.sourceforge.net/alleg/${pkgname}-${pkgver}.tar.gz LICENSE)
md5sums=('87ffb1def034e0ec29a9ad4a595cda7e' 'cd97e2992e8e66b9e6a449d832dc9c7a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --enable-artsdigi=no \
              --enable-esddigi=no \
              --enable-sse=no
  make || return 1
  make prefix=${startdir}/pkg/usr install
  install -D -m644 ../LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
}
