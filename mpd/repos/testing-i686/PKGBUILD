# $Id$
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd
pkgver=0.16.7
pkgrel=2
pkgdesc='Flexible, powerful, server-side application for playing music'
url='http://mpd.wikia.com/wiki/Music_Player_Daemon_Wiki'
license=('GPL')
arch=('i686' 'x86_64')
depends=('libao' 'ffmpeg' 'libmodplug' 'audiofile' 'libshout' 'libmad' 'curl' 'faad2'
         'sqlite3' 'jack' 'libmms' 'wavpack' 'libmpcdec' 'avahi' 'libid3tag'
         'libpulse')
makedepends=('doxygen')
source=("http://downloads.sourceforge.net/musicpd/${pkgname}-${pkgver}.tar.bz2"
        'rc.d') 
sha1sums=('878f3ce82d4f00f6cbad63a625b2c0274c4a704a'
          '3777bdb4fff4b7911be3b1242aabae9d2912ef18')

install=install

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-lastfm \
		--enable-jack \
		--enable-pulse \
		--enable-documentation \
		--disable-libwrap \
		--disable-cue \
		--disable-sidplay \
		--with-systemdsystemunitdir=/lib/systemd/system

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	sed \
		-e '/^#playlist_directory/c playlist_directory "/var/lib/mpd/playlists"' \
		-e '/^#db_file/c db_file "/var/lib/mpd/mpd.db"' \
		-e '/^#pid_file/c pid_file "/run/mpd/mpd.pid"' \
		-e '/^#state_file/c state_file "/var/lib/mpd/mpdstate"' \
		-e '/^#user/c user "mpd"' \
		-i doc/mpdconf.example

	install -Dm755 ../rc.d "${pkgdir}"/etc/rc.d/mpd
	install -d -g 45 -o 45 "${pkgdir}"/var/lib/mpd/playlists
	install -Dm644 doc/mpdconf.example "${pkgdir}"/usr/share/mpd/mpd.conf.example

	cd "${pkgdir}"/usr/share/doc/mpd
	tar cfJ api.tar.xz --remove-files api
	rmdir developer protocol user
}
