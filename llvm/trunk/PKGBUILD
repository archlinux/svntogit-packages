# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=('llvm' 'llvm-libs' 'llvm-ocaml')
pkgver=12.0.1
pkgrel=4
_ocaml_ver=4.12.0
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2'
             "ocaml>=$_ocaml_ver" 'ocaml-ctypes' 'ocaml-findlib'
             'python-setuptools' 'python-psutil' 'python-sphinx'
             'python-recommonmark')
options=('staticlibs')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/$pkgname-$pkgver.src.tar.xz{,.sig}
        llvm-link-with-Bsymbolic-functions.patch
        add-fno-semantic-interposition.patch
        x86-twist-shuffle-mask.patch
        no-strict-aliasing-DwarfCompileUnit.patch
        llvm-config.h)
sha256sums=('7d9a8405f557cefc5a21bf5672af73903b64749d9bc3a50322239f56f34ffddf'
            'SKIP'
            '560ce1e206c19f4b86f4c583b743db0ad47a610418999350710aafd60ae50fcd'
            'fc8c64267a5d179e9fc24fb2bc6150edef2598c83f5b2d138d14e05ce9f4e345'
            'c51b8754f76eb3774f46d530409f6d89f5bb47d90f0d718dbfa861f716b29693'
            'd1eff24508e35aae6c26a943dbaa3ef5acb60a145b008fd1ef9ac6f6c4faa662'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  cd "$srcdir/llvm-$pkgver.src"
  mkdir build

  # https://bugs.archlinux.org/task/70697
  patch -Np2 -i ../llvm-link-with-Bsymbolic-functions.patch
  # https://reviews.llvm.org/D102453
  patch -Np2 -i ../add-fno-semantic-interposition.patch

  # https://bugs.llvm.org/show_bug.cgi?id=50823
  patch -Np2 -i ../x86-twist-shuffle-mask.patch

  # Work around intermittent 'clang -O -g' crashes
  # https://bugs.llvm.org/show_bug.cgi?id=50611#c3
  patch -Np2 -i ../no-strict-aliasing-DwarfCompileUnit.patch
}

build() {
  cd "$srcdir/llvm-$pkgver.src/build"

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLLVM_HOST_TRIPLE=$CHOST \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_INSTALL_UTILS=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_ENABLE_FFI=ON \
    -DLLVM_BUILD_TESTS=ON \
    -DLLVM_BUILD_DOCS=ON \
    -DLLVM_ENABLE_SPHINX=ON \
    -DLLVM_ENABLE_DOXYGEN=OFF \
    -DSPHINX_WARNINGS_AS_ERRORS=OFF \
    -DLLVM_BINUTILS_INCDIR=/usr/include
  ninja all ocaml_doc
}

check() {
  cd "$srcdir/llvm-$pkgver.src/build"
  ninja check
}

package_llvm() {
  pkgdesc="Collection of modular and reusable compiler and toolchain technologies"
  depends=('llvm-libs' 'perl')

  cd "$srcdir/llvm-$pkgver.src/build"

  DESTDIR="$pkgdir" ninja install

  # Include lit for running lit-based tests in other projects
  pushd ../utils/lit
  python3 setup.py install --root="$pkgdir" -O1
  popd

  # Remove documentation sources
  rm -r "$pkgdir"/usr/share/doc/$pkgname/html/{_sources,.buildinfo}

  # The runtime libraries go into llvm-libs
  mv -f "$pkgdir"/usr/lib/lib{LLVM,LTO,Remarks}*.so* "$srcdir"
  mv -f "$pkgdir"/usr/lib/LLVMgold.so "$srcdir"

  # OCaml bindings go to a separate package
  rm -rf "$srcdir"/ocaml.{lib,doc}
  mv "$pkgdir/usr/lib/ocaml" "$srcdir/ocaml.lib"
  mv "$pkgdir/usr/share/doc/$pkgname/ocaml-html" "$srcdir/ocaml.doc"

  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stub is taken from Fedora
    mv "$pkgdir/usr/include/llvm/Config/llvm-config"{,-64}.h
    cp "$srcdir/llvm-config.h" "$pkgdir/usr/include/llvm/Config/llvm-config.h"
  fi

  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_llvm-libs() {
  pkgdesc="LLVM runtime libraries"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')

  install -d "$pkgdir/usr/lib"
  cp -P \
    "$srcdir"/lib{LLVM,LTO,Remarks}*.so* \
    "$srcdir"/LLVMgold.so \
    "$pkgdir/usr/lib/"

  # Symlink LLVMgold.so from /usr/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  install -d "$pkgdir/usr/lib/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir/usr/lib/bfd-plugins/LLVMgold.so"

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_llvm-ocaml() {
  pkgdesc="OCaml bindings for LLVM"
  depends=('llvm' "ocaml=$_ocaml_ver" 'ocaml-ctypes')

  install -d "$pkgdir"/{usr/lib,usr/share/doc/$pkgname}
  cp -a "$srcdir/ocaml.lib" "$pkgdir/usr/lib/ocaml"
  cp -a "$srcdir/ocaml.doc" "$pkgdir/usr/share/doc/$pkgname/html"

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
