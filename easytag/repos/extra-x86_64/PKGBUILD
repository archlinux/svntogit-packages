# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Maintainer: dorphell <dorphell@archlinux.org>

pkgname=easytag
pkgver=2.1.4
pkgrel=1
pkgdesc="Utility for viewing, editing and writing ID3 tags of your MP3 files"
arch=(i686 x86_64)
license=('GPL')
url="http://easytag.sourceforge.net/"
depends=('id3lib' 'libid3tag' 'gtk2' 'libvorbis' 'flac>=1.2.1' 'libmp4v2' 'speex')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('201bd38a73100e14fb6d81243a9c3a1b')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
