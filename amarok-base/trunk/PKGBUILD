# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=amarok-base
_origname=amarok
replaces=("${_origname}" 'amarok-base-mysqlfree')
pkgver=1.4.8
pkgrel=2
pkgdesc="amaroK - a media player for KDE"
arch=("i686" "x86_64")
url="http://amarok.kde.org"
license=('GPL')
depends=('amarok-engine' 'qt3' 'libmp4v2' 'libmysqlclient>=5.0.45' 'postgresql-libs>=8.2.4' 'ruby' 'tunepimp>=0.5.3')
makedepends=('pkgconfig' 'kdebase>=3.5.7' 'libgpod>=0.6.0' 'libifp>=1.0.0.2' 'libmtp>=0.2.4' 'libnjb>=2.2.5' 'libvisual>=0.4.0' 'xine-lib>=1.1.8' 'sdl>=1.2.12')
# advanced scripting depends on python
install=amarok.install
#source=(http://mark.kollide.net/amarok-${pkgver}.tar.bz2
source=("ftp://ftp.solnet.ch/mirror/KDE/stable/amarok/${pkgver}/src/${_origname}-${pkgver}.tar.bz2"
	"amarok_addaspodcast.desktop")

build() {
  export MAKEFLAGS="-j1"
  cd ${startdir}/src/${_origname}-${pkgver}
  [ -z "${QTDIR}" ] && . /etc/profile.d/qt3.sh
  [ -z "${KDEDIR}" ] && . /etc/profile.d/kde.sh
   
  # prepare build
  ./configure --prefix=/opt/kde \
  	--with-gnu-ld \
	--enable-mysql \
	--enable-postgresql \
	--with-mp4v2 \
	--with-ifp \
	--with-libnjb \
	--with-libmtp \
	--with-libgpod \
	--without-arts \
	--without-gstreamer \
	--with-xine \
	--without-nmm \
	--without-mas \
	--with-libvisual \
	--disable-debug \
	--enable-debug=no \
	--without-xmms || return 1

  # bulid
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  # remove xine engine from pkg... separate pkg
  rm ${startdir}/pkg/opt/kde/lib/kde3/libamarok_xine-engine.{la,so}
  rm ${startdir}/pkg/opt/kde/share/config.kcfg/xinecfg.kcfg
  rm ${startdir}/pkg/opt/kde/share/services/amarok_xine-engine.desktop

  mkdir -p ${startdir}/pkg/opt/kde/share/apps/konqueror/servicemenus/
  install -m644 ${startdir}/src/amarok_addaspodcast.desktop ${startdir}/pkg/opt/kde/share/apps/konqueror/servicemenus/
}

