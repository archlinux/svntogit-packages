# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: userwithuid <userwithuid@gmail.com>

pkgname=('rust' 'lib32-rust-libs' 'rust-docs')
epoch=1
pkgver=1.38.0
pkgrel=1

_llvm_ver=8.0.1

pkgdesc='Systems programming language focused on safety, speed and concurrency'
url='https://www.rust-lang.org/'
arch=('x86_64')
license=('MIT' 'Apache')

makedepends=('rust' "llvm=$_llvm_ver" 'libffi' 'lib32-gcc-libs' 'perl' 'python' 'curl' 'cmake')
checkdepends=('procps-ng' 'gdb')

options=('!emptydirs')

source=("https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz"{,.asc}
        "https://github.com/llvm/llvm-project/releases/download/llvmorg-$_llvm_ver/compiler-rt-$_llvm_ver.src.tar.xz"{,.sig}
        config.toml)

sha256sums=('644263ca7c7106f8ee8fcde6bb16910d246b30668a74be20b8c7e0e9f4a52d80'
            'SKIP'
            '11828fb4823387d820c6715b25f6b2405e60837d12a7469e7a8882911c721837'
            'SKIP'
            'b1bd845081ece690685b5bf2a7e9e931a44a603ab836dd5a9b3c2b062fc5559b')
validpgpkeys=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE'  # Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>
              '474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  cd "rustc-$pkgver-src"

  cp "$srcdir"/config.toml config.toml
}

build() {
  cd "rustc-$pkgver-src"

  export RUST_BACKTRACE=1
  export RUST_COMPILER_RT_ROOT="$srcdir/compiler-rt-$_llvm_ver.src"

  python ./x.py build -j"$(nproc)"
}

package_rust() {
  depends=('gcc-libs' 'llvm-libs' 'curl' 'libssh2')
  provides=('cargo' 'rustfmt')
  conflicts=('cargo' 'rustfmt')
  replaces=('cargo' 'rustfmt')

  cd "rustc-$pkgver-src"

  DESTDIR="$pkgdir" python ./x.py install

  for license in APACHE MIT; do install -Dm644 "LICENSE-$license" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done

  # delete unnecesary files, e.g. components and manifest files only used for the uninstall script
  cd "$pkgdir"/usr/lib/rustlib
  rm components install.log manifest-* rust-installer-version uninstall.sh

  # rustbuild always installs copies of the shared libraries to /usr/lib,
  # overwrite them with symlinks to the per-architecture versions
  cd "$pkgdir"/usr/lib
  ln -sf rustlib/$CARCH-unknown-linux-gnu/lib/*.so .

  # move docs and lib32 libs out of the way for splitting
  mv "$pkgdir"/usr/share/doc "$srcdir"
  mv "$pkgdir"/usr/lib/rustlib/i686-unknown-linux-gnu "$srcdir"

  install -d "$pkgdir"/usr/share/bash-completion
  mv "$pkgdir"/etc/bash_completion.d/ "$pkgdir"/usr/share/bash-completion/completions/
}

package_lib32-rust-libs() {
  descriptino=('32-bit libraries for Rust')
  depends=('lib32-gcc-libs')
  provides=('lib32-rust')
  conflicts=('lib32-rust')
  replaces=('lib32-rust')

  install -d "$pkgdir"/usr/lib/rustlib/
  mv "$srcdir"/i686-unknown-linux-gnu "$pkgdir"/usr/lib/rustlib

  cd "rustc-$pkgver-src"
  for license in APACHE MIT; do
    install -Dm644 "LICENSE-$license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"
  done
}

package_rust-docs() {
  description=('Documentation for the Rust programming language')

  install -d "$pkgdir"/usr/share/doc/
  mv "$srcdir"/doc/* "$pkgdir"/usr/share/doc/rust/

  cd "rustc-$pkgver-src"
  for license in APACHE MIT; do
    install -Dm644 "LICENSE-$license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"
  done
}

# vim:set ts=2 sw=2 et:
