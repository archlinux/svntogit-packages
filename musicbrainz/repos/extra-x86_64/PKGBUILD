# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=musicbrainz
pkgver=2.1.5
pkgrel=1
pkgdesc="MusicBrainz is the second generation incarnation of the CD Index"
arch=(i686 x86_64)
license=('LGPL')
depends=('gcc' 'expat>=2.0')
makedepends=('python>=2.5')
options=('!libtool')
source=(ftp://ftp.musicbrainz.org/pub/musicbrainz/libmusicbrainz-${pkgver}.tar.gz)
url="http://www.musicbrainz.org/index.html"

build() {
  cd ${startdir}/src/lib${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install

  cd python
  python setup.py install --root=${startdir}/pkg
}
md5sums=('d5e19bb77edd6ea798ce206bd05ccc5f')
