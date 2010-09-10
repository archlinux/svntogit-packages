# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=pkgstats
pkgver=2.0
pkgrel=2
pkgdesc='submits a list of installed packages to the Arch Linux project'
arch=('any')
url='http://www.archlinux.de'
license=('GPL')
depends=('bash' 'curl' 'pacman' 'sed' 'coreutils')
source=('pkgstats.sh')
md5sums=('b825b1eaf0a496822cf7bf5eeff6d27d')

build() {
	install -D -m755 ${srcdir}/pkgstats.sh ${pkgdir}/usr/bin/pkgstats
}
