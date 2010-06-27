# $Id$
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd
pkgver=0.15.10
pkgrel=2
pkgdesc="Music daemon that plays MP3, FLAC, and Ogg Vorbis files"
arch=('i686' 'x86_64')
license=('GPL')
url="http://mpd.wikia.com/wiki/Server"
depends=('libao' 'ffmpeg' 'libmodplug' 'audiofile' 'libshout' 'libmad' 'curl' 'faad2'
         'sqlite3' 'libsamplerate' 'libmms' 'wavpack' 'libmpcdec' 'avahi' 'libid3tag')
makedepends=('pkgconfig')
install=${pkgname}.install
source=("http://downloads.sourceforge.net/musicpd/${pkgname}-${pkgver}.tar.bz2"
        'mpd')
md5sums=('fb18fa3ed5ff7e3719536a6603098df5'
         '84583825d4a191aeb89f5709a3808118')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-lastfm \
    --disable-cue \
    --disable-sidplay \
    --disable-pulse
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
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

  install -Dm644 doc/mpdconf.example ${pkgdir}/etc/mpd.conf.example

  install -Dm755 ${srcdir}/mpd ${pkgdir}/etc/rc.d/mpd
  install -d ${pkgdir}/var/{lib/mpd/playlists,log/mpd}
}
