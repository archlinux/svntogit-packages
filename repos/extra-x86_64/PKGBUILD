# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>

pkgname=moc
pkgver=2.4.3
pkgrel=2
pkgdesc="An ncurses console audio player with support for the mp3, ogg, and wave formats"
url="http://moc.daper.net/"
arch=(i686 x86_64)
license=('GPL')
depends=(libmad jack-audio-connection-kit 'curl>=7.16.2' libsamplerate)
# TODO throw these in an install file.... simple output
makedepends=(speex ffmpeg taglib libmpcdec)
source=(ftp://ftp.daper.net/pub/soft/moc/stable/${pkgname}-${pkgver}.tar.bz2)
md5sums=('8808082848e90eeec5415baaec7e98ad')
install=moc.install
options=(!libtool)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --without-rcc
  mkdir -p ${startdir}/pkg/usr/share/moc/
  install -m644 config.example ${startdir}/pkg/usr/share/moc/
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
