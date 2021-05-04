# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=mailcap
pkgver=2.1.53
pkgrel=1
pkgdesc="Helper application and MIME type associations for file types"
url="https://pagure.io/mailcap"
arch=(any)
license=(MIT)
makedepends=(git)
checkdepends=(python)
provides=(mime-types)
conflicts=(mime-types)
replaces=(mime-types)
backup=(
  etc/mailcap
  etc/mime.types
  etc/nginx/mime.types
)
_commit=4a12cc7caeb4a74626e8e6aedf38e7223b28e982  # tags/r2-1-53
source=("git+https://pagure.io/mailcap#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd mailcap
  git describe --tags | sed 's/^r//;s/-/./;s/-/./;s/-/+/g'
}

build() {
  cd mailcap
  make
}

check() {
  cd mailcap
  make check
}

package() {
  cd mailcap
  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}
