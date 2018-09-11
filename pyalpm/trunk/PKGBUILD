# Maintainer : Rémy Oudompheng <remy@archlinux.org>

pkgname=pyalpm
pkgver=0.8.4
pkgrel=2
pkgdesc="Libalpm bindings for Python 3"
arch=('x86_64')
url="https://git.archlinux.org/pyalpm.git/"
license=('GPL')
makedepends=('git')
depends=('python>=3.6' 'pacman>=5.0')
source=("git+https://git.archlinux.org/pyalpm.git#commit=ec89afb96636a3449006323030dd1768c143c5f5")
validpgpkeys=('E499C79F53C96A54E572FEE1C06086337C50773E')
sha512sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}
  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}
  python setup.py install --root=${pkgdir}
}
