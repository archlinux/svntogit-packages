# $Id$
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd
pkgver=0.17.4
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music'
url='http://www.musicpd.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('libao' 'ffmpeg' 'libmodplug' 'audiofile' 'libshout' 'libmad' 'curl' 'faad2'
         'sqlite' 'jack' 'libmms' 'wavpack' 'avahi' 'libid3tag' 'yajl')
makedepends=('doxygen')
source=("http://www.musicpd.org/download/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz"
        'tmpfiles.d')
sha1sums=('f60b54e368fe74fde2fd4571227b0428fe0ae3cb'
          'f4d5922abb69abb739542d8e93f4dfd748acdad7')

backup=('etc/mpd.conf')
install=install

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-jack \
		--enable-lastfm \
		--enable-soundcloud \
		--enable-pulse \
		--disable-sidplay \
		--with-systemdsystemunitdir=/usr/lib/systemd/system
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -d -g 45 -o 45 "${pkgdir}"/var/lib/mpd/playlists
	install -Dm644 doc/mpdconf.example "${pkgdir}"/etc/mpd.conf
	install -Dm644 ../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
	ln -s ../system/mpd.service "${pkgdir}"/usr/lib/systemd/user/mpd.service
	sed \
		-e '/^#playlist_directory/c playlist_directory "/var/lib/mpd/playlists"' \
		-e '/^#db_file/c db_file "/var/lib/mpd/mpd.db"' \
		-e '/^#pid_file/c pid_file "/run/mpd/mpd.pid"' \
		-e '/^#state_file/c state_file "/var/lib/mpd/mpdstate"' \
		-e '/^#user/c user "mpd"' \
		-i "${pkgdir}"/etc/mpd.conf
}
