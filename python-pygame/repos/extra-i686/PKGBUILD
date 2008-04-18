# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: john(?)

pkgname=python-pygame
pkgver=1.8.0
pkgrel=1
pkgdesc="Python game library"
arch=('i686' 'x86_64')
url="http://www.pygame.org/"
license=('LGPL')
depends=('python>=2.5' 'python-numeric>=24.2-2' 'sdl_mixer' 'libvorbis' 'sdl_ttf' 'sdl_image' 'smpeg')
replaces=('pygame')
provides=('pygame')
source=(http://pygame.org/ftp/pygame-${pkgver}release.tar.gz)
md5sums=('8d9cca47d356db2ada07865aa066dceb')
sha1sums=('00ef4695efc7a666017862ae4cffc316902dd99b')

build() {
  cd ${startdir}/src/pygame-${pkgver}release
  python setup.py install --root=${startdir}/pkg --prefix=/usr
}
