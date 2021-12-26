# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>

pkgname=iniparser
pkgver=4.1
pkgrel=4
pkgdesc='A free stand-alone ini file parsing library written in portable ANSI C'
arch=('x86_64')
url='https://github.com/ndevilla/iniparser'
license=('MIT')
depends=('glibc')
provides=('libiniparser.so')
makedepends=('chrpath')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ndevilla/iniparser/archive/v${pkgver}.tar.gz")
md5sums=('e43b722c71b399ab17c329c04dbdf1d7')
sha256sums=('960daa800dd31d70ba1bacf3ea2d22e8ddfc2906534bf328319495966443f3ae')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm0644 src/iniparser.h "${pkgdir}"/usr/include/iniparser.h
  install -Dm0644 src/dictionary.h "${pkgdir}"/usr/include/dictionary.h
  install -Dm0644 libiniparser.so.1 "$pkgdir"/usr/lib/libiniparser.so.1
  install -Dm0644 LICENSE "${pkgdir}"/usr/share/licenses/iniparser/LICENSE
  ln -sf libiniparser.so.1 "${pkgdir}"/usr/lib/libiniparser.so
  chrpath -d "${pkgdir}"/usr/lib/libiniparser.so
}
