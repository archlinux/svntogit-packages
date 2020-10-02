# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>

pkgbase=check
pkgname=(check check-docs)
pkgver=0.15.2
pkgrel=2
pkgdesc="A unit testing framework for C"
url="https://libcheck.github.io/check/"
arch=(x86_64)
license=(LGPL)
makedepends=(git texlive-bin texi2html doxygen awk cmake)
_commit=11970a7e112dfe243a2e68773f014687df2900e8  # tags/0.15.2
source=("git+https://github.com/libcheck/check#commit=$_commit"
        no-static.diff)
sha256sums=('SKIP'
            '1151c40e5bfb08e77175f30f79daadc8c07021c980589a6b33c6f1cf224e48df')

pkgver() {
  cd check
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd check

  # https://bugs.archlinux.org/task/68076
  patch -Np1 -i ../no-static.diff

  autoreconf -fvi
}

build() {
  CFLAGS+=" -Wno-format-extra-args"

  cmake -Hcheck -Bcmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCHECK_ENABLE_TIMEOUT_TESTS=OFF \
    -DAWK_GSUB_DBL_BSLASH='\\\\'
  cmake --build cmake

  cd check
  ./configure --prefix=/usr --disable-timeout-tests
  make all doc/doxygen doc/check_html
}

check() {
  CTEST_OUTPUT_ON_FAILURE=1 cmake --build cmake --target test

  cd check
  make check
}

package_check() {
  depends=(awk)
  optdepends=('check-docs: Documentation')
  provides=(libcheck.so)

  DESTDIR="$pkgdir" cmake --build cmake --target install

  DESTDIR="$srcdir/tmp" make -C check install
  mv tmp/usr/share/{aclocal,info} "$pkgdir/usr/share"
  mv tmp/usr/share/doc .
  rm -rv tmp
}

package_check-docs() {
  pkgdesc+=" (documentation)"

  cp -a check/doc/doxygen/html doc/check/doxygen
  cp -a check/doc/check_html   doc/check/manual

  mkdir -p "$pkgdir/usr/share"
  mv doc "$pkgdir/usr/share"
}
