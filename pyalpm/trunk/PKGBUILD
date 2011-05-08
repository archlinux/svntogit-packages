# Maintainer : Rémy Oudompheng <remy@archlinux.org>

pkgname=pyalpm
pkgver=0.4.2
pkgrel=1
pkgdesc="Libalpm bindings for Python 3"
arch=('i686' 'x86_64')
url="http://projects.archlinux.org/users/remy/pyalpm.git/"
license=('GPL')
depends=('python>=3.2' 'pacman<3.6')
source=("ftp://ftp.archlinux.org/other/pyalpm/$pkgname-$pkgver.tar.gz")
md5sums=('d5d45cafa98050a4d3c77e4a8f597ff3')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir}
}

