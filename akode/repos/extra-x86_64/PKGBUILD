# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=akode
pkgver=2.0.2
force=y
pkgrel=1
pkgdesc="KDE Multimedialib"
arch=(i686 x86_64)
license=('GPL')
url="http://www.kde.org"
depends=('flac' 'libmad' 'speex' 'libsamplerate' 'libvorbis' 'jack-audio-connection-kit' \
         'libtool')
source=(http://archlinux.org/~alexander/src/${pkgname}-${pkgver}.tar.bz2
        akode-2.0.2-flac14.patch)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ${startdir}/src/akode-2.0.2-flac14.patch || return 1
  ./configure --prefix=/usr \
              --without-polypaudio \
              --with-ffmpeg \
              --with-flac \
              --with-vorbis \
              --with-jack \
              --with-speex \
              --with-libmad 
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('659ced0c9c735cb3e55b9138ff02342c'
         'd56e4017ff4c829c844a0aa2cd0c12cc')
