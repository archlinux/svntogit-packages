# Maintainer : Rémy Oudompheng <remy@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=namcap
pkgver=3.3.0
pkgrel=1
pkgdesc="A Pacman package analyzer"
arch=('any')
url='https://gitlab.archlinux.org/pacman/namcap'
license=('GPL')
depends=('python' 'pyalpm' 'licenses' 'binutils' 'elfutils' 'python-pyelftools')
checkdepends=('systemd' 'python-pytest' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(https://gitlab.archlinux.org/pacman/namcap/-/archive/${pkgver}/namcap-${pkgver}.tar.bz2
	missing-desktop-file-utils.patch)
sha512sums=('2e7a12644b535307add7efa7909757470ee3bdb2bdb0171aa75acee9fe367cd0f368af06c4c61f1ddb5b3f6e628489a5a3a6a7d0659c70d6e16ef38c52a7f17e'
            '74efb1939053f41129cd811cf84abef8ff84ca4673cb62c3115b9d56830a57a48fed021b9807a74299c4c4cf3ec1880733f91dd5d06f4b9ac294fc78a9b5498e')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/missing-desktop-file-utils.patch"
}

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${pkgname}-${pkgver}
  env PARSE_PKGBUILD_PATH="${srcdir}/${pkgname}-${pkgver}" \
      PATH="${srcdir}/${pkgname}-${pkgver}/scripts:$PATH" \
      pytest
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}"
}
