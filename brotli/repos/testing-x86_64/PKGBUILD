# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: TingPing <tingping@tingping.se>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgbase=brotli
pkgname=('brotli' 'python-brotli' 'brotli-testdata')
_gitcommit=e61745a6b7add50d380cfd7d3883dd6c62fc2c71
pkgver=1.0.9
pkgrel=8
pkgdesc='Generic-purpose lossless compression algorithm'
url='https://github.com/google/brotli'
arch=('x86_64')
license=('MIT')
makedepends=('git' 'glibc' 'gcc-libs' 'cmake' 'python-setuptools')
source=(${pkgname}::"git+${url}#commit=${_gitcommit}")
sha512sums=('SKIP')

prepare() {
  cd ${pkgbase}
  git cherry-pick -n 09b0992b6acb7faa6fd3b23f9bc036ea117230fc # Fix broken Libs: in pc file
}

pkgver() {
  cd ${pkgbase}
  git describe --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgbase}
  python setup.py build
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=True \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects"
  make -C build VERBOSE=1
}

check() {
  cd ${pkgbase}
  make test
  python setup.py test
}

package_brotli() {
  depends=('gcc-libs' 'glibc')
  provides=(libbrotlicommon.so libbrotlidec.so libbrotlienc.so)

  cd ${pkgbase}
  make -C build DESTDIR="$pkgdir" install
  local man;
  for man in docs/*.?; do
    install -Dm 644 "$man" "$pkgdir/usr/share/man/man${man##*.}/${man##*/}"
  done
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_python-brotli() {
  pkgdesc+=' - python library'
  depends=('python' 'glibc' 'gcc-libs')

  cd ${pkgbase}
  python setup.py install --skip-build -O1 --root="$pkgdir"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_brotli-testdata() {
  pkgdesc+=' - test data'
  depends=()

  cd ${pkgbase}
  install -dm755 "$pkgdir"/usr/share/brotli
  cp -a tests/testdata "$pkgdir"/usr/share/brotli/
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
