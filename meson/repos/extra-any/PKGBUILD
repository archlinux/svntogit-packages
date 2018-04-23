# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=meson
pkgver=0.46.0
pkgrel=1
pkgdesc='High productivity build system'
url='http://mesonbuild.com/'
arch=('any')
license=('Apache')
depends=('python' 'ninja')
makedepends=('python-setuptools')
checkdepends=('gcc-objc' 'vala' 'rust' 'gcc-fortran' 'mono' 'boost' 'qt4' 'qt5-base' 'git'
              'cython' 'gtkmm3' 'gtest' 'gmock' 'protobuf' 'wxgtk' 'python-gobject' 'gobject-introspection'
              'itstool' 'gtk3' 'java-environment=8' 'gtk-doc' 'llvm' 'clang' 'sdl2' 'graphviz'
              'doxygen' 'vulkan-validation-layers' 'openmpi' 'openssh' 'mercurial' 'gtk-sharp-2'
              'qt5-tools' 'libwmf' 'dmd' 'valgrind')
source=(https://github.com/mesonbuild/meson/releases/download/${pkgver}/meson-${pkgver}.tar.gz{,.asc}
        arch-meson)
sha512sums=('7c22178900ac58d7f40b392c4c3dc4541e09859ab4e903b58f4bd3bc6d3b7a579c597909fc56f69e0327a8fe2155d2617c0a477d322a71f90642745e8c6f2ebb'
            'SKIP'
            'e901f87f3ee1baa7b9aedb79bd5c9e50898a5695ac938f7f8420d8e81f526a09f07ceedadb65975437efa5a68fcf581110a040f579f2530437d1e6eb5addea76')
validpgpkeys=('95181F4EED14FDF4E41B518D3BF4693BFEEB9428') # Jussi Pakkanen <jpakkane@gmail.com>

prepare() {
  cd ${pkgname}-${pkgver}
}

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

check() (
  cd ${pkgname}-${pkgver}

  # --as-needed breaks openmpi linking
  LDFLAGS="${LDFLAGS/,--as-needed/}"

  # set for debug output
  #export MESON_PRINT_TEST_OUTPUT=1

  export LC_CTYPE=en_US.UTF-8
  ./run_tests.py
)

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -d "${pkgdir}/usr/share/vim/vimfiles"
  cp -rt "${pkgdir}/usr/share/vim/vimfiles" data/syntax-highlighting/vim/*

  install -Dt "${pkgdir}/usr/share/emacs/site-lisp" -m644 data/syntax-highlighting/emacs/*
  install -Dt "${pkgdir}/usr/share/zsh/site-functions" -m644 data/shell-completions/zsh/*

  # Arch packaging helper
  install -D ../arch-meson -t "${pkgdir}/usr/bin"
}

# vim: ts=2 sw=2 et:
