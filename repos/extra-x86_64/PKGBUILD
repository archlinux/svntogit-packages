# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: kastor <kastor@fobos.org.ar>

_name=pupnp
pkgname=libupnp
pkgver=1.14.17
pkgrel=1
pkgdesc='Portable Open Source UPnP Development Kit'
arch=(x86_64)
url="https://pupnp.sourceforge.io/"
license=(BSD)
depends=(glibc)
makedepends=(cmake)
provides=(
  libixml.so
  libupnp.so
)
source=(https://github.com/$_name/$_name/archive/release-$pkgver/$_name-release-$pkgver.tar.gz)
sha512sums=('d9af7231687bb694961822a9d3b1e9b04e52142f0245729902b240564579903858e01a5cfe53ff7a8fa77e44e36b840f0c355d2c79aaf0ced2498b4b1822ed6b')
b2sums=('8bb38dbdff59cf4fd6c222cf1000ecc195f8d33601d8c06476b0a238d6969fe695bcb52f721e4d88a95fa63ef568881e1628935c3b5ba063b72a3b3ee27ded8b')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D UPNP_BUILD_STATIC=OFF
    -D blocking_tcp_connections=OFF
    -D reuseaddr=ON
    -S $_name-release-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $_name-release-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm 644 $_name-release-$pkgver/{ChangeLog,README.md} -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
