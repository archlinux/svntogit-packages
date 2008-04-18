# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: dorphell <dorphell@archlinux.org>
pkgname=audacity
pkgver=1.3.4
pkgrel=1
pkgdesc="Audacity is a program that lets you manipulate digital audio waveforms"
arch=('i686' 'x86_64')
depends=('libvorbis' 'libmad' 'libid3tag' 'wxgtk-2.6' 'flac' 'libsamplerate' \
         'lame' 'shared-mime-info')
makedepends=('zip' 'python' 'pkgconfig')
license=('GPL')
options=('!makeflags')
source=(http://downloads.sourceforge.net/sourceforge/audacity/${pkgname}-src-${pkgver}.tar.bz2 \
        audacity.xpm
        audacity16.xpm)
url="http://audacity.sourceforge.net/"

build() {
  cd ${startdir}/src/${pkgname}-src-${pkgver}-beta

  WX_CONFIG=/usr/bin/wx-config-2.6 \
    ./configure --prefix=/usr \
                --with-portaudio=v19 \
                --with-libsamplerate=system \
                --without-libresample \
                --with-libmad=system \
                --with-id3tag=system \
                --with-flac=system \
                --with-vorbis=system \
                --with-libexpat=system \
                --with-libsndfile=system \
                --enable-unicode
  make || return 1
  make DESTDIR=${startdir}/pkg INSTALL_PATH=${startdir}/pkg install

  install -m644 ${startdir}/src/audacity.xpm \
                ${startdir}/pkg/usr/share/${pkgname}/audacity.xpm
  install -m644 ${startdir}/src/audacity16.xpm \
                ${startdir}/pkg/usr/share/${pkgname}/audacity16.xpm
}
md5sums=('6c4ada9085f916b5ae1675eaa4754442'
         'a0f597abfd605b0e8c2d0e683c93cd66'
         '94db7bade2576db7f3154d3f3a0326e5'
         '02554130e92dcceb574954c71fcc7be9'
         '82e2af0f2cd1005a237ecfd3095dd070'
         'c8f7f7851638eedf84d05a1afde797b2'
         '5e94ccbfb665e8356dc4172a3673b4d4')
