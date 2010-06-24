# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname=python-virtualenv
pkgver=1.4.9
pkgrel=1
pkgdesc="Virtual Python Environment builder"
arch=('any')
url="http://pypi.python.org/pypi/virtualenv"
license=('MIT')
depends=('python' 'setuptools')
replaces=('virtualenv')
conflicts=('virtualenv')
source=("http://pypi.python.org/packages/source/v/virtualenv/virtualenv-$pkgver.tar.gz")
md5sums=('c49067cab242b5ff8c7b681a5a99533a')

build() {
  cd "$srcdir/virtualenv-$pkgver"
  python setup.py build
  python setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m644 docs/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
