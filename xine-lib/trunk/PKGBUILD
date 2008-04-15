# $Id: PKGBUILD,v 1.8 2008/01/31 21:25:30 aaron Exp $
# Maintainer: Aaron Griffin <aaron@archlinux.org> 
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=xine-lib
pkgver=1.1.12
pkgrel=1
pkgdesc="A free video player for Unix"
arch=('i686' 'x86_64')
url="http://xinehq.de/"
license=('LGPL' 'GPL')
depends=('libgl' 'libxvmc' 'esd' 'flac>=1.1.4' 'libvorbis' 'sdl' 'libmng' 'libtheora'
         'libxcb' 'wavpack')
makedepends=('pkgconfig' 'libtool' 'automake' 'autoconf' 'imagemagick' 
             'smbclient' 'mesa' 'alsa-lib' 'vcdimager')
source=(http://downloads.sourceforge.net/sourceforge/xine/${pkgname}-${pkgver}.tar.bz2
        xine-lib-1.1.1-configure-no-mcpu-march.patch)
md5sums=('b7254614c78c8b0f1652b8dc06f80b3a' '9776df4eb54d2f1f68d8268adbc3b5c2')
options=('!libtool')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ${startdir}/src/xine-lib-1.1.1-configure-no-mcpu-march.patch || return 1

  ./configure --prefix=/usr --with-w32-path=/usr/lib/win32 \
    --with-xv-path=/usr/lib --with-libflac --with-wavpack \
    --without-arts --without-jack --without-speex \
    --disable-gnomevfs --without-pulseaudio --disable-aalib --disable-modplug
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
