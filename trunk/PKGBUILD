# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=pkgstats
pkgver=2.3
pkgrel=1
pkgdesc='submits a list of installed packages to the Arch Linux project'
arch=('any')
url='https://www.archlinux.de'
license=('GPL')
depends=('bash' 'curl' 'pacman' 'sed' 'coreutils' 'cron' 'awk' 'grep')
source=('pkgstats.sh' 'pkgstats.cron')
install='pkgstats.install'
md5sums=('f894fc13082459bf16070ab54ef2501b'
         'e86e6b9778303367f2e31f5c311da685')

package() {
	install -D -m755 ${srcdir}/pkgstats.sh ${pkgdir}/usr/bin/pkgstats
	install -D -m744 ${srcdir}/pkgstats.cron ${pkgdir}/etc/cron.weekly/pkgstats
}
