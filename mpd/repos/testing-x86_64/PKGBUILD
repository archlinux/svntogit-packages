# $Id$
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd
pkgver=0.15.6
pkgrel=3
pkgdesc="Music daemon that plays MP3, FLAC, and Ogg Vorbis files"
arch=('i686' 'x86_64')
license=('GPL')
url="http://musicpd.org"
depends=('libao' 'ffmpeg>=20100108' 'libmodplug' 'audiofile' 'libshout' 'libmad' 'curl'
         'sqlite3' 'libsamplerate' 'libmms' 'wavpack' 'libmpcdec' 'avahi')
makedepends=('pkgconfig')
install=mpd.install
source=(http://downloads.sourceforge.net/musicpd/${pkgname}-${pkgver}.tar.bz2
        'mpd')
md5sums=('e0b7a11f86f8f021a92c49a96032ff39'
         'b1fd15de359db08e4b9ae4b199640f0e')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-lastfm \
    --disable-cue \
    --disable-sidplay \
    --disable-pulse || return 1
  make || return 1
  make DESTDIR=${pkgdir} install

  # set ours dirs in mpd.conf file
  sed -i 's|^music_directory.*$|#music_directory "path_to_your_music_collection"|1' doc/mpdconf.example
  sed -i 's|playlist_directory.*$|playlist_directory "/var/lib/mpd/playlists"|1' doc/mpdconf.example
  sed -i 's|db_file.*$|db_file "/var/lib/mpd/mpd.db"|1' doc/mpdconf.example
  sed -i 's|log_file.*$|log_file "/var/log/mpd/mpd.log"|1' doc/mpdconf.example
  sed -i 's|error_file.*$|error_file "/var/log/mpd/mpd.error"|1' doc/mpdconf.example
  sed -i 's|#pid_file.*$|pid_file "/var/run/mpd/mpd.pid"|1' doc/mpdconf.example
  sed -i 's|#state_file.*$|state_file "/var/lib/mpd/mpdstate"|1' doc/mpdconf.example
  sed -i 's|#user.*$|user "mpd"|1' doc/mpdconf.example

  install -Dm644 doc/mpdconf.example ${pkgdir}/etc/mpd.conf.example || return 1

  install -D ${srcdir}/mpd ${pkgdir}/etc/rc.d/mpd || return 1
  install -d ${pkgdir}/var/lib/mpd/playlists ${pkgdir}/var/log/mpd ${pkgdir}/var/run/mpd
}
