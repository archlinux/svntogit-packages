# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=fluidsynth
pkgver=1.0.8
origver=1.0.8
pkgrel=1
pkgdesc="FluidSynth is a real-time software synthesizer based on the SoundFont 2 specifications."
arch=("i686" "x86_64")
url="http://www.fluidsynth.org/"
depends=('jack-audio-connection-kit' 'ladspa')
options=('!libtool')
license=('LGPL')
source=("http://savannah.nongnu.org/download/fluid/$pkgname-$pkgver.tar.gz")
md5sums=('e2abfd2e69fd8b28d965df968d7d44ee')


build() {
  cd $startdir/src/$pkgname-$origver
  ./configure --prefix=/usr \
              --enable-ladspa
  make || return 1
  make prefix=$startdir/pkg/usr install
}

