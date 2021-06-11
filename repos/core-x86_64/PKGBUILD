# vim: set ts=2 sw=2 et:
# Maintainer: 

pkgname=pacman
pkgver=6.0.0
pkgrel=3
pkgdesc="A library-based package manager with dependency support"
arch=('x86_64')
url="https://www.archlinux.org/pacman/"
license=('GPL')
groups=('base-devel')
depends=('bash' 'glibc' 'libarchive' 'curl'
         'gpgme' 'pacman-mirrorlist' 'archlinux-keyring')
makedepends=('meson' 'asciidoc' 'doxygen')
checkdepends=('python' 'fakechroot')
optdepends=('perl-locale-gettext: translation support in makepkg-template')
provides=('libalpm.so')
backup=(etc/pacman.conf
        etc/makepkg.conf)
options=('strip' 'debug')
validpgpkeys=('6645B0A8C7005E78DB1D7864F99FFE0FEAE999BD'  # Allan McRae <allan@archlinux.org>
              'B8151B117037781095514CA7BBDFFC92306B1121') # Andrew Gregory (pacman) <andrew@archlinux.org>
source=(https://sources.archlinux.org/other/pacman/$pkgname-$pkgver.tar.xz{,.sig}
        pacman-6.0.0-fix-404-download.patch::https://git.archlinux.org/pacman.git/patch/?id=3401f9e142ac4c701cd98c52618cb13164f2146b
        pacman-6.0.0-fix-key-import-double-free.patch::https://git.archlinux.org/pacman.git/patch/?id=542910d684191eb7f25ddc5d3d8fe3060028a267
        pacman.conf
        makepkg.conf)
sha256sums=('004448085a7747bdc7a0a4dd5d1fb7556c6b890111a06e029ab088f9905d4808'
            'SKIP'
            'fe7e037e1b84bfa5bc401650d148c2a2e87d827705a6ec18a596ff5eea3cc0fd'
            'a51b57dd47818d97e29ac0b8604b4b409916bbe6029adfbb03ac7e7c2b2a0819'
            '606e55f06c297d2b508bc4438890b229a1abaa68b0374a2d7f94c8e7be6792d7'
            '89d1dd7e7064243754efc1993a8843a400afd5d7c15070787985376ec346d6d9')


prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir"/pacman-6.0.0-fix-404-download.patch
  patch -p1 -i "$srcdir"/pacman-6.0.0-fix-key-import-double-free.patch
}

build() {
  cd "$pkgname-$pkgver"

  meson --prefix=/usr \
        --buildtype=plain \
        -Ddoc=enabled \
        -Ddoxygen=enabled \
        -Dscriptlet-shell=/usr/bin/bash \
        -Dldconfig=/usr/bin/ldconfig \
        build

  meson compile -C build
}

check() {
  cd "$pkgname-$pkgver"

  meson test -C build
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" meson install -C build

  # install Arch specific stuff
  install -dm755 "$pkgdir/etc"
  install -m644 "$srcdir/pacman.conf" "$pkgdir/etc"
  install -m644 "$srcdir/makepkg.conf" "$pkgdir/etc"
}
