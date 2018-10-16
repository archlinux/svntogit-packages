# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=arch-install-scripts
pkgver=20
pkgrel=1
pkgdesc="Scripts to aid in installing Arch Linux"
arch=('any')
url="https://projects.archlinux.org/arch-install-scripts.git"
license=('GPL')
depends=('awk' 'bash' 'coreutils' 'pacman' 'util-linux')
makedepends=('git')
source=("git+https://projects.archlinux.org/arch-install-scripts.git?signed#tag=v$pkgver")
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53')  # Dave Reisner
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe | sed s,^v,,
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
