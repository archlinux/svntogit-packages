# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=libtorrent-rasterbar
pkgver=1.1.13
pkgrel=4
epoch=1
pkgdesc="A C++ BitTorrent library that aims to be a good alternative to all the other implementations around"
url="https://www.rasterbar.com/products/libtorrent/"
arch=('x86_64')
license=('BSD')
depends=('boost-libs')
makedepends=('boost' 'python2' 'python')
options=('!emptydirs')
_pkgver=${pkgver//./_}
source=(https://github.com/arvidn/libtorrent/releases/download/libtorrent-$_pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('021fc54353fdf5063d55ccdc2057dada292bb0008fb92e93e8d94dd89f529630f290fcdc4f4d095e3192522c57fe0f0da260b5ef8e8e15a8c6ac05728f5f7160')

prepare() {
  mkdir py2 py3
  cd $pkgname-$pkgver

  # Avoid depending on newer processors
  sed -i 's/-msse4.2//' configure.ac

  autoreconf -if
}

_build() (
  cd py$1

  # FS#50745
  _boost="boost_python"
  if [ $1 -eq 3 ]; then _boost="boost_python3"; fi

  # https://github.com/qbittorrent/qBittorrent/issues/5265#issuecomment-220007436
  CXXFLAGS="$CXXFLAGS -std=c++11" \
  PYTHON=/usr/bin/python$1 \
  ../$pkgname-$pkgver/configure \
    --prefix=/usr \
    --enable-python-binding \
    --enable-examples \
    --disable-static \
    --with-libiconv \
    --with-boost-python=$_boost
)

build() {
  _build 2
  _build 3
}

package() {
  make -C py2 DESTDIR="$pkgdir" install
  make -C py3 DESTDIR="$pkgdir" install
  install -Dm644 $pkgname-$pkgver/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Remove most example binaries
  rm "$pkgdir"/usr/bin/{*_test,*_tester,simple_client,stats_counters}
}
