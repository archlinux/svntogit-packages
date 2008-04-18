# $Id$
# Maintainer: Thomas Baechler <thomas.baechler@rwth-aachen.de>
pkgname=cups-pdf
pkgver=2.4.6
pkgrel=1
pkgdesc="PDF printer for cups"
arch=(i686 x86_64)
depends=('cups' 'ghostscript')
install=cups-pdf.install
url="http://cip.physik.uni-wuerzburg.de/~vrbehr/cups-pdf"
source=(http://cip.physik.uni-wuerzburg.de/~vrbehr/cups-pdf/src/cups-pdf_$pkgver.tar.gz)
backup=(etc/cups/cups-pdf.conf)
md5sums=('610a2e1d9ecd27ab978efaa6d93ddba3')

build() {
  # Build and install
  cd $startdir/src/$pkgname-$pkgver/src
  [ -z "$CC" ] && CC=gcc
  $CC $CFLAGS -o cups-pdf cups-pdf.c || return 1
  install -D -m700 cups-pdf $startdir/pkg/usr/lib/cups/backend/cups-pdf || return 1

  # Install Postscript Color printer
  cd ../extra
  install -D -m644 PostscriptColor.ppd $startdir/pkg/usr/share/cups/model/PostscriptColor.ppd || return 1

  # Install config file
  install -D -m644 cups-pdf.conf $startdir/pkg/etc/cups/cups-pdf.conf || return 1
}
