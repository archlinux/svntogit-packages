# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca> and patched by orelien <aurelien.foret@wanadoo.fr>

pkgname=tuxracer
pkgver=0.61
pkgrel=7
pkgdesc="Tux Racer lets you take on the role of Tux the Linux Penguin as he races down steep, snow-covered mountains."
arch=(i686 x86_64)
license=('GPL')
depends=('sdl' 'sdl_mixer' 'tcl>=8.5.0' 'glibc' 'audiofile' 'gcc-libs' 'libogg' 'libvorbis' 'libxi' 'libxmu' 'mesa' 'libgl')
install=
source=(http://downloads.sourceforge.net/tuxracer/$pkgname-$pkgver.tar.gz http://downloads.sourceforge.net/tuxracer/tuxracer-data-0.61.tar.gz $pkgname-$pkgver.patch.bz2 $pkgname-pasting.patch)
md5sums=('206e8197ceaf0f00b25d4e2b4156e563' 'aef877fee9e1a56483ff01fbdfb1e4b3'\
         '785d5ec7b8353a8f6d03152b610c8dd8' '9cab49d96fb17aff1ab67d755885242f')
url="http://tuxracer.sourceforge.net/"

build() {
  cd $startdir/src/$pkgname-$pkgver
  bzip2 -d ../$pkgname-$pkgver.patch.bz2
  patch -Np1 -i ../$pkgname-$pkgver.patch
  patch -Np1 -i ../$pkgname-pasting.patch
  CFLAGS="$CFLAGS -DGLX_GLXEXT_LEGACY" ./configure --prefix=/usr --with-tcl-lib-name=tcl8.5 --with-tcl-header=tcl.h
  make || return 1
  make prefix=$startdir/pkg/usr install
  mkdir -p $startdir/pkg/usr/share/tuxracer
  mv $startdir/src/$pkgname-data-$pkgver/* $startdir/pkg/usr/share/tuxracer
  chown -R root:root $startdir/pkg/usr/share
  find $startdir/pkg/usr/share -type f -exec chmod 644 {} \;
  find $startdir/pkg/usr/share -type d -exec chmod 755 {} \;
}
