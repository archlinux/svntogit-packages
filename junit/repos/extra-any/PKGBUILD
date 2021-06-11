# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
pkgname=junit
pkgver=4.13.2
pkgrel=1
pkgdesc='Simple JVM framework to write repeatable tests'
arch=('any')
url='https://junit.org/junit4/'
license=('EPL')
depends=('java-environment' 'java-hamcrest')
source=(https://search.maven.org/remotecontent?filepath=${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.jar{,.asc})
sha512sums=('a31b9950f929a7e5a600d89787ef40e42a8a8e2392e210d0c0f45b3572937670a18a524f1815508cd1152cd1eaa7275cb7430ba45c053be365c83c231bccd3f0'
            'SKIP')
validpgpkeys=('58E79B6ABC762159DC0B1591164BD2247B936711') # Marc Philipp (JUnit Development, 2014) <mail@marcphilipp.de>
validpgpkeys+=('FF6E2C001948C5F2F38B0CC385911F425EC61B51') # "Open Source Development <mail@marcphilipp.de>" 

package() {
  install -D -m 644 ${pkgname}-${pkgver}.jar "${pkgdir}"/usr/share/java/${pkgname}-${pkgver}.jar
  ln -s ${pkgname}-${pkgver}.jar "${pkgdir}"/usr/share/java/${pkgname}.jar
}
