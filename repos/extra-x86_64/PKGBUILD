# $Id$
# Maintainer: Aaron Griffin <aarongriffin@gmail.com>
# Contributor: Mario A. Vazquez <mario_vazq@hotmail.com>
pkgname=pyxdg
pkgver=0.15
pkgrel=2
pkgdesc="Python library to access freedesktop.org standards."
arch=(i686 x86_64)
url="http://freedesktop.org/Software/pyxdg"
license=("LGPL")
depends=('python>=2.5')
source=(http://www.freedesktop.org/~lanius/${pkgname}-${pkgver}.tar.gz)
md5sums=('86a5441285fc908145414b63348d11a3')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root=${startdir}/pkg || return 1
}
