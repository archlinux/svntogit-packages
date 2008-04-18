# $Id$
# Maintainer: juergen <juergen@hoetzel.info>
# Contributor: Manolis Tzanidakis, Petter Gundersen

pkgname=scummvm
pkgver=0.11.1
pkgrel=1
pkgdesc="A 'virtual machine' for several classic graphical point-and-click adventure games."
arch=(i686 x86_64)
license=('GPL')
url="http://www.scummvm.org/"
depends=('gcc-libs' 'alsa-lib' 'libmad' 'libvorbis' 'zlib' 'libmpeg2' 'flac>=1.1.4')
source=(http://heanet.dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('8dc9eb9d18574a7ecfa6586892e0de4e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --backend=sdl --disable-debug \
			--with-mpeg2-prefix=/usr \
			--with-flac-prefix=/usr \
                        --prefix=/usr \
                        --disable-fluidsynth
  /usr/bin/make || return 1
  /bin/install -D -m 755 scummvm ${startdir}/pkg/usr/bin/scummvm
  /bin/install -D -m 644 dists/scummvm.6 ${startdir}/pkg/usr/man/man6/scummvm.6
  /bin/install -m644 -D gui/themes/modern.ini ${startdir}/pkg/usr/share/scummvm/modern.ini
  /bin/install -m644 -D gui/themes/modern.zip ${startdir}/pkg/usr/share/scummvm/modern.zip
}
# vim: ts=2 sw=2 et ft=sh
