# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=meson
pkgver=0.54.0
pkgrel=1
pkgdesc='High productivity build system'
url='https://mesonbuild.com/'
arch=('any')
license=('Apache')
depends=('python-setuptools' 'ninja')
checkdepends=('gcc-objc' 'vala' 'rust' 'gcc-fortran' 'mono' 'boost' 'qt5-base' 'git' 'cython'
              'gtkmm3' 'gtest' 'gmock' 'protobuf' 'wxgtk' 'python-gobject' 'gobject-introspection'
              'itstool' 'gtk3' 'java-environment=8' 'gtk-doc' 'llvm' 'clang' 'sdl2' 'graphviz'
              'doxygen' 'vulkan-validation-layers' 'openssh' 'mercurial' 'gtk-sharp-2' 'qt5-tools'
              'libwmf' 'valgrind' 'cmake' 'netcdf-fortran' 'openmpi' 'nasm' 'gnustep-base' 'libelf'
              'python-pytest-xdist') # 'cuda')
source=(https://github.com/mesonbuild/meson/releases/download/${pkgver}/meson-${pkgver}.tar.gz{,.asc}
        skip-test.diff
        0001-Fix-meson_jar_template-so-test-suite-passes.patch
        arch-meson)
sha512sums=('e3c97ffd9409a543e45c8be7b12d4e8437de8dbd0cd236fbe092952d7d0833728d46ff6b679c8a73dae4c4016fdf38b43b56f3959a95968a29db109ebfe254e7'
            'SKIP'
            'fd1694e74cfa628bda81b1056061d75fa288e04d72bda733f3667be43cfb21c60f2e89455e4a101a7f6bef5754fe112dc84e18ec7a0807bc791015c34deea347'
            '1203c844466409fceb6e3bd4f419762d7dcd460f4dbf412eda7d966b002dd69710af97d9135fc399c71fdcd191aa512bf180e60562f5996932e2827acf591eb2'
            'f451f8a7ef9cf1dd724c2ce20bb85a3f1611b87b2e7a17ef0fdbe8ab82a67389f818ea30a5adfe8413143e4eac77ea2e0b8234b5b2466b41a892e2bd0435376c')
validpgpkeys=('95181F4EED14FDF4E41B518D3BF4693BFEEB9428') # Jussi Pakkanen <jpakkane@gmail.com>

prepare() {
  cd ${pkgname}-${pkgver}

  # Our containers do not allow sanitizers to run
  patch -Np1 -i ../skip-test.diff

  # https://github.com/mesonbuild/meson/pull/6868
  patch -Np1 -i ../0001-Fix-meson_jar_template-so-test-suite-passes.patch
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

  install -Dt "${pkgdir}/usr/share/emacs/site-lisp" -m644 data/syntax-highlighting/emacs/*
  install -Dt "${pkgdir}/usr/share/zsh/site-functions" -m644 data/shell-completions/zsh/*

  # Arch packaging helper
  install -D ../arch-meson -t "${pkgdir}/usr/bin"
}

# vim: ts=2 sw=2 et:
