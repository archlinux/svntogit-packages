# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=meson
pkgver=0.63.2
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
              'python-pytest-xdist' 'ldc' 'rust-bindgen' 'cuda' 'hotdoc')
source=(https://github.com/mesonbuild/meson/releases/download/${pkgver}/meson-${pkgver}.tar.gz{,.asc}
        0001-Skip-broken-tests.patch
        0002-compilers-Add-optimization-plain-option.patch
        0003-Add-missing-cdata-update-in-genmarshal-tests.patch
        arch-meson)
sha512sums=('770d8d82502c5cd419123e09f6a445d2cbaea4463c5fa79f1497c868bf5defc5e5779a6e550ef5fcf75d57322d2b25b61574f4df0cbf001c4325c6abdbbc30b4'
            'SKIP'
            'b59d90b5466fcf877969a49982308b1c89f0f4521e4d3774a4531bb2c0093f46b5ea2ef569e32984632e6f9c7e91328bc3511978427b553ed8c97a64a52b79ff'
            'cb53d50775c4d6c1278be73f123bd5ce80aec21bb2790289285add4052e57c4d3885b693a44f671a8e1ab8a9af40b782add5c723924a5892d71807354562dbd0'
            'a13b2d6e4b594fbd34fe19c6e077076b062145500451089a44365407045a76fb5ad5449a3b23d8d7a8d18f7ab061abd4874c815d9fa2e7d7a5f4d288339f1128'
            'f451f8a7ef9cf1dd724c2ce20bb85a3f1611b87b2e7a17ef0fdbe8ab82a67389f818ea30a5adfe8413143e4eac77ea2e0b8234b5b2466b41a892e2bd0435376c')
validpgpkeys=('19E2D6D9B46D8DAA6288F877C24E631BABB1FE70') # Jussi Pakkanen <jpakkane@gmail.com>

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ../0001-Skip-broken-tests.patch

  # Fix buildtype plain to not add -O0
  # https://github.com/mesonbuild/meson/pull/10593
  patch -Np1 -i ../0002-compilers-Add-optimization-plain-option.patch

  # Fix flaky test
  # https://github.com/mesonbuild/meson/pull/10772
  patch -Np1 -i ../0003-Add-missing-cdata-update-in-genmarshal-tests.patch
}

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

check() (
  cd ${pkgname}-${pkgver}
  export LC_CTYPE=en_US.UTF-8 CPPFLAGS= CFLAGS= CXXFLAGS= LDFLAGS=
  ./run_tests.py --failfast
)

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -d "${pkgdir}/usr/share/vim/vimfiles"
  cp -rt "${pkgdir}/usr/share/vim/vimfiles" data/syntax-highlighting/vim/*/

  install -Dt "${pkgdir}/usr/share/bash-completion/completions" -m644 data/shell-completions/bash/*
  install -Dt "${pkgdir}/usr/share/zsh/site-functions" -m644 data/shell-completions/zsh/*

  # Arch packaging helper
  install -D ../arch-meson -t "${pkgdir}/usr/bin"
}

# vim:set sw=2 sts=-1 et:
