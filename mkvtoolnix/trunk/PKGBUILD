# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor 03/08/04 <lefungus@altern.org>

pkgname=mkvtoolnix
pkgver=2.2.0
pkgrel=1
pkgdesc="Set of tools to create, edit and inspect Matroska files"
arch=("i686" "x86_64")
license=('GPL')
url="http://www.bunkus.org/videotools/mkvtoolnix/index.html"
depends=('libmatroska>=0.8.1' 'flac>=1.1.4' 'libvorbis' 'bzip2' 'wxgtk>=2.8.0.1' 'file' 'pcre')
source=("http://www.bunkus.org/videotools/${pkgname}/sources/${pkgname}-${pkgver}.tar.bz2")

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/
  ./configure --prefix=/usr 
  make  || return 1
  make DESTDIR=${startdir}/pkg install
}

md5sums=('57397800c6be11db0b62e7285c8dab82')
