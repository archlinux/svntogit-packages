# $Id$
# Maintainer: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd
pkgver=0.13.1
pkgrel=2
pkgdesc="Music daemon that plays MP3, FLAC, and Ogg Vorbis files"
arch=('i686' 'x86_64')
license=("GPL")
url="http://musicpd.org"
depends=('libid3tag' 'libmad' 'flac>=1.1.3' 'audiofile' 'faad2>=2.5' 'libmikmod'
         'alsa-lib' 'libshout' 'libmpcdec>=1.2.5' 'libsamplerate' 'libao')
install=mpd.install
source=(http://musicpd.org/uploads/files/mpd-${pkgver}.tar.gz
        mpd mpd.conf.example)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --disable-jack --enable-ao -with-zeroconf=no
  make || return 1
  make DESTDIR=${startdir}/pkg install

  install -D ../mpd ${startdir}/pkg/etc/rc.d/mpd
  install -Dm644 ../mpd.conf.example ${startdir}/pkg/etc/mpd.conf.example
  mkdir -p ${startdir}/pkg/var/lib/mpd/playlists
  mkdir -p ${startdir}/pkg/var/log/mpd
  mkdir -p ${startdir}/pkg/var/run/mpd
}
md5sums=('3079a76b7ce048d89e2f644b578cd4fe'
         'b1fd15de359db08e4b9ae4b199640f0e'
         'b3e370377d39d17427c50f04a0cdea6e')
