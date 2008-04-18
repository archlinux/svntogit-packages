# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=eclipse-ecj
pkgver=3.3.1.1
pkgrel=1
_date=200710231652
pkgdesc="Eclipse java bytecode compiler"
arch=('i686' 'x86_64')
license=('EPL')
url="http://www.eclipse.org/"
depends=('gcc-gcj')
makedepends=('unzip' 'fastjar' 'apache-ant')
source=(http://download.eclipse.org/eclipse/downloads/drops/R-${pkgver}-${_date}/ecjsrc.zip
	ecj
        ecj-gccmain.diff)
md5sums=('b3752ab100367bff4fb21467f73a7c8d'
         '935d1faaeab4315f82a79a032a41a80a'
         '2cc746a12da0978aef2ae504a208fd6f')

build() {
  patch -Np3 -i ${startdir}/src/ecj-gccmain.diff || return 1

  rm -rf org/eclipse/jdt/internal/compiler/{tool,apt}
  mkdir -p build/bin
  cp -a org build/bin/
  find build/bin -name '*.java' > build/bin/sources
  gcj -v -d build/bin -C -g -I/usr/lib/ant.jar -Ibuild/bin `cat build/bin/sources` || return 1

  rm -f build/bin/sources
  find build/bin -name '*.java' -delete || return 1
  find build/bin -name '*.html' -delete || return 1

  mkdir -p build/bootstrap
  fastjar -c -C build/bin . -f build/bootstrap/eclipse-ecj.jar || return 1

  rm -rf build/bin
  mkdir build/bin
  cp -a org build/bin/

  gij -classpath build/bootstrap/eclipse-ecj.jar:/usr/lib/ant.jar \
      org.eclipse.jdt.internal.compiler.batch.Main \
      -bootclasspath /usr/share/java/libgcj-4.2.jar build/bin || return 1

  find build/bin -name '*.java' -delete || return 1
  find build/bin -name '*.html' -delete || return 1

  mkdir -p build/dist
  fastjar -c -C build/bin . -f build/dist/eclipse-ecj.jar || return 1

  mkdir -p ${startdir}/pkg/usr/share/java
  mkdir -p ${startdir}/pkg/usr/bin
  install -m644 build/dist/eclipse-ecj.jar ${startdir}/pkg/usr/share/java/ || return 1
  install -m755 ecj ${startdir}/pkg/usr/bin/ || return 1
}
