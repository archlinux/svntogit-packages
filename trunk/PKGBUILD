# Maintainer : Rémy Oudompheng <remy@archlinux.org>

pkgname=pyalpm
pkgver=0.8.5
pkgrel=1
pkgdesc="Libalpm bindings for Python 3"
arch=('x86_64')
url="https://git.archlinux.org/pyalpm.git/"
license=('GPL')
makedepends=('git' 'python-pytest')
depends=('python>=3.6' 'pacman>=5.0')
source=("git+https://git.archlinux.org/pyalpm.git#commit=6b47d1655688fe2957ef52a16aeca8b474546df2")
validpgpkeys=('E499C79F53C96A54E572FEE1C06086337C50773E')
sha512sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}
  python setup.py build
}

check() {
  cd ${srcdir}/${pkgname}
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.7" pytest
}

package() {
  cd ${srcdir}/${pkgname}
  python setup.py install --root=${pkgdir}
}
