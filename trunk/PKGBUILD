# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=pkgstats
pkgver=2.3
pkgrel=7
pkgdesc='Submit a list of installed packages to the Arch Linux project'
arch=('any')
url='https://www.archlinux.de'
license=('GPL')
depends=('bash' 'curl' 'pacman' 'sed' 'coreutils' 'systemd' 'awk' 'grep')
source=('pkgstats.sh'
        pkgstats.{timer,service})
install='pkgstats.install'
md5sums=('36008b6296c01221d87b11c3aa79bc0c'
         '4ec734d9b60c439d55db5fd779a007c8'
         '5948fa6ef41d3804f7eb6980684611d6')

package() {
	install -D -m755 ${srcdir}/pkgstats.sh ${pkgdir}/usr/bin/pkgstats
	install -D -m644 ${srcdir}/pkgstats.timer ${pkgdir}/usr/lib/systemd/system/pkgstats.timer
	install -D -m644 ${srcdir}/pkgstats.service ${pkgdir}/usr/lib/systemd/system/pkgstats.service
	install -d -m755 ${pkgdir}/usr/lib/systemd/system/timers.target.wants
	ln -s ../pkgstats.timer ${pkgdir}//usr/lib/systemd/system/timers.target.wants/pkgstats.timer
}
