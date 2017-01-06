# Maintainer : Rémy Oudompheng <remy@archlinux.org>

pkgname=pyalpm
pkgver=0.8
pkgrel=2
pkgdesc="Libalpm bindings for Python 3"
arch=('i686' 'x86_64')
url="http://projects.archlinux.org/users/remy/pyalpm.git/"
license=('GPL')
depends=('python>=3.6' 'pacman>=4.2')
source=("https://sources.archlinux.org/other/pyalpm/$pkgname-$pkgver.tar.gz")
sha1sums=('b153afc02b7034158558536c4092a302af8030c3')

prepare() {
  sed -i 's/-ansi/-std=c99/' ${pkgname}-${pkgver}/setup.py
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir}
}
