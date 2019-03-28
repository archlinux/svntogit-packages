# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: userwithuid <userwithuid@gmail.com>

# Remember to bump lib32-rust as well!

pkgname=('rust' 'rust-docs')
epoch=1
pkgver=1.33.0
pkgrel=2

pkgdesc='Systems programming language focused on safety, speed and concurrency'
url='https://www.rust-lang.org/'
arch=('x86_64')
license=('MIT' 'Apache')

makedepends=('rust' 'llvm7' 'libffi' 'perl' 'python2' 'curl' 'cmake')
checkdepends=('procps-ng' 'gdb')

options=('!emptydirs')

source=("https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz"{,.asc}
        config.toml
        0001-Backport-deprecation-fixes-from-commit-b7f030e.patch
        0001-Revert-1c95f5a34c14f08d65cdd198827e3a2fcb63cf39-9452.patch)

sha256sums=('5a01a8d7e65126f6079042831385e77485fa5c014bf217e9f3e4aff36a485d94'
            'SKIP'
            'ce1c2648e70a14362d33d0cbbd3e35846ea9d43a8d0abc36071563fc087b82d5'
            'd2fdd8ec0196e87b930f49a9ffa9fe7fe4995af54cfa8ee5638c7dc2170f5f8c'
            'cf04a3c8ac0b4f5d786532e6e07a2f52cea2216d899be8d7c0b087aab78a2b68')
validpgpkeys=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE') # Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>

prepare() {
  cd "rustc-$pkgver-src"

  cp "$srcdir"/config.toml config.toml
  patch -p1 <"$srcdir"/0001-Backport-deprecation-fixes-from-commit-b7f030e.patch
  patch -p1 <"$srcdir"/0001-Revert-1c95f5a34c14f08d65cdd198827e3a2fcb63cf39-9452.patch
}

build() {
  cd "rustc-$pkgver-src"

  python2 ./x.py build -j"$(nproc)"
}

package_rust() {
  depends=('gcc-libs' 'llvm7-libs' 'curl' 'libssh2')
  provides=('cargo' 'rustfmt')
  conflicts=('cargo' 'rustfmt')
  replaces=('cargo' 'rustfmt')

  cd "rustc-$pkgver-src"

  DESTDIR="$pkgdir" python2 ./x.py install

  for license in APACHE MIT; do install -Dm644 "LICENSE-$license" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done

  cd "$pkgdir/usr/lib"

  rm rustlib/{components,manifest-rustc,rust-installer-version}
  ln -sf rustlib/$CARCH-unknown-linux-gnu/lib/*.so .

  # move docs out of the way for splitting
  mv "$pkgdir"/usr/share/doc "$srcdir"

  install -d "$pkgdir"/usr/share/bash-completion
  mv "$pkgdir"/etc/bash_completion.d/ "$pkgdir"/usr/share/bash-completion/completions/
}

package_rust-docs() {
  install -d "$pkgdir/usr/share/doc/"
  mv "$srcdir"/doc/* "$pkgdir"/usr/share/doc/rust/

  msg2 "Packaging license files for the documentation"
  for license in APACHE MIT; do install -Dm644 "rustc-$pkgver-src/LICENSE-$license" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done
}

# vim:set ts=2 sw=2 et:
