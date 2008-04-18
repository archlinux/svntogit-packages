# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=dvd+rw-tools
pkgver=7.1
origver=7.1 # sometimes it is not the same as pkgver and has '-' in it
pkgrel=1
[ "$CARCH" = "x86_64" ] && force=y
pkgdesc="dvd burning tools"
arch=(i686 x86_64)
license=('GPL')
url="http://fy.chalmers.se/~appro/linux/DVD+RW"
depends=('cdrkit' 'gcc-libs')
source=("http://fy.chalmers.se/~appro/linux/DVD+RW/tools/${pkgname}-$origver.tar.gz"
	"buildpatch-7.0-3-20080108-karolina.patch")
md5sums=('8acb3c885c87f6838704a0025e435871' '54b4dc52f5380216d4d9fc2dd2086d31')

build() {
  	# fix build, thank you Karolina
	cd $startdir/src/$pkgname-$pkgver
	patch -Np1 -i $startdir/src/buildpatch-7.0-3-20080108-karolina.patch

  cd ${startdir}/src/${pkgname}-${pkgver}
  make || return 1
  mkdir -p ${startdir}/pkg/usr/bin
  for bin in growisofs dvd+rw-booktype dvd+rw-format dvd+rw-mediainfo dvd-ram-control; do
    install -D -m755 $bin ${startdir}/pkg/usr/bin/$bin || return 1
  done
  install -D -m644 growisofs.1 ${startdir}/pkg/usr/share/man/man1/growisofs.1 || return 1
}


