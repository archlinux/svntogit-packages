# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=muse
pkgver=0.8.1
pkgrel=2
pkgdesc="MusE is a MIDI/Audio sequencer with recording and editing capabilities. MusE aims to be a complete multitrack virtual studio for Linux."
arch=(i686 x86_64)
url="http://muse-sequencer.org/"
depends=('jack-audio-connection-kit' 'gcc' 'qt3' 'glibc' 'libcap' 'fluidsynth' 'jade' 'graphviz' 'libsamplerate')

source=(http://switch.dl.sourceforge.net/sourceforge/lmuse/$pkgname-$pkgver.tar.gz)
#        vst.cpp.diff)

build() {
  cd $startdir/src/$pkgname-$pkgver
  . /etc/profile.d/qt3.sh
 # patch muse/vst.cpp < ../../vst.cpp.diff
  ./configure --prefix=/usr --enable-maintainer-mode \
                            --disable-doxy-treeview \
                            --enable-optimize \
                            --enable-vst \
                            --disable-suid-build \
                            #--enable-rtcap
 # sed -i 's|-fmove-all-movables||g' */*/Makefile
  make || return 1
  make prefix=$startdir/pkg/usr install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
