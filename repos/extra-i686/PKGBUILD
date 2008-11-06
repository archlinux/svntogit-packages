# $Id: $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=pkgstats
pkgver=1.0
pkgrel=1
pkgdesc='submits a list of installed packages to the Arch Linux project'
arch=('i686' 'x86_64')
url='http://www.archlinux.de'
license=('GPL')
depends=('bash' 'curl' 'pacman')
source=('pkgstats.sh')
md5sums=('6a0428fd3eb687aa32089a81e6316f7e')

build() {
	install -D -m755 ${srcdir}/pkgstats.sh ${pkgdir}/usr/bin/pkgstats
}
