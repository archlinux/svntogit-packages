# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=ogle
pkgver=0.9.2
pkgrel=9
pkgdesc="A simple DVD player for Linux"
arch=('i686' 'x86_64')
url="http://www.dtek.chalmers.se/groups/dvd/"
license=('GPL')
depends=('libxml2' 'libdvdread' 'libjpeg' 'libmad' 'libxinerama' 'libxv'
         'alsa-lib' 'a52dec' 'libsm' 'libxxf86vm')
options=('!libtool')
source=(http://www.dtek.chalmers.se/groups/dvd/dist/$pkgname-$pkgver.tar.gz
        xvideofix.patch gcc34alsafix.patch gcc4.patch)
md5sums=('a76a9892bdb807a4bcf859d15a91f0f9' '57f1cf36eed82c56f24e9c0fc25ce2b3'\
         '4ebc822b252fade6b53c5ceb5be45bf5' 'd08cff87c5ec41a7eebc0d2384835688')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../xvideofix.patch || return 1
  patch -Np1 -i ../gcc34alsafix.patch || return 1
  patch -Np1 -i ../gcc4.patch || return 1
   # fix alsa detection - stolen from their cvs
  sed -i 's|^.*MINOR\=\=5.*$|#if SND_LIB_MAJOR==0 && SND_LIB_MINOR<6|' configure
  sed -i 's|__diga_end:|\0;|' libogleao/alsa_audio.c
  ./configure --prefix=/usr --sysconfdir=/etc --with-x
  make || return 1
  export LIBRARY_PATH=$startdir/pkg/usr/lib/ogle
  make prefix=$startdir/pkg/usr install
}
