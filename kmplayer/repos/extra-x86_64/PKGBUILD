# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=kmplayer
pkgver=0.10.0.c
origver=0.10.0c
force=y
pkgrel=1
pkgdesc="Video player plugin for Konqueror and basic MPlayer/Xine/ffmpeg/ffserver/VDR frontend for KDE"
arch=("i686" "x86_64")
license=('GPL2')
url="http://kmplayer.kde.org"
depends=('libx11' 'libxv' 'cairo' 'kdelibs>=3.5.8' 'gstreamer0.10-base' 'xine-lib' 'dbus-glib' 'qt3' 'dbus-qt3' 'gtk2')
# gtk2 and dbus-glib is needed only by opt/kde/bin/knpplayer so it probably may be also made optional if needed
source=($url/pkgs/$pkgname-$origver.tar.bz2)

build() {
  export MAKEFLAGS="-j1"
  cd $startdir/src/$pkgname-$origver
   
  ./configure --prefix=/opt/kde
  make || return 1
  make prefix=$startdir/pkg/opt/kde install

  rm -f ${startdir}/pkg/opt/kde/share/mimelnk/application/x-mplayer2.desktop
}


md5sums=('3e76147784b2642891c9efbfe260e4c4')
