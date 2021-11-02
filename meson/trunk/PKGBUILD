# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=meson
pkgver=0.60.1
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
source=(https://github.com/mesonbuild/meson/releases/download/${pkgver/rc/.rc}/meson-${pkgver}.tar.gz{,.asc}
        skip-test.diff
        arch-meson)
sha512sums=('ffaa99622b0c2ec74edda7dcdebf981cd3acbc62f36bde37241cafa2ce27e520f6901eebaef978a1f8b2e1d40d540e7085d0e0723d385064988baacb5b79f31c'
            'SKIP'
            '486e60b1d470c64d07d4686bd0b4374924967b9e024ff6d9fe248f512995ece19b8b09dd69c91f26dec4bb92c61fc3d275a2b7e481c2acd10ebb90d7e3cb7e20'
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
