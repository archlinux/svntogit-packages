# Maintainer : Rémy Oudompheng <remy@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=namcap
pkgver=3.2.10
pkgrel=1
pkgdesc="A Pacman package analyzer"
arch=('any')
url="https://projects.archlinux.org/namcap.git/"
license=('GPL')
depends=('python' 'pyalpm>=0.5' 'licenses'
         'binutils' 'elfutils' 'python-pyelftools')
makedepends=('python-setuptools')
source=(https://sources.archlinux.org/other/${pkgname}/${pkgname}-${pkgver}.tar.gz
        namcap-ignore-so-no-pie.patch
        missing-desktop-file-utils.patch)
sha512sums=('bdcca39cff873cc1ac7138bc2f218e808019424c1ff414b98f183400c08879a94fe7318049b1912dd094c1fced14b095a467465b04cd78cb9d1725cdbe2be821'
            'df8a8c389aa9d619650d6e472409e4480095e09d5ea60b232a865e1a654dd9440e2228f1f098302b529d6db89f9cd0d8d066881da2bc3ca9ec07b17368efd2cf'
            '74efb1939053f41129cd811cf84abef8ff84ca4673cb62c3115b9d56830a57a48fed021b9807a74299c4c4cf3ec1880733f91dd5d06f4b9ac294fc78a9b5498e')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/missing-desktop-file-utils.patch"
  patch -Np1 -i "${srcdir}/namcap-ignore-so-no-pie.patch"
}

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${pkgname}-${pkgver}
  env PARSE_PKGBUILD_PATH="${srcdir}/${pkgname}-${pkgver}" \
      PATH="${srcdir}/${pkgname}-${pkgver}:$PATH" \
      python setup.py test
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}"
}

