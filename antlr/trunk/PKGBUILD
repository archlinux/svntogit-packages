pkgname=antlr
pkgver=2.7.7
pkgrel=1
pkgdesc="ANother Tool for Language Recognition, (formerly PCCTS) is a language tool that provides a framework for constructing recognizers, compilers, and translators from grammatical descriptions containing C++ or Java actions"
url="http://www.antlr.org/"
depends=('gcc-gcj')
makedepends=('eclipse-ecj' 'fastjar' 'python')
source=(http://www.antlr.org/download/${pkgname}-${pkgver}.tar.gz
	antlr)
md5sums=()

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  JAVA=/usr/bin/gij JAVAC=/usr/bin/ecj ./configure --prefix=/usr --disable-csharp
  make || return 1
  pushd lib/cpp
  make prefix=${startdir}/pkg/usr install
  popd
  pushd lib/python
  python setup.py install --root=${startdir}/pkg
  popd
  mkdir -p ${startdir}/pkg/usr/share/java
  mkdir -p ${startdir}/pkg/usr/bin
  install -m644 antlr/antlr.jar ${startdir}/pkg/usr/share/java/
  install -m755 ${startdir}/src/antlr ${startdir}/pkg/usr/bin
}
