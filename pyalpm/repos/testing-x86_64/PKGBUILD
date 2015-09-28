# Maintainer : Rémy Oudompheng <remy@archlinux.org>

pkgname=pyalpm
pkgver=0.7
pkgrel=3
pkgdesc="Libalpm bindings for Python 3"
arch=('i686' 'x86_64')
url="http://projects.archlinux.org/users/remy/pyalpm.git/"
license=('GPL')
depends=('python>=3.5' 'pacman>=4.2')
source=("https://sources.archlinux.org/other/pyalpm/$pkgname-$pkgver.tar.gz")
sha1sums=('62fafb93d30c27b5a5a09df3e802d6e50fed9802')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # workaround Python packaging issue (FS#34658)
  export CFLAGS="$CFLAGS -Wno-format"

  # workaround when building with Python 3.5
  sed -i "s/'-Werror',//" setup.py

  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir}
}

