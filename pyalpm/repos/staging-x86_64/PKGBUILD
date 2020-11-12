# Maintainer : Rémy Oudompheng <remy@archlinux.org>

pkgname=pyalpm
pkgver=0.9.2
pkgrel=1
pkgdesc="Python 3 bindings for libalpm"
arch=('x86_64')
url="https://gitlab.archlinux.org/archlinux/pyalpm"
license=('GPL')
makedepends=('git' 'python-setuptools' 'python-pytest')
depends=('python' 'pacman')
source=("git+https://gitlab.archlinux.org/archlinux/pyalpm.git#tag=$pkgver"
        "memleak.patch")
validpgpkeys=('E499C79F53C96A54E572FEE1C06086337C50773E')
sha512sums=('SKIP'
            'b7dacb28bc13f5c9fb9c9295d1a3d323b7b7c0893d69b110f3036b73a4930e8463b5a19011b0e5996ff55157768376c2e53ab97c557afe29bbe3b5d0c8a1e027')

prepare() {
  cd ${srcdir}/${pkgname}
  # Revert memleak patch which causes 'random' segfauts since
  # the handle is still used while it's already cleaned up.
  patch -NRp1 -i ${srcdir}/memleak.patch
}

build() {
  cd ${srcdir}/${pkgname}
  python setup.py build
}

check() {
  cd ${srcdir}/${pkgname}
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.9" pytest
}

package() {
  cd ${srcdir}/${pkgname}
  python setup.py install --root=${pkgdir}
}
