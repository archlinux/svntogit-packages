# Maintainer: Andreas Radke <andyrtr@archlinux.org>

# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Suat SARIALP <muhendis.suat@gmail.com>

pkgname=docbook-utils
pkgver=0.6.14
pkgrel=12
pkgdesc='Shell scripts to manage DocBook documents'
arch=('any')
url="https://www.sourceware.org/docbook-tools/"
license=('GPL2')
depends=('openjade' 'docbook-dsssl' 'docbook-sgml31')
makedepends=('perl-sgmls')
optdepends=('perl-sgmls: for conversion to man and texinfo'
            'lynx: for conversion to txt'
            'texlive-htmlxml: for conversion to pdf')
source=(https://sourceware.org/ftp/docbook-tools/new-trials/SOURCES/${pkgname}-${pkgver}.tar.gz
        #ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/${pkgname}-${pkgver}.tar.gz
        db2html # script taken from Fedora
        docbook-utils-0.6.14-grep_fix-1.patch)
sha256sums=('48faab8ee8a7605c9342fb7b906e0815e3cee84a489182af38e8f7c0df2e92e9'
            '10b9c29ad659cce5036871a6e85598fd33cc52c0c38cf059eeb485382a5d90d7'
            'ddf0ddca0a540fd4f34f38b7b9090f96746e37da12b4e2bf8f4174c5ad61f54a')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}"/docbook-utils-0.6.14-grep_fix-1.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man
  make  
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" htmldir="/usr/share/doc/${pkgname}/html"

  #common alternative names
  for doctype in 'html' 'ps' 'dvi' 'man' 'pdf' 'rtf' 'tex' 'texi' 'txt'; do
    ln -sv "docbook2${doctype}" "${pkgdir}/usr/bin/db2${doctype}"
    ln -sv "jw.1" "${pkgdir}/usr/share/man/man1/db2${doctype}"
  done

  # db2html is not just a symlink, as it has to create the output directory - FS#67758
  rm "${pkgdir}/usr/bin/db2html"
  install -p -m 755 ../db2html "${pkgdir}/usr/bin/db2html"
}
