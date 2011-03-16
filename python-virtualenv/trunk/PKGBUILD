# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname=python-virtualenv
pkgver=1.5.2
pkgrel=1
pkgdesc="Virtual Python Environment builder"
arch=('any')
url="http://pypi.python.org/pypi/virtualenv"
license=('MIT')
depends=('python2' 'setuptools')
replaces=('virtualenv')
conflicts=('virtualenv')
source=("http://pypi.python.org/packages/source/v/virtualenv/virtualenv-$pkgver.tar.gz"
        LICENSE.txt)

build() {
  cd "$srcdir/virtualenv-$pkgver"
  python2 setup.py build
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  
  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" \
    $pkgdir/usr/lib/python2.7/site-packages/virtualenv.py
  
  install -D -m644 "$srcdir/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('fbcefbd8520bb64bc24a560c6019a73c'
         '4409588baf5837a2ce0215dc08b30305')
sha256sums=('54b2e9c4fcb5d30e6d0a35b938f0d962412b38433921de33a476b203e72834d7'
            '941229fb2bd6273917359d557e69ad10cda2901c7288781ca23baae9b7b8848a')
