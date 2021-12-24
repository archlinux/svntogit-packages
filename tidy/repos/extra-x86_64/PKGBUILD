# Maintainer:
# Contributor: eric <eric@archlinux.org>
# Contributor: Markus Meissner <markus@meissna.de>

pkgname=tidy
pkgver=5.8.0
_commit=9f8d957e4d9c164b0aea10a36c7933d67517abb1
pkgrel=2
pkgdesc="A tool to tidy down your HTML code to a clean style"
arch=(x86_64)
url="https://www.html-tidy.org/"
license=(custom)
depends=(glibc)
makedepends=(cmake libxslt)
conflicts=(tidyhtml)
provides=(tidyhtml)
replaces=(tidyhtml)
source=("$pkgname-$_commit.tar.gz::https://github.com/htacg/tidy-html5/archive/$_commit.tar.gz")
sha512sums=('085da1bc97ab20a65d1104bd13e39ba7eb7a51407553e9237e8efda0a2c3b6efcb2e957a670731482ac17b639f12fe59a1f52740e82d4367410fe41e62afc8a2')

prepare() {
  mv tidy-html5-{$_commit,$pkgver}
  mkdir -p build
}

build() {
  cd build
  export CFLAGS+=" -ffat-lto-objects"
  export CXXFLAGS+=" -ffat-lto-objects"
  cmake ../tidy-html5-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

# Compatibility symlinks until everything is ported
  ln -s tidybuffio.h "$pkgdir"/usr/include/buffio.h
  ln -s tidyplatform.h "$pkgdir"/usr/include/platform.h

  install -Dm644 "$srcdir"/$pkgname-html5-$pkgver/README/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
