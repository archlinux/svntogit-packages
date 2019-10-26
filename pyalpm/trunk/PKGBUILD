# Maintainer : Rémy Oudompheng <remy@archlinux.org>

pkgname=pyalpm
pkgver=0.9.0
pkgrel=2
pkgdesc="Libalpm bindings for Python 3"
arch=('x86_64')
url="https://git.archlinux.org/pyalpm.git/"
license=('GPL')
makedepends=('git' 'python-pytest')
depends=('python>=3.6' 'pacman>=5.0')
source=("git+https://git.archlinux.org/pyalpm.git#commit=7e71172548780ca13724e8fe4c353d66a80e1b93" "memleak.patch")
validpgpkeys=('E499C79F53C96A54E572FEE1C06086337C50773E')
sha512sums=('SKIP'
            'b7dacb28bc13f5c9fb9c9295d1a3d323b7b7c0893d69b110f3036b73a4930e8463b5a19011b0e5996ff55157768376c2e53ab97c557afe29bbe3b5d0c8a1e027')

prepare() {
  cd ${srcdir}/${pkgname}
  # Rever memleak patch
  patch -NRp1 -i ${srcdir}/memleak.patch
}

build() {
  cd ${srcdir}/${pkgname}
  python setup.py build
}

check() {
  cd ${srcdir}/${pkgname}
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.8" pytest
}

package() {
  cd ${srcdir}/${pkgname}
  python setup.py install --root=${pkgdir}
}
