# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributer: Sean Middleditch <elanthis@awesomeplay.com>

pkgname=docbook-xsl
pkgver=1.73.2
pkgrel=1
pkgdesc="XML stylesheets for Docbook-xml transformations."
arch=(i686 x86_64)
license=('custom')
url="http://scrollkeeper.sourceforge.net/docbook.shtml"
depends=('libxml2' 'libxslt' 'docbook-xml')
source=(http://downloads.sourceforge.net/sourceforge/docbook/docbook-xsl-${pkgver}.tar.bz2)
install=docbook-xsl.install
md5sums=('9640e7a1ef8662c195b4fec69a983e58')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  mkdir -p ${startdir}/pkg/usr/share/xml/docbook/xsl-stylesheets-${pkgver}/common
  install -m644 common/*.{xml,xsl,dtd,ent} ${startdir}/pkg/usr/share/xml/docbook/xsl-stylesheets-${pkgver}/common/

  mkdir -p ${startdir}/pkg/usr/share/xml/docbook/xsl-stylesheets-${pkgver}/params
  install -m644 params/*.xml ${startdir}/pkg/usr/share/xml/docbook/xsl-stylesheets-${pkgver}/params/

  for fn in fo highlighting html roundtrip; do
    mkdir -p ${startdir}/pkg/usr/share/xml/docbook/xsl-stylesheets-${pkgver}/${fn}
    install -m644 ${fn}/*.{xml,xsl} ${startdir}/pkg/usr/share/xml/docbook/xsl-stylesheets-${pkgver}/${fn}/
  done
  for fn in eclipse htmlhelp javahelp lib manpages profiling template website xhtml; do
    mkdir -p ${startdir}/pkg/usr/share/xml/docbook/xsl-stylesheets-${pkgver}/${fn}
    install -m644 ${fn}/*.xsl ${startdir}/pkg/usr/share/xml/docbook/xsl-stylesheets-${pkgver}/${fn}/
  done
  mkdir -p ${startdir}/pkg/etc/xml
  install -m644 VERSION ${startdir}/pkg/usr/share/xml/docbook/xsl-stylesheets-${pkgver}/

  install -m644 -D COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
