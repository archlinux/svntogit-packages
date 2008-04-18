# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Morgan LEFIEUX <comete@archlinuxfr.org>

pkgname=hplip
pkgver=2.8.2
pkgrel=2
pkgdesc="Drivers for HP DeskJet, OfficeJet, Photosmart, Business Inkjet and some LaserJet."
arch=(i686 x86_64)
url="http://hplip.sourceforge.net/"
license="GPL"
makedepends=('pyqt3')
depends=('cups' 'python' 'net-snmp>=5.4' 'ghostscript' 'foomatic-db' 'foomatic-db-hpijs' 'foomatic-db-engine' 'libjpeg' 'portmap' 'libusb' 'libcups' 'sane')
replaces=('hpijs')
install=hplip.install
source=(http://heanet.dl.sourceforge.net/sourceforge/hplip/$pkgname-$pkgver.tar.gz)
force=y

build() {
 cd $startdir/src/$pkgname-$pkgver
 ./configure --prefix=/usr --disable-foomatic-xml-install --disable-foomatic-rip-hplip-install

 make || return 1
 #mkdir -p $startdir/pkg/usr/bin
 #rm -f prnt/hpijs/ppd/HP-Fax-hplip.ppd
 make DESTDIR=$startdir/pkg install

 rm -rf $startdir/pkg/etc/sane.d
}
md5sums=('ea57b92483622d3eae359994c5fd3dc3')
md5sums=('ea57b92483622d3eae359994c5fd3dc3')
