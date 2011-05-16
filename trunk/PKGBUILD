# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=pkgstats
pkgver=2.1
pkgrel=5
pkgdesc='submits a list of installed packages to the Arch Linux project'
arch=('any')
url='https://www.archlinux.de'
license=('GPL')
depends=('bash' 'curl' 'pacman' 'sed' 'coreutils' 'cron')
source=('pkgstats.sh' 'pkgstats.cron')
install='pkgstats.install'
md5sums=('f63f0619b6ecd76f41de11561bf2fb1e'
         'e86e6b9778303367f2e31f5c311da685')

package() {
	install -D -m755 ${srcdir}/pkgstats.sh ${pkgdir}/usr/bin/pkgstats
	install -D -m744 ${srcdir}/pkgstats.cron ${pkgdir}/etc/cron.weekly/pkgstats
}
