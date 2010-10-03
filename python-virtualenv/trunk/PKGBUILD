# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname=python-virtualenv
pkgver=1.5.1
pkgrel=2
pkgdesc="Virtual Python Environment builder"
arch=('any')
url="http://pypi.python.org/pypi/virtualenv"
license=('MIT')
depends=('python2' 'setuptools')
replaces=('virtualenv')
conflicts=('virtualenv')
source=("http://pypi.python.org/packages/source/v/virtualenv/virtualenv-$pkgver.tar.gz")
md5sums=('3daa1f449d5d2ee03099484cecb1c2b7')
sha256sums=('e2bbc4e80164e1ad83afba698559c2923f4bb7e61197b885c0a0befb29533438')

build() {
  cd "$srcdir/virtualenv-$pkgver"
  python2 setup.py build
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  
  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" \
    $pkgdir/usr/lib/python2.7/site-packages/virtualenv.py
  
  install -D -m644 docs/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
