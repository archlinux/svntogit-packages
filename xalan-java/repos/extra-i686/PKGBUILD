# Contributor: Hussam Al-Tayeb <ht990332@gmail.com>

pkgname=xalan-java
pkgver=2.7.0
pkgrel=2
pkgdesc="Xalan-Java is an XSLT processor for transforming XML documents into HTML, text, or other XML document types."
arch=('i686' 'x86_64')
depends=()
makedepends=('tar')
source=(http://www.apache.org/dist/xml/xalan-j/xalan-j_${pkgver//./_}-bin.tar.gz )
url="http://xml.apache.org/xalan-j"
md5sums=('d526d0848c88607ce4e3a0a4edb75d50')

build() {
  mkdir -p ${startdir}/pkg/usr/share/java
  install -m644 ${startdir}/src/xalan-j_${pkgver//./_}/*.jar ${startdir}/pkg/usr/share/java/
}
