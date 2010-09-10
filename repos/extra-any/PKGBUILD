# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=pkgstats
pkgver=2.0
pkgrel=1
pkgdesc='submits a list of installed packages to the Arch Linux project'
arch=('any')
url='http://www.archlinux.de'
license=('GPL')
depends=('bash' 'curl' 'pacman' 'sed' 'coreutils')
source=('pkgstats.sh')
md5sums=('4f6c4fef01b7b000d9da9c43442af2ea')

build() {
	install -D -m755 ${srcdir}/pkgstats.sh ${pkgdir}/usr/bin/pkgstats
}
