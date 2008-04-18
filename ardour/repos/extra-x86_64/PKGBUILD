# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: ... let's say it was teamwork ...

# ardour, liblrdf and raptor are heavily dependent on each other. Updating of
# one package mostly will require an update of all the other packages. I vote
# for fixed dependencies speaking in terms of versions

pkgname=ardour
pkgver=2.3.1
pkgrel=1
pkgdesc="A multichannel hard disk recorder and digital audio workstation"
arch=(i686 x86_64)
license=('GPL')
url="http://ardour.org"
depends=('liblrdf>=0.4.0-5' 'libsamplerate' 'jack-audio-connection-kit' 'flac'
         'curl>=7.16.2' 'libart-lgpl' 'ladspa' 'libxslt' 'libgnomecanvas'
         'liblo' 'libusb' 'fftw')
makedepends=('librsvg' 'scons' 'boost')
install=${pkgname}.install
source=(http://ardour.org/files/releases/${pkgname}-${pkgver}.tar.bz2 \
        ${pkgname}.desktop libsndfile.patch)
md5sums=('54abb231ae0c1fa3b3f2c2177c644c22' '22ec67c24d53d2b44501f158de48c25b' \
         '583f3da75ec960f9da2cf196ed717396')

build() {
  cd ${startdir}/src/${pkgname}-2.3
  # start building ardour now
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ../libsndfile.patch || return 1
  sed -i -e "s@/configure@& --prefix=/usr@g" libs/libsndfile/SConscript
  sed -i -e "s/lib64/lib/g" SConstruct

  # force -O2 from the CFLAGS in makepkg.conf
  sed -i '/-O3/d' SConstruct
  scons ARCH="${CFLAGS}" \
        PREFIX="/usr" \
        DESTDIR="${startdir}/pkg" || return 1
  scons PREFIX="/usr" \
        DESTDIR="${startdir}/pkg" \
        install || return 1
   # install some freedesktop.org compatibility
  install -D -m644 ${startdir}/src/${pkgname}.desktop \
    ${startdir}/pkg/usr/share/applications/${pkgname}.desktop
}
