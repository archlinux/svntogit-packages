# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=('llvm' 'llvm-libs' 'llvm-ocaml')
pkgver=13.0.1
pkgrel=2
_ocaml_ver=4.13.1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2'
             "ocaml>=$_ocaml_ver" 'ocaml-ctypes' 'ocaml-findlib'
             'python-setuptools' 'python-psutil' 'python-sphinx'
             'python-recommonmark')
options=('staticlibs' '!lto') # Getting thousands of test failures with LTO
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/$pkgname-$pkgver.src.tar.xz{,.sig}
        don-t-accept-nullptr-as-GEP-element-type.patch
        don-t-move-DBG_VALUE-instructions.patch
        no-strict-aliasing-DwarfCompileUnit.patch
        disable-bswap-for-spir.patch
        llvm-config.h)
sha256sums=('ec6b80d82c384acad2dc192903a6cf2cdbaffb889b84bfb98da9d71e630fc834'
            'SKIP'
            'a7e902a7612d0fdabe436a917468b043cc296bc89d8954bfc3126f737beb9ac4'
            'f7d69f84241416398fdb3df8bb44f9fae3c49d89889c7ffa3b37aa2e9d78f708'
            'd1eff24508e35aae6c26a943dbaa3ef5acb60a145b008fd1ef9ac6f6c4faa662'
            'af163392fbc19d65d11ab4b1510a2eae39b417d6228023b3ba5395b138bb41f5'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  cd "$srcdir/llvm-$pkgver.src"
  mkdir build

  # https://github.com/intel/intel-graphics-compiler/issues/204
  patch -Rp2 -i ../don-t-accept-nullptr-as-GEP-element-type.patch

  # https://github.com/llvm/llvm-project/issues/53243
  # https://github.com/rust-lang/rust/issues/92869
  patch -Np2 -i ../don-t-move-DBG_VALUE-instructions.patch

  # Work around intermittent 'clang -O -g' crashes
  # https://bugs.llvm.org/show_bug.cgi?id=50611#c3
  patch -Np2 -i ../no-strict-aliasing-DwarfCompileUnit.patch

  # Fix an ISPC build failure (https://github.com/ispc/ispc/issues/2189)
  patch -Np2 -i ../disable-bswap-for-spir.patch
}

build() {
  cd "$srcdir/llvm-$pkgver.src/build"

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
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
  LD_LIBRARY_PATH=$PWD/lib ninja check
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
  depends=('llvm' "ocaml>=$_ocaml_ver" 'ocaml-ctypes')

  install -d "$pkgdir"/{usr/lib,usr/share/doc/$pkgname}
  cp -a "$srcdir/ocaml.lib" "$pkgdir/usr/lib/ocaml"
  cp -a "$srcdir/ocaml.doc" "$pkgdir/usr/share/doc/$pkgname/html"

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
