# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Robert Emil Berge <robert@rebi.no>

pkgname=rosegarden
origver=1.6.1
pkgver=4.$origver
pkgrel=1
pkgdesc="audio and MIDI sequencer, score editor, and general-purpose music composition and editing application."
arch=("i686" "x86_64")
license=('GPL')
url="http://www.rosegardenmusic.com/"
depends=('fftw' 'perl-xml-twig>=3.32' 'kdelibs>=3.5.7' 'kdemultimedia>=3.5.7' 'readline>=5.0' 'liblrdf' 'alsa-lib' 'jack-audio-connection-kit>=0.77.0' 'ladspa' 'dssi>=0.9' 'liblo>=0.7')
makedepends=('cmake')
source=("http://puzzle.dl.sourceforge.net/sourceforge/rosegarden/$pkgname-$origver.tar.bz2")
provides=('rosegarden-4')
replaces=('rosegarden-4')
options=("!libtool")

build() {

  cd $startdir/src/$pkgname-$origver
  cmake . -DCMAKE_INSTALL_PREFIX=`kde-config --prefix` -DWANT_LIRC=OFF
  make || return 1
  make install DESTDIR=$startdir/pkg

}
