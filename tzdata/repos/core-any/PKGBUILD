# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=tzdata
pkgver=2014e
pkgrel=1
pkgdesc="Sources for time zone and daylight saving time data"
arch=('any')
url="http://www.iana.org/time-zones"
license=('GPL')
options=('!emptydirs')
source=(http://www.iana.org/time-zones/repository/releases/${pkgname}${pkgver}.tar.gz{,.asc})
sha1sums=('724b0e19ba26316d7e1f6fee1ec5934fa31454ab'
          'SKIP')

timezones=('africa' 'antarctica' 'asia' 'australasia'
           'europe' 'northamerica' 'southamerica'
           'pacificnew' 'etcetera' 'backward'
           'systemv' 'factory')

package() {
  cd ${srcdir}
  zic -y ./yearistype -d ${pkgdir}/usr/share/zoneinfo ${timezones[@]}
  zic -y ./yearistype -d ${pkgdir}/usr/share/zoneinfo/posix ${timezones[@]}
  zic -y ./yearistype -d ${pkgdir}/usr/share/zoneinfo/right -L leapseconds ${timezones[@]}
  
  zic -y ./yearistype -d ${pkgdir}/usr/share/zoneinfo -p America/New_York
  install -m444 -t ${pkgdir}/usr/share/zoneinfo iso3166.tab zone.tab
}
