# $Id: $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=pkgstats
pkgver=1.0
pkgrel=3
pkgdesc='submits a list of installed packages to the Arch Linux project'
arch=('any')
url='http://www.archlinux.de'
license=('GPL')
depends=('bash' 'curl' 'pacman')
source=('pkgstats.sh')
md5sums=('899e398052a41a2fef6ec4a4ddb151d9')

build() {
	install -D -m755 ${srcdir}/pkgstats.sh ${pkgdir}/usr/bin/pkgstats
}
