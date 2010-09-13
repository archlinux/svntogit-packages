# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=pkgstats
pkgver=2.1
pkgrel=1
pkgdesc='submits a list of installed packages to the Arch Linux project'
arch=('any')
url='https://www.archlinux.de'
license=('GPL')
depends=('bash' 'curl' 'pacman' 'sed' 'coreutils' 'cron' 'sudo')
source=('pkgstats.sh' 'pkgstats.cron')
md5sums=('0c44b3f03d8e52645cf2bf8ef17084d5'
         '2c6f81aa4881ce890ec71c2a7fb6f8e1')

package() {
	install -D -m755 ${srcdir}/pkgstats.sh ${pkgdir}/usr/bin/pkgstats
	install -D -m744 ${srcdir}/pkgstats.cron ${pkgdir}/etc/cron.weekly/pkgstats
}
