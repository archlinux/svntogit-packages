# Maintainer : Rémy Oudompheng <remy@archlinux.org>

pkgname=pyalpm
pkgver=0.6.2
pkgrel=2
pkgdesc="Libalpm bindings for Python 3"
arch=('i686' 'x86_64')
url="http://projects.archlinux.org/users/remy/pyalpm.git/"
license=('GPL')
depends=('python>=3.4' 'pacman>=4.1')
source=("ftp://ftp.archlinux.org/other/pyalpm/$pkgname-$pkgver.tar.gz")
sha1sums=('15e9911c4f91d78e22e8dbd679177334707482d2')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # workaround Python packaging issue (FS#34658)
  export CFLAGS="$CFLAGS -Wno-format"

  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir}
}

