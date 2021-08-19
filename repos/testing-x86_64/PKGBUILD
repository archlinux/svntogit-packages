# Maintainer: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=grep
pkgver=3.7
pkgrel=1
pkgdesc='A string search utility'
arch=('x86_64')
license=('GPL3')
url='https://www.gnu.org/software/grep/'
groups=('base-devel')
depends=('glibc' 'pcre')
makedepends=('texinfo')
validpgpkeys=('155D3FC500C834486D1EEA677FD9FCCB000BEEEE') # Jim Meyering
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('5c10da312460aec721984d5d83246d24520ec438dd48d7ab5a05dbc0d6d6823c'
            'SKIP')

prepare() {
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd $pkgname-$pkgver
  # configure option --without-included-regex removed in 3.7
  # see: https://lists.gnu.org/archive/html/bug-grep/2021-08/msg00028.html
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
