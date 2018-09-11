# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname=('python-virtualenv' 'python2-virtualenv')
pkgver=16.0.0
pkgrel=1
pkgdesc="Virtual Python Environment builder"
url="https://virtualenv.pypa.io/"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python-sphinx' 'python2-setuptools' 'python2-sphinx')
checkdepends=('python-pytest' 'python-mock' 'python2-pytest' 'python2-mock')
replaces=('virtualenv')
conflicts=('virtualenv')
options=('!makeflags')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pypa/virtualenv/archive/${pkgver}.tar.gz)
sha512sums=('aed6eff9b85107072c321b37c1725987d474caf615734ab40d8d1fa60f2635be1a1919a47fbd211127e38cf1c4002548c778df29fc56d45a4570b31906c0ee54')

prepare() {
  cp -a virtualenv-${pkgver}{,-py2}
  cd virtualenv-${pkgver}-py2
  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" virtualenv.py
}

build() {
  (cd virtualenv-${pkgver}
    python setup.py build
    make -C docs text man
  )
  (cd virtualenv-${pkgver}-py2
    python2 setup.py build
    make -C docs text man
  )
}

check() {
  (cd virtualenv-${pkgver}
    py.test
  )
  (cd virtualenv-${pkgver}-py2
    py.test2
  )
}

package_python-virtualenv() {
  depends=('python-setuptools')

  cd virtualenv-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --skip-build
  install -Dm 644 docs/_build/text/* -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/virtualenv.1 "${pkgdir}/usr/share/man/man1/virtualenv.1"
  ln -s virtualenv.1.gz "${pkgdir}/usr/share/man/man1/virtualenv3.1.gz"

  # link to a version with 3 suffix as well
  ln "$pkgdir/usr/bin/virtualenv" "$pkgdir/usr/bin/virtualenv3"

  install -D -m644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-virtualenv() {
  depends=('python2-setuptools')

  cd virtualenv-$pkgver-py2
  python2 setup.py install --prefix=/usr --root="$pkgdir" --skip-build
  install -Dm 644 docs/_build/text/* -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/virtualenv.1 "${pkgdir}/usr/share/man/man1/virtualenv2.1"

  # move this "old" version out of the way
  mv "$pkgdir/usr/bin/virtualenv" "$pkgdir/usr/bin/virtualenv2"

  install -D -m644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
