# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Arjan Timmerman <arjan@soulfly.nl>

pkgname=genius
pkgver=1.0.2
pkgrel=1
pkgdesc="Advanced calculator including a mathematical programming language"
arch=(i686 x86_64)
license=('GPL')
url="http://www.jirka.org/genius.html"
depends=('gmp>=4.2.2' 'vte>=0.16.11' 'gtksourceview>=1.8.5-2' 'libgnomeui>=2.20.1.1' 'mpfr>=2.2.1' 'desktop-file-utils' 'termcap-compat' 'shared-mime-info')
makedepends=('perlxml' 'pkgconfig' 'gnome-doc-utils>=0.12.0')
options=('!libtool' '!makeflags')
install=genius.install
source=(http://ftp.gnome.org/pub/GNOME/sources/genius/1.0/${pkgname}-${pkgver}.tar.bz2)
md5sums=('7c948e3426c4aaaa9bac8267094ce53d')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  #sed -i '/install-data-hook$/d' Makefile.in
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/genius \
              --localstatedir=/var --disable-static \
	      --enable-gtksourceview --disable-scrollkeeper \
	      --disable-update-mimedb
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
