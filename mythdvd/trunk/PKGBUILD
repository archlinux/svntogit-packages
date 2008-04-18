# $Id$
# Maintainer: Travis Willard <travisw@wmpub.ca>
# Contributor: kleptophobiac@gmail.com

pkgname=mythdvd
pkgver=0.20.2.20071129
pkgrel=2
pkgdesc="DVD playback and ripping plugin for MythTV"
arch=('i686' 'x86_64')
url="http://www.mythtv.org"
license=('GPL')
depends=("mythtv>=${pkgver}" 'libdvdread' 'nasm' 'a52dec' 'transcode' 'flac>=1.1.4' \
         'vorbis-tools' 'cdrtools' 'mplayer' 'libxvmc')
makedepends=('libdvdcss')
install=mythdvd.install
source=(ftp://ftp.archlinux.org/other/myth/mythplugins-$pkgver.tar.gz mtd)
groups=('mythtv-extras')

build() {
   cd $startdir/src/mythplugins
#	export QMAKESPEC='linux-g++'
   
   ./configure --prefix=/usr --disable-all --enable-mythdvd \
               --enable-transcode --enable-vcd

   qmake mythplugins.pro
   make qmake || return 1
   make -j 2 || return 1

   make INSTALL_ROOT=$startdir/pkg install
   install -D -m755 ../mtd $startdir/pkg/etc/rc.d/mtd
}

md5sums=('2cd966ae7d2f0e7fea8e5192bf7e9823'
         '476c12ba074794ad7f4ae092bdf949d6')
