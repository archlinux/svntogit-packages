# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>

pkgname=arch-install-scripts
pkgver=28
pkgrel=1
pkgdesc="Scripts to aid in installing Arch Linux"
arch=('any')
url="https://github.com/archlinux/arch-install-scripts"
license=('GPL2')
depends=('awk' 'bash' 'coreutils' 'grep' 'pacman' 'util-linux')
makedepends=('asciidoc' 'git')
source=("git+https://github.com/archlinux/arch-install-scripts#tag=v${pkgver}?signed")
validpgpkeys=(
  'BD27B07A5EF45C2ADAF70E0484818A6819AF4A9B'  # Eli Schwartz
  'C100346676634E80C940FB9E9C02FF419FECBE16'  # MortenLinderud
)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe | sed 's/^v//'
}

build() {
  make -C "$pkgname"
}

check() {
  make -C "$pkgname" check
}

package() {
  make -C "$pkgname" PREFIX=/usr DESTDIR="$pkgdir" install
}
