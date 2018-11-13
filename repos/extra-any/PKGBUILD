# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=gyp
pkgver=20170609
pkgrel=3
pkgdesc='"Generate Your Projects" Meta-Build system'
arch=(any)
url="https://gyp.gsrc.io/"
license=(custom:BSD)
depends=(python2-setuptools ninja)
makedepends=(git)
_commit=a478c1ab51ea3e04e79791ac3d1dad01b3f57434  # changes/21/487521/4
source=("git+https://chromium.googlesource.com/external/gyp#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd $pkgname
  python2 setup.py build
}

package() {
  cd $pkgname
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
