# $Id$
# Maintainer :  Damir Perisa <damir.perisa@bluewin.ch>

pkgname=kaffeine
pkgver=0.8.6
pkgrel=2
pkgdesc="Multimedia Player, based on Xine"
license=('GPL')
arch=('i686' 'x86_64')
url="http://kaffeine.sourceforge.net/"
depends=('libx11' 'libxtst' 'libxcb' 'kdelibs>=3.5.7' 'libart-lgpl' 'lame' 'cdparanoia' 'fam' 'xine-lib>=1.1.10' 'gstreamer0.10-base')
source=("http://heanet.dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2")

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  [ -z "${QTDIR}" ] && . /etc/profile.d/qt3.sh
  [ -z "${KDEDIR}" ] && . /etc/profile.d/kde.sh

  ./configure --prefix=/opt/kde --with-xorg LDFLAGS="-L/usr/X11R6/lib -lX11 -lXtst" 
  # why set this LDFLAGS : http://bugs.kde.org/show_bug.cgi?id=120896
  #--enable-gcc-hidden-visibility
  make || return 1
  make DESTDIR=${startdir}/pkg install
  # remove already provided file by kdelibs
  rm ${startdir}/pkg/opt/kde/share/mimelnk/application/x-mplayer2.desktop
}

md5sums=('102cced6a686f5ffffee94652ca2a093')
