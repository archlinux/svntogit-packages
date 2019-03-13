# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=mallard-ducktype
pkgver=0.4
pkgrel=1
pkgdesc="Parser for the lightweight Ducktype syntax for Mallard"
url="http://projectmallard.org"
arch=(any)
license=(MIT)
depends=(python)
makedepends=(python-setuptools git)
_commit=5a9f8c9cc2239ac08fe3e690ff9ecabb4fe9917e  # tags/0.4^0
source=("git+https://github.com/projectmallard/mallard-ducktype#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}
