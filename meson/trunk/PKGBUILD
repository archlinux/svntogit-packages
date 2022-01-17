# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=meson
pkgver=0.61.1
pkgrel=1
pkgdesc='High productivity build system'
url='https://mesonbuild.com/'
arch=('any')
license=('Apache')
depends=('python-setuptools' 'ninja')
checkdepends=('gcc-objc' 'vala' 'rust' 'gcc-fortran' 'mono' 'boost' 'qt5-base' 'git' 'cython'
              'gtkmm3' 'gtest' 'gmock' 'protobuf' 'wxgtk3' 'python-gobject' 'gobject-introspection'
              'itstool' 'gtk3' 'java-environment=8' 'gtk-doc' 'llvm' 'clang' 'sdl2' 'graphviz'
              'doxygen' 'vulkan-validation-layers' 'openssh' 'mercurial' 'gtk-sharp-2' 'qt5-tools'
              'libwmf' 'valgrind' 'cmake' 'netcdf-fortran' 'openmpi' 'nasm' 'gnustep-base' 'libelf'
              'python-pytest-xdist' 'python2-setuptools' 'ldc' 'rust-bindgen' 'cuda' 'hotdoc')
source=(https://github.com/mesonbuild/meson/releases/download/${pkgver}/meson-${pkgver}.tar.gz{,.asc}
        skip-test.diff
        arch-meson)
sha512sums=('6c9fabd6f70c276f6daa4bab14de148692d4ab55da964143b73a4e3197ad84c0074d64b729d4492a0c1e0fbea116fa82bd349ed22cb8f53981d492b515e2fb00'
            'SKIP'
            '5a5cd1b2e12f63eab787e4e102f2bdf2b170f0a7f2675f6f4f8ae5dc8188ccab5f488dcecfbb3ab69e4c70e266d5bf5a8270214c0dc20efcca77bab976f6e38a'
            'f451f8a7ef9cf1dd724c2ce20bb85a3f1611b87b2e7a17ef0fdbe8ab82a67389f818ea30a5adfe8413143e4eac77ea2e0b8234b5b2466b41a892e2bd0435376c')
validpgpkeys=('19E2D6D9B46D8DAA6288F877C24E631BABB1FE70') # Jussi Pakkanen <jpakkane@gmail.com>

prepare() {
  cd ${pkgname}-${pkgver}

  # Our containers do not allow sanitizers to run
  patch -Np1 -i ../skip-test.diff
}

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

check() (
  cd ${pkgname}-${pkgver}
  export LC_CTYPE=en_US.UTF-8 CPPFLAGS= CFLAGS= CXXFLAGS= LDFLAGS=
  ./run_tests.py
)

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -d "${pkgdir}/usr/share/vim/vimfiles"
  cp -rt "${pkgdir}/usr/share/vim/vimfiles" data/syntax-highlighting/vim/*/

  install -Dt "${pkgdir}/usr/share/bash-completion/completions" -m644 data/shell-completions/bash/*
  install -Dt "${pkgdir}/usr/share/emacs/site-lisp" -m644 data/syntax-highlighting/emacs/*
  install -Dt "${pkgdir}/usr/share/zsh/site-functions" -m644 data/shell-completions/zsh/*

  # Arch packaging helper
  install -D ../arch-meson -t "${pkgdir}/usr/bin"
}

# vim:set sw=2 et:
