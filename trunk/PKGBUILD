# vim: set ts=2 sw=2 et:
# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=pacman
pkgver=5.2.1
pkgrel=4
pkgdesc="A library-based package manager with dependency support"
arch=('x86_64')
url="https://www.archlinux.org/pacman/"
license=('GPL')
groups=('base-devel')
depends=('bash' 'glibc' 'libarchive' 'curl'
         'gpgme' 'pacman-mirrorlist' 'archlinux-keyring')
makedepends=('asciidoc')
checkdepends=('python' 'fakechroot')
optdepends=('perl-locale-gettext: translation support in makepkg-template')
provides=('libalpm.so')
backup=(etc/pacman.conf
        etc/makepkg.conf)
options=('strip' 'debug')
validpgpkeys=('6645B0A8C7005E78DB1D7864F99FFE0FEAE999BD'  # Allan McRae <allan@archlinux.org>
              'B8151B117037781095514CA7BBDFFC92306B1121') # Andrew Gregory (pacman) <andrew@archlinux.org>
source=(https://sources.archlinux.org/other/pacman/$pkgname-$pkgver.tar.gz{,.sig}
        pacman-5.2.1-fix-pactest-package-tar-format.patch
        makepkg-fix-one-more-file-seccomp-issue.patch
        pacman.conf
        makepkg.conf)
sha256sums=('1930c407265fd039cb3a8e6edc82f69e122aa9239d216d9d57b9d1b9315af312'
            'SKIP'
            '824a5c9dd458fb27b05a9a0b4b5d75b7a392de0dae79a18f5cfe8beaf4d82f0c'
            'e481a161bba76729cd434c97e0b319ddfcb1d93b2e4890d72b4e8a32982531d9'
            '3353f363088c73f1f86a890547c0f87c7473e5caf43bbbc768c2e9a7397f2aa2'
            '8c100b64450f5a19a16325dd05c143d49395bdeb96bd957f863cde4b95d3cb86')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 < ../pacman-5.2.1-fix-pactest-package-tar-format.patch
  patch -Np1 < ../makepkg-fix-one-more-file-seccomp-issue.patch
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc \
    --localstatedir=/var --enable-doc \
    --with-scriptlet-shell=/usr/bin/bash \
    --with-ldconfig=/usr/bin/ldconfig
  make V=1
}

check() {
  make -C "$pkgname-$pkgver" check
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # install Arch specific stuff
  install -dm755 "$pkgdir/etc"
  install -m644 "$srcdir/pacman.conf" "$pkgdir/etc"
  install -m644 "$srcdir/makepkg.conf" "$pkgdir/etc"
}
