# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=meson
pkgver=0.49.0
pkgrel=1
pkgdesc='High productivity build system'
url='http://mesonbuild.com/'
arch=('any')
license=('Apache')
depends=('python-setuptools' 'ninja')
checkdepends=('gcc-objc' 'vala' 'rust' 'gcc-fortran' 'mono' 'boost' 'qt4' 'qt5-base' 'git' 'cython'
              'gtkmm3' 'gtest' 'gmock' 'protobuf' 'wxgtk' 'python-gobject' 'gobject-introspection'
              'itstool' 'gtk3' 'java-environment=8' 'gtk-doc' 'llvm' 'clang' 'sdl2' 'graphviz'
              'doxygen' 'vulkan-validation-layers' 'openssh' 'mercurial' 'gtk-sharp-2' 'qt5-tools'
              'libwmf' 'dmd' 'valgrind')
source=(https://github.com/mesonbuild/meson/releases/download/${pkgver}/meson-${pkgver}.tar.gz{,.asc}
        arch-meson)
sha512sums=('f36994d1a030c985a51aa335eaceea608dcb1692cea7d2d4caeeb2b3bf471837dffdc502aa940742eb8c605d15b8adb35ba36b7da5d10455b7fd0ef5a48663e3'
            'SKIP'
            'f9e93c14913e7391b16f9dd011c63d6af9be897f2afed94015ae7959526d99f4bc774a608ce20571f0bdf32688287836859787d931fb0662777b5ce13c4af31a')
validpgpkeys=('95181F4EED14FDF4E41B518D3BF4693BFEEB9428') # Jussi Pakkanen <jpakkane@gmail.com>

prepare() {
  cd ${pkgname}-${pkgver}

  # Succeeds for us?
  mv 'test cases/failing/85 gtest dependency with version' 'test cases/frameworks/'
}

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

check() (
  cd ${pkgname}-${pkgver}

  # set for debug output
  #export MESON_PRINT_TEST_OUTPUT=1

  export LC_CTYPE=en_US.UTF-8
  ./run_tests.py
)

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -d "${pkgdir}/usr/share/vim/vimfiles"
  cp -rt "${pkgdir}/usr/share/vim/vimfiles" data/syntax-highlighting/vim/*/

  install -Dt "${pkgdir}/usr/share/emacs/site-lisp" -m644 data/syntax-highlighting/emacs/*
  install -Dt "${pkgdir}/usr/share/zsh/site-functions" -m644 data/shell-completions/zsh/*

  # Arch packaging helper
  install -D ../arch-meson -t "${pkgdir}/usr/bin"
}

# vim: ts=2 sw=2 et:
