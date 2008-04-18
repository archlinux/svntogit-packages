# $Id$
# Maintainter: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=hmmer
pkgver=2.3.2
pkgrel=2
pkgdesc="Profile hidden Markov models (profile HMMs) can be used to do sensitive database searching using statistical descriptions of a sequence family's consensus"
arch=(i686 x86_64)
license=('GPL')
url="http://hmmer.janelia.org/"
source=(ftp://selab.janelia.org/pub/software/hmmer/CURRENT/$pkgname-$pkgver.tar.gz)
depends=('glibc')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install || return 1
}


md5sums=('5f073340c0cf761288f961a73821228a')
