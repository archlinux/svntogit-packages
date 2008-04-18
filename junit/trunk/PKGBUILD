# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=junit
pkgver=4.4
pkgrel=1
pkgdesc="Automated testing framework for Java"
arch=('i686' 'x86_64')
url="http://www.junit.org/"
license=('custom')
depends=('java-runtime')
makedepends=('java-gcj-compat' 'fastjar' 'apache-ant')
source=(http://downloads.sourceforge.net/sourceforge/junit/${pkgname}${pkgver}.zip
	build.xml)
md5sums=('4755aa0af58a834bedce1f0119dc9514'
         'd8bd6d5961386ce602241ed7f87dd5d2')

build() {
  cd ${startdir}/src/junit${pkgver}
  jar xf junit-${pkgver}-src.jar || return 1
  rm -f junit-${pkgver}-src.jar
  cp ${startdir}/src/build.xml .
  find . -name \*.class -delete || return 1
  find . -name \*.jar -delete || return 1

  ant dist || return 1
  mkdir -p ${startdir}/pkg/usr/share/java
  mkdir -p ${startdir}/pkg/usr/lib
  install -m644 ${pkgname}${pkgver}/junit.jar ${startdir}/pkg/usr/share/java || return 1
  # Do this for ant, though ant needs to have these files in /usr/share/java, but that will get fixed later.
  ln -sf ../share/java/junit.jar ${startdir}/pkg/usr/lib/junit.jar || return 1
  install -D cpl-v10.html ${startdir}/pkg/usr/share/licenses/${pkgname}/cpl-v10.html || return 1
}
