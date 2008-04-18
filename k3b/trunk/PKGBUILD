# $Id$
# Contributor: jlvsimoes
# Maintainer: damir <damir@archlinux.org>

pkgname=k3b
pkgver=1.0.4
pkgrel=2
depends=('cdrdao' 'cdrkit' 'cdparanoia' 'kdelibs>=3.5.6' 'libsamplerate'
	 'normalize' 'sox' 'hal>=0.5.8.1-6' 'ffmpeg>=20070131' 'musicbrainz' 
	 'taglib>=1.4' 'libmpcdec>=1.2.5' 'libdvdread' 'dbus-qt3' 'flac>=1.2.0')
pkgdesc="Feature-rich and easy to handle CD burning application"
arch=("i686" "x86_64")
license=('GPL')
install=k3b.install
source=(http://downloads.sourceforge.net/sourceforge/k3b/${pkgname}-${pkgver}.tar.bz2)

url="http://k3b.sourceforge.net/"

build() {
  [ -z "${QTDIR}" ] && . /etc/profile.d/qt.sh
  [ -z "${KDEDIR}" ] && . /etc/profile.d/kde.sh
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/opt/kde --enable-mt --disable-debug \
  		--enable-debug=no --with-k3bsetup=no \
		--without-cdrecord-suid-root \
		--enable-ffmpeg-all-codecs
  make || return 1
  make DESTDIR=${startdir}/pkg install
}

md5sums=('42538ddae0809707d3bcdbe0a6ed6a43')
