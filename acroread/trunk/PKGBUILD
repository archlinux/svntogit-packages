# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=acroread
pkgver=8.1.2
pkgrel=1
pkgdesc="Adobe Acrobat Reader for viewing PDF files"
arch=('i686')
url="http://www.adobe.com/products/acrobat/main.html"
license=('custom')
depends=('gtk2' 'bash' 'mesa')
makedepends=('rpmextract')
source=(http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/${pkgver}/enu/AdobeReader_enu-${pkgver}-1.i486.rpm \
	acroread-scim.patch)
md5sums=('aa2d5aac3b257d3dfe4216c7ca565193' '8422bddbb8c03535704a245f9858465e')
sha1sums=('9408c1a7f0f03033ac6d3317d5594e6eeeb5794f' '64758a394480bad1faf09aa516337e35d0b0ce6f')

build() {
  cd ${startdir}/src
  rpmextract.sh AdobeReader_enu-${pkgver}-1.i486.rpm
  cd opt/Adobe/Reader8

  patch -Np3 -i ${startdir}/src/acroread-scim.patch || return 1

  install -D -m644 Resource/Support/AdobeReader.desktop \
    ${startdir}/pkg/usr/share/applications/AdobeReader.desktop
  sed -i 's/AdobeReader8.png/AdobeReader.png/' \
    ${startdir}/pkg/usr/share/applications/AdobeReader.desktop
  install -D -m644 Resource/Icons/64x64/AdobeReader8.png \
    ${startdir}/pkg/usr/share/pixmaps/AdobeReader.png
  
  install -d ${startdir}/pkg/usr/share/acrobat
  cp -r Reader ${startdir}/pkg/usr/share/acrobat/
  cp -r Resource ${startdir}/pkg/usr/share/acrobat/

  install -D -m755 bin/acroread ${startdir}/pkg/usr/share/acrobat/bin/acroread
  install -d ${startdir}/pkg/usr/bin
  ln -sf /usr/share/acrobat/bin/acroread ${startdir}/pkg/usr/bin/acroread

  install -D -m755 Browser/intellinux/nppdf.so \
    ${startdir}/pkg/usr/lib/mozilla/plugins/nppdf.so

  install -D -m644 Reader/Legal/en_US/License.txt \
    ${startdir}/pkg/usr/share/licenses/${pkgname}/License.txt
}
