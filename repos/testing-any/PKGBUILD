# Maintainer : Rémy Oudompheng <remy@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=namcap
pkgver=3.2.8
pkgrel=5
pkgdesc="A Pacman package analyzer"
arch=('any')
url="https://projects.archlinux.org/namcap.git/"
license=('GPL')
depends=('python' 'pyalpm>=0.5' 'licenses'
         'binutils' 'elfutils' 'python-pyelftools')
makedepends=('python-setuptools')
source=(https://sources.archlinux.org/other/${pkgname}/${pkgname}-${pkgver}.tar.gz
        namcap-fix-full-relro.patch
        namcap-ignore-so-no-pie.patch
        missing-desktop-file-utils.patch)
sha512sums=('504b8294a86fdcc15946098fa57a4b6ca3bea0daf9ec51e7eab62078225b2102f527e123a9aeee33b8c4151adb8a59c5a682e25fd0330bd576d3da737f2a7d81'
            '2ca2bebef6c2307b73081b424c1a6cc34f0087726c48bac7808b35d88ddab6d8668b09ebf964a46f48fde4ce2c2ab8b5fdcc5120864d412d24d66d623bd47b6c'
            'df8a8c389aa9d619650d6e472409e4480095e09d5ea60b232a865e1a654dd9440e2228f1f098302b529d6db89f9cd0d8d066881da2bc3ca9ec07b17368efd2cf'
            '74efb1939053f41129cd811cf84abef8ff84ca4673cb62c3115b9d56830a57a48fed021b9807a74299c4c4cf3ec1880733f91dd5d06f4b9ac294fc78a9b5498e')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/missing-desktop-file-utils.patch"
  patch -Np1 -i "${srcdir}/namcap-fix-full-relro.patch"
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

