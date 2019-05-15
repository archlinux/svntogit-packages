# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=mallard-ducktype
pkgver=1.0.1
pkgrel=1
pkgdesc="Parser for the lightweight Ducktype syntax for Mallard"
url="http://projectmallard.org"
arch=(any)
license=(MIT)
depends=(python)
makedepends=(python-setuptools git)
_commit=df2dd643ac8bbdbd4bf35515be0630efdb2bc29c  # tags/1.0.1^0
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
