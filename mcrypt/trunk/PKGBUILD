# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=mcrypt
pkgver=2.6.5
pkgrel=1
pkgdesc="mcrypt is a program for encrypting files or streams"
url="http://mcrypt.sourceforge.net/"
arch=(i686 x86_64)
license=('GPL')
depends=('mhash' 'libmcrypt>=2.5.8' 'zlib')
source=(http://heanet.dl.sourceforge.net/mcrypt/${pkgname}-${pkgver}.tar.bz2
	mcrypt-2.6.4-destdirfix.patch)
md5sums=('19d9f0b15fe68a7cae7e9faa02859c89' '36f2a201cc6ada4280c82f458b0cbe05')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  aclocal -I ./m4 || return 1
  autoconf || return 1
  automake --force --copy || return 1
  patch -Np1 -i ${startdir}/src/mcrypt-2.6.4-destdirfix.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
