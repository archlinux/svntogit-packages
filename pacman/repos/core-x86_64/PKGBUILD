# vim: set ts=2 sw=2 et:
# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=pacman
pkgver=5.2.1
pkgrel=2
pkgdesc="A library-based package manager with dependency support"
arch=('x86_64')
url="https://www.archlinux.org/pacman/"
license=('GPL')
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
        pacman-5.2.1-fix-pactest-package-tar-format.patch::https://git.archlinux.org/pacman.git/patch/?id=b9faf652735c603d1bdf849a570185eb721f11c1
        pacman.conf
        makepkg.conf)
sha256sums=('1930c407265fd039cb3a8e6edc82f69e122aa9239d216d9d57b9d1b9315af312'
            'SKIP'
            'd268379269c9dfa6eb3358f8931d3c84ef5fa4d47fe22567022fcbac8e4638c1'
            '3353f363088c73f1f86a890547c0f87c7473e5caf43bbbc768c2e9a7397f2aa2'
            '8c100b64450f5a19a16325dd05c143d49395bdeb96bd957f863cde4b95d3cb86')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 < ../pacman-5.2.1-fix-pactest-package-tar-format.patch
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
