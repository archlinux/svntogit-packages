# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Pajaro

pkgname=dssi
pkgver=0.9.1
pkgrel=3
fluidsynthversion=1.0.7a
pkgdesc="DSSI is an API for audio plugins, with particular application for software synthesis plugins with native user interfaces."
arch=("i686" "x86_64")
url="http://dssi.sourceforge.net/"
license=""
depends=('liblo>=0.22' 'qt3' 'pkgconfig' 'flac>=1.1.4' 'jack-audio-connection-kit' 'libsamplerate')
makedepends=('ladspa')

source=("http://belnet.dl.sourceforge.net/sourceforge/dssi/$pkgname-$pkgver.tar.gz" \
    "http://savannah.nongnu.org/download/fluid/fluidsynth-$fluidsynthversion.tar.gz" \
     "trivial_sampler_qt_gui.cpp.diff")

build() {
  cd $startdir/src/$pkgname-$pkgver
  . /etc/profile.d/qt3.sh
  cd examples
  patch trivial_sampler_qt_gui.cpp < ../../../trivial_sampler_qt_gui.cpp.diff
  cd ..

#  export FLUID='$startdir/src/fluidsynth-$fluidsynthversion'
  export FLUID='$startdir/src/fluidsynth-1.0.7'
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
