# $Id$
# Maintainer: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd
pkgver=0.14
pkgrel=2
pkgdesc="Music daemon that plays MP3, FLAC, and Ogg Vorbis files"
arch=('i686' 'x86_64')
license=('GPL')
url="http://musicpd.org"
depends=('libid3tag' 'libmad' 'flac>=1.1.3' 'audiofile' 'faad2>=2.6.1' 'libmikmod'
         'alsa-lib' 'libshout' 'libmpcdec>=1.2.5' 'libsamplerate' 'libao')
install=mpd.install
source=(http://downloads.sourceforge.net/musicpd/${pkgname}-${pkgver}.tar.gz
        'mpd' 'mpd.conf.example')
md5sums=('4a4854e5998f4f0b226d541717aa4fa6'
	'b1fd15de359db08e4b9ae4b199640f0e'
	'b3e370377d39d17427c50f04a0cdea6e')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-jack \
    --enable-ao \
    --with-zeroconf=no
  make || return 1
  make DESTDIR=${pkgdir} install

  install -D ${srcdir}/mpd ${pkgdir}/etc/rc.d/mpd
  install -Dm644 ${srcdir}/mpd.conf.example ${pkgdir}/etc/mpd.conf.example
  install -d ${pkgdir}/var/lib/mpd/playlists
  install -d ${pkgdir}/var/log/mpd
  install -d ${pkgdir}/var/run/mpd
}
