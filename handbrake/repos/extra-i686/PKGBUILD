# Maintainer: Varun Acharya <varun@archlinux.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=handbrake
pkgver=0.9.1
pkgrel=6
pkgdesc="HandBrake is a multiplatform, multithreaded DVD to MPEG-4 ripper/converter"
arch=('i686' 'x86_64')
url="http://handbrake.m0k.org/"
license=('GPL')
depends=()
makedepends=('ftjam' 'wget' 'patch' 'yasm')
conflicts=('handbrake-bin')
source=(http://junk.phantomgorilla.com/hb/HandBrake-0.9.1.tar.gz \
	$pkgname-libmp4v2.patch $pkgname-libdvdcss.patch)
md5sums=('0eefe9189d59a0bfd9aeee41fd3d01a2' \
	 '2df0108886aa111554d76522e6272a11' 'dc9dfa2893ccd67cbf3f2ba48db6a1b4')

build() {
  cd $startdir/src/HandBrake
  # Patch for libmp4v2
  patch -p1 <../$pkgname-libmp4v2.patch || return 1
  # Patch for libdvdcss
  patch -p1 <../$pkgname-libdvdcss.patch || return 1

  #Build with optimizations:
  if [ "$CARCH" = "x86_64" ]; then
  	OPTIM="-march=x86-64" ./configure
  else  OPTIM="-march=i686" ./configure
  fi
  jam || return 1
  mkdir -p ${startdir}/pkg/usr/bin || return 1
  install -m755 HandBrakeCLI $startdir/pkg/usr/bin/HandBrakeCLI || return 1
  ln -s /usr/bin/HandBrakeCLI ${startdir}/pkg/usr/bin/handbrake || return 1
}
