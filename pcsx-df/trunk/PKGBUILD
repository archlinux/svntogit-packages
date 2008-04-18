# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
pkgname=pcsx-df
pkgver=1.818
pkgrel=1
pkgdesc="Debian fork of the abandoned original PCSX"
arch=(i686 x86_64)
url="http://aboenterprises.ca/pcsx-df"
license=('GPL')
depends=('libglade' 'libgl' 'libxv' 'alsa-lib' 'bzip2')
makedepends=('pkgconfig' 'mesa' 'diffutils')
options=('!libtool')
provides=('pcsx')
source=(http://aboenterprises.ca/pcsx-df/files/pcsx-df-${pkgver}.tar.gz
        http://aboenterprises.ca/pcsx-df/files/dfOpenGL-1.1.0.tar.gz)

[ "${CARCH}" == "i686" ] && makedepends="${makedepends[@]} nasm"

build() {
  cd ${startdir}/src/pcsx-df-${pkgver}
  flags="--enable-alsa"
  if [ ! "${CARCH}" == "i686" ]; then
    flags="${flags} --disable-nasm"
  fi

  ./configure --prefix=/usr $flags
  make || return 1
  make DESTDIR="$startdir/pkg" install

  cd ../dfOpenGL 
  make clean
  make || return 1
  install -m755 libdfOpenGL.so ${startdir}/pkg/usr/lib/games/psemu/libdfOpenGL.so
}

md5sums=('9315b421396a34bfd57be5d25f88dff7'
         '36ccf31d0b88f099bf4acd6a16b5b04c')
