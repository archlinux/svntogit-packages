# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname=python-virtualenv
pkgver=1.4.9
pkgrel=2
pkgdesc="Virtual Python Environment builder"
arch=('any')
url="http://pypi.python.org/pypi/virtualenv"
license=('MIT')
depends=('python2' 'setuptools')
replaces=('virtualenv')
conflicts=('virtualenv')
source=("http://pypi.python.org/packages/source/v/virtualenv/virtualenv-$pkgver.tar.gz")
md5sums=('c49067cab242b5ff8c7b681a5a99533a')

build() {
  cd "$srcdir/virtualenv-$pkgver"
  python2 setup.py build
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m644 docs/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
