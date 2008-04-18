# $Id$
# Maintainer: Tom Killian <tom@archlinux.org>
# Contributor: lucke <lucke at o2 dot pl>

pkgname=mplayer-svn
pkgver=25449
pkgrel=1
pkgdesc="A movie player for linux"
depends=('libmad' 'libungif' 'cdparanoia' 'gtk2' 'sdl' 'xvidcore'
         'lame' 'libtheora' 'faac' 'libxxf86dga' 'libxv' 'libgl'
         'smbclient' 'aalib' 'lirc-utils' 'x264>=20071202-1'
         'jack-audio-connection-kit')
makedepends=('subversion' 'pkgconfig' 'libcaca' 'unzip' 'live-media' 'libdts')
source=(ftp://ftp.mplayerhq.hu/MPlayer/skins/Blue-1.7.tar.bz2) 
conflicts=('mplayer')
provides=('mplayer')
url="http://www.mplayerhq.hu/"
license="GPL"
arch=('i686' 'x86_64')

_svntrunk=svn://svn.mplayerhq.hu/mplayer/trunk
_svnmod=mplayer

build() {
  cd $startdir/src

  svn co $_svntrunk $_svnmod --config-dir ./ -r $pkgver
    
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  
  unset CFLAGS

  ./configure --prefix=/usr --confdir=/etc/mplayer --with-extraincdir=/usr/lib/live-media \
  --enable-gui --enable-runtime-cpudetection --enable-largefiles --enable-menu \
  --enable-x11 --enable-gl --language=all \
  --disable-libdv --disable-liblzo --disable-speex --disable-fribidi --disable-arts \
  --disable-dvdnav --disable-openal --disable-musepack --disable-esd --disable-mga
  
  [ "$CARCH" = "i686" ] &&  sed 's|-march=i486|-march=i686|g' -i config.mak

  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  cp etc/{codecs.conf,input.conf,example.conf} $startdir/pkg/etc/mplayer
  ln -s /usr/share/fonts/TTF/Vera.ttf $startdir/pkg/usr/share/mplayer/subfont.ttf
  rm -rf $startdir/pkg/usr/share/mplayer/font
  mv $startdir/src/Blue $startdir/pkg/usr/share/mplayer/skins/default
  
  rm -rf ../$_svnmod-build
}
md5sums=('e4e2020d11b681aac898103b3ba723c4')
