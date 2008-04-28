# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=texinfo
pkgver=4.12
pkgrel=1
pkgdesc="Utilities to work with and produce manuals, ASCII text, and on-line documentation from a single source file"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/texinfo/"
license=('GPL3')
depends=('ncurses')
source=(ftp://ftp.gnu.org/pub/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('e9216fb657e1555a289a14a74dac8f4f')
sha1sums=('1587ef35b68ea5d0f7a6801a86977d8b825e2f1b')

build() {
   cd ${startdir}/src/${pkgname}-${pkgver}
   ./configure --prefix=/usr
   make || return 1
   make DESTDIR=${startdir}/pkg install
}
