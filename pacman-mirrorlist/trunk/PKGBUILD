# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=pacman-mirrorlist
pkgver=20171203
pkgrel=1
pkgdesc="Arch Linux mirror list for use by pacman"
arch=('any')
url="https://www.archlinux.org/mirrorlist/"
license=('GPL')
backup=(etc/pacman.d/mirrorlist)
source=(mirrorlist)

# NOTE on building this package:
# * Go to the trunk/ directory
# * Run bash -c ". PKGBUILD; updatelist"
# * Update the checksums, update pkgver
# * Build the package

updatelist() {
  rm -f mirrorlist
  curl -o mirrorlist https://www.archlinux.org/mirrorlist/all/
}

package() {
  mkdir -p $pkgdir/etc/pacman.d
  install -m644 $srcdir/mirrorlist $pkgdir/etc/pacman.d/
}

md5sums=('befcf78bc76d96d6c06ca7c7536a3aa7')
sha256sums=('9a15441bcd1614a52cf8e3b9da452deeb0e328a18e343c5d9244cdae8c2e5ae4')
