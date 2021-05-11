# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=meson
pkgver=0.58.0
pkgrel=2
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
        workaround-8744.diff
        skip-test.diff
        arch-meson)
sha512sums=('6a075666a12962a613c63c35e19c692b31ee434ce61040ecd12af83d98766164076744570fe426ebf7f6a93ce83f7fdce26c8447f9d3752f6b94824d57c751c5'
            'SKIP'
            '5f4ab315599c5c950048472a92b4ef28cd978cfc2aed17f8361174d68ad1ef153a72ff4e6d3d0593d0363b8988daca9c454a55c33422b9f3357e0a55e1545155'
            'a40e3be7a4ea7048cbbab59d28fb355debdfcdc5e45244aad65ab57fa222f4a2cf3165f28cc7e1dba893a162de9c7563ef0e155fa6a77960c4d02ef622313ace'
            'f451f8a7ef9cf1dd724c2ce20bb85a3f1611b87b2e7a17ef0fdbe8ab82a67389f818ea30a5adfe8413143e4eac77ea2e0b8234b5b2466b41a892e2bd0435376c')
validpgpkeys=('19E2D6D9B46D8DAA6288F877C24E631BABB1FE70') # Jussi Pakkanen <jpakkane@gmail.com>

prepare() {
  cd ${pkgname}-${pkgver}

  # Workaround https://github.com/mesonbuild/meson/issues/8744
  patch -Np1 -i ../workaround-8744.diff

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

# vim: sw=2 et:
