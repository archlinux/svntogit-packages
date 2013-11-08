# $Id$
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd
pkgver=0.18.2
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music'
url='http://www.musicpd.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('libao' 'ffmpeg' 'libmodplug' 'audiofile' 'libshout' 'libmad' 'curl' 'faad2'
         'sqlite' 'jack' 'libmms' 'wavpack' 'avahi' 'libid3tag' 'yajl')
makedepends=('doxygen')
source=("http://www.musicpd.org/download/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz"{,.sig}
        'tmpfiles.d'
        'conf')
sha1sums=('116f4cf0147320abd5253435c4be134a1d5eace8' 'SKIP'
          'f4d5922abb69abb739542d8e93f4dfd748acdad7'
          '67c145c046cddd885630d72ce8ebe71f8321ff3b')

backup=('etc/mpd.conf')
install=install

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed 's:cdio/paranoia.h:cdio/paranoia/paranoia.h:g' -i src/input/CdioParanoiaInputPlugin.cxx
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-jack \
		--enable-soundcloud \
		--enable-pipe-output \
		--enable-pulse \
		--disable-sidplay \
		--with-systemdsystemunitdir=/usr/lib/systemd/system
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 ../conf "${pkgdir}"/etc/mpd.conf
	install -Dm644 ../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
	install -d -g 45 -o 45 "${pkgdir}"/var/lib/mpd/playlists
	install -d "${pkgdir}"/usr/lib/systemd/user
	ln -s ../system/mpd.service "${pkgdir}"/usr/lib/systemd/user/mpd.service
}
