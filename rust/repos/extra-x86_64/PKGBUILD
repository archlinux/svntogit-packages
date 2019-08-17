# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: userwithuid <userwithuid@gmail.com>

# Remember to bump lib32-rust as well!

pkgname=('rust' 'rust-docs')
epoch=1
pkgver=1.37.0
pkgrel=1

pkgdesc='Systems programming language focused on safety, speed and concurrency'
url='https://www.rust-lang.org/'
arch=('x86_64')
license=('MIT' 'Apache')

makedepends=('rust' 'llvm' 'libffi' 'perl' 'python' 'curl' 'cmake')
checkdepends=('procps-ng' 'gdb')

options=('!emptydirs')

source=("https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz"{,.asc}
        config.toml)

sha256sums=('120e7020d065499cc6b28759ff04153bfdc2ac9b5adeb252331a4eb87cbe38c3'
            'SKIP'
            '24a5fbf558c7ffb39b3e712f26e0261a2e1f35d2caff17981e828c36bb5c746a')
validpgpkeys=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE') # Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>

prepare() {
  cd "rustc-$pkgver-src"

  cp "$srcdir"/config.toml config.toml
}

build() {
  cd "rustc-$pkgver-src"

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

  for license in APACHE MIT; do install -Dm644 "rustc-$pkgver-src/LICENSE-$license" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done
}

# vim:set ts=2 sw=2 et:
