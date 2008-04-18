# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kdemultimedia
pkgver=3.5.9
kdever=3.5.9 # if minor 0, then without .0
pkgrel=1
pkgdesc="KDE Multimedia Programs."
arch=(i686 x86_64)
url="http://www.kde.org"
license=('GPL')
groups=('kde')
depends=('kdelibs>=3.5.9' 'cdparanoia' 'lame' 'flac>=1.1.4' 'musicbrainz' 'tunepimp>=0.5.3' 'taglib' 'xine-lib' 'perl' 'libtool' 'libsamplerate' 'gstreamer0.10' 'libxxf86dga' 'libxv' 'libxxf86vm')
makedepends=('pkgconfig')

# for easier build, just uncomment the mirror you want to use
  mirror="ftp.solnet.ch/mirror/KDE"         # updated every 2 hours, very fast for Europe
# mirror="ftp.kde.org/pub/kde/"             # main server
# mirror="ibiblio.org/pub/mirrors/kde/"     # ibiblio mirror

source=(ftp://$mirror/stable/$kdever/src/$pkgname-$pkgver.tar.bz2 tunepimp.patch flac.patch)

build() {
  # Uninstall akode before compile!
  # Source the QT and KDE profile
  [ "$QTDIR" = "" ] && source /etc/profile.d/qt3.sh 
  [ "$KDEDIR" = "" ] && source /etc/profile.d/kde.sh
  # start building
  cd $startdir/src/$pkgname-$pkgver
  patch -Rp4 -i ../tunepimp.patch || return 1
  patch -Np1 -i ../flac.patch || return 1
  sed -i -e 's/applications-merged/kde-applications-merged/g' kappfinder-data/Makefile.{am,in}
  make -f admin/Makefile.common
  ./configure --prefix=/opt/kde \
  --with-alsa --with-lame --with-vorbis \
  --disable-dependency-tracking --disable-debug --with-speex --enable-gcc-hidden-visibility \
  --enable-final
  # --disable-strict --disable-warnings
  #--enable-final # remove this if you build with < 512mb ram.
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('fdfafe38d2c7e3019dafc80c177add15'
         '75d337a1ed6dee17cd8715a12cb99464'
         '72791ea8b5767cec50d02375322a2315')
