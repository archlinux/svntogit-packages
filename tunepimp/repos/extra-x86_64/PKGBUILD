# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=tunepimp
pkgver=0.5.3
pkgrel=5
pkgdesc="The TunePimp library (also referred to as libtunepimp) is a development library geared towards developers who wish to create MusicBrainz enabled tagging applications."
arch=(i686 x86_64)
license=('GPL')
options=('!libtool')
makedepends=('python')
depends=('curl>=7.16.2' 'musicbrainz' 'zlib' 'libmad' 'flac>=1.1.4' 'libvorbis' 'readline' 'libmpcdec' 'libofa' 'taglib' 'libmp4v2')
replaces=('trm')
source=(ftp://ftp.musicbrainz.org/pub/musicbrainz/lib${pkgname}-${pkgver}.tar.gz)
url="http://www.musicbrainz.org/products/tunepimp/"

build() {
  cd ${startdir}/src/lib${pkgname}-${pkgver}
  sed -i -e 's,-ltermcap,-lncurses,' configure
  sed -i -e 's:-lthr:-lpthread:g' lib/threads/posix/Makefile.in
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  # install python bindings
  cd python
  python setup.py install --root=${startdir}/pkg

  # fix includes for kdemultimedia
  cd ${startdir}/pkg/usr/include
  ln -s tunepimp-0.5 tunepimp
}
md5sums=('09649f983acef679a548344ba7a9bb2f')
