# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=pkgstats
pkgver=2.3
pkgrel=9
pkgdesc='Submit a list of installed packages to the Arch Linux project'
arch=('any')
url='https://pkgstats.archlinux.de'
license=('GPL')
depends=('bash' 'curl' 'pacman' 'sed' 'coreutils' 'systemd' 'awk' 'grep')
source=('pkgstats.sh'
        pkgstats.{timer,service})
install='pkgstats.install'
md5sums=('0acfba6a941bdf9e6a7927f18433e091'
         '4ec734d9b60c439d55db5fd779a007c8'
         '5948fa6ef41d3804f7eb6980684611d6')

package() {
	install -D -m755 ${srcdir}/pkgstats.sh ${pkgdir}/usr/bin/pkgstats
	install -D -m644 ${srcdir}/pkgstats.timer ${pkgdir}/usr/lib/systemd/system/pkgstats.timer
	install -D -m644 ${srcdir}/pkgstats.service ${pkgdir}/usr/lib/systemd/system/pkgstats.service
	install -d -m755 ${pkgdir}/usr/lib/systemd/system/timers.target.wants
	ln -s ../pkgstats.timer ${pkgdir}//usr/lib/systemd/system/timers.target.wants/pkgstats.timer
}
