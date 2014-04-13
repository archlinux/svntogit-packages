# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=pkgstats
pkgver=2.3
pkgrel=5
pkgdesc='submits a list of installed packages to the Arch Linux project'
arch=('any')
url='https://www.archlinux.de'
license=('GPL')
depends=('bash' 'curl' 'pacman' 'sed' 'coreutils' 'systemd' 'awk' 'grep')
source=('pkgstats.sh'
        pkgstats.{timer,service})
install='pkgstats.install'
md5sums=('2943bc8c69999d8e3c0bd9b368a3f17b'
         '2285089dff45f583c27b9d561fda5405'
         '5225a0bb6d32a3bbf89821f841f4eb8c')

package() {
	install -D -m755 ${srcdir}/pkgstats.sh ${pkgdir}/usr/bin/pkgstats
	install -D -m644 ${srcdir}/pkgstats.timer ${pkgdir}/usr/lib/systemd/system/pkgstats.timer
	install -D -m644 ${srcdir}/pkgstats.service ${pkgdir}/usr/lib/systemd/system/pkgstats.service
	install -d -m755 ${pkgdir}/usr/lib/systemd/system/multi-user.target.wants
	ln -s ../pkgstats.timer ${pkgdir}//usr/lib/systemd/system/multi-user.target.wants/pkgstats.timer
}
