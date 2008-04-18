# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Ben <contrasutra@myrealbox.com>

pkgname=bmp
pkgver=0.9.7.1
pkgrel=4
pkgdesc="gtk2 port of xmms"
url="http://bmp.beep-media-player.org/"
depends=('esd' 'id3lib' 'libglade' 'libsm' 'libvorbis' 'unzip')
source=(http://dl.sourceforge.net/sourceforge/beepmp/$pkgname-$pkgver.tar.gz $pkgver-visualization.patch bmp-${pkgver}-crossfade-0.3.9.patch)
md5sums=('c25d5a8d49cc5851d13d525a20023c4c' 'fa1bdf5a8d03e8539a6bed5caa471176')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p0 -i ../${pkgver}-visualization.patch
  patch -p1 -i ../${pkgname}-${pkgver}-crossfade-0.3.9.patch
  ./configure --prefix=/usr
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
# vim: ts=2 sw=2 et ft=sh
