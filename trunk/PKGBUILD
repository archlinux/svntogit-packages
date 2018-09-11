# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=mailcap
pkgver=2.1.48+14+g5811758
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
backup=(etc/mailcap
        etc/mime.types
        etc/nginx/mime.types)
_commit=58117584fa573c92d918245d38269cc63cec5996  # master
source=("git+https://pagure.io/mailcap#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd mailcap
  git describe --tags | sed 's/^r//;s/-/./;s/-/./;s/-/+/g'
}

check() {
  cd mailcap
  make check
}

package() {
  cd mailcap
  make install DESTDIR="$pkgdir" sysconfdir=/etc mandir=/usr/share/man
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
