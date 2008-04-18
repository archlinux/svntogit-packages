# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=rpmextract
pkgver=0
pkgrel=2
pkgdesc="This script extracts rpm archives"
arch=(i686 x86_64)
license=('GPL')
source=(rpmextract.sh)
url="http://www.archlinux.org"
depends=('bash' 'libarchive')
build() {
install -D -m755 $startdir/src/rpmextract.sh $startdir/pkg/usr/bin/rpmextract.sh
}
md5sums=('e90e363350c0b334f858385c52cf7559')
