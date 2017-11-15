# $Id: PKGBUILD 262050 2016-03-18 18:02:01Z andyrtr $
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andreas B. Wagner <AndreasBWagner@gmail.com>

pkgname=docbook-sgml31
pkgver=3.1
pkgrel=2
pkgdesc="Legacy docbook-sgml"
#arch=('x86_64')
arch=('any')
url='http://www.docbook.org/sgml/'
license=('custom')
depends=('sgml-common')
install=$pkgname.install
source=("http://www.docbook.org/sgml/${pkgver}/docbk31.zip")
sha256sums=('20261d2771b9a052abfa3d8fab1aa62be05791a010281c566f9073bf0e644538')

build() {
  cd "$srcdir"
  sed -i -e '/ISO 8879/d' \
         -e 's|DTDDECL "-//OASIS//DTD DocBook V3.1//EN"|SGMLDECL|g' \
         docbook.cat
}

package() {
  cd "$srcdir"

  local DTDDIR="usr/share/sgml/docbook-sgml-${pkgver}"

  install -dm755 "$pkgdir/$DTDDIR"
  install -m644 docbook.cat "$pkgdir/$DTDDIR/catalog"
  install -m644 *.dtd *.mod *.dcl "$pkgdir/$DTDDIR"
}

