# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=gyp
pkgver=20190716.fcd686f1
pkgrel=1
pkgdesc='"Generate Your Projects" Meta-Build system'
arch=(any)
url="https://gyp.gsrc.io/"
license=(custom:BSD)
depends=(python-setuptools ninja)
makedepends=(git)
_commit=fcd686f1880fa52a1ee78d3e98af1b88cb334528  # changes/82/1701782/5
source=("git+https://chromium.googlesource.com/external/gyp#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname

  # Commit date + short rev
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}
