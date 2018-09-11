# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=lm_sensors
pkgver=3.4.0+5176+dcf23676
pkgrel=1
pkgdesc="Collection of user space tools for general SMBus access and hardware monitoring"
arch=('x86_64')
url="https://hwmon.wiki.kernel.org/lm_sensors"
license=('GPL' 'LGPL')
depends=('perl')
makedepends=('rrdtool' 'git')
optdepends=('rrdtool: for logging with sensord')
backup=('etc/sensors3.conf' 'etc/healthd.conf' 'etc/conf.d/sensord')
source=("git+https://github.com/groeck/lm-sensors.git#commit=dcf23676cc264927ad58ae7960f518689372741a"
	healthd healthd.conf healthd.service sensord.conf)
sha256sums=('SKIP'
            '0ac9afb2a9155dd74ab393756ed552cd542dde1081149beb2ab4ec7ff55b8f4a'
            '5d17a366b175cf9cb4bb0115c030d4b8d91231546f713784a74935b6e533da9f'
            '2638cd363e60f8d36bcac468f414a6ba29a1b5599f40fc651ca953858c8429d7'
            '23bebef4c250f8c0aaba2c75fd3d2c8ee9473cc91a342161a9f5b3a34ddfa9e5')
validpgpkeys=('7CA69F4460F1BDC41FD2C858A5526B9BB3CD4E6A')

pkgver() {
  cd "${srcdir}/lm-sensors"

  echo 3.4.0+$(git rev-list --count HEAD)+$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/lm-sensors"
  sed -i 's|/etc/sysconfig|/etc/conf.d|' prog/{detect/sensors-detect,init/{sensord,lm_sensors}.service}
  sed -i 's/EnvironmentFile=/EnvironmentFile=-/' prog/init/lm_sensors.service
}

build() {
  cd "${srcdir}/lm-sensors"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/lm-sensors"
  make PROG_EXTRA=sensord BUILD_STATIC_LIB=0 \
    PREFIX=/usr SBINDIR=/usr/bin MANDIR=/usr/share/man DESTDIR="${pkgdir}" install

  install -D -m755 "${srcdir}/healthd" "${pkgdir}/usr/bin/healthd"

  install -D -m644 "${srcdir}/healthd.conf" "${pkgdir}/etc/healthd.conf"
  install -D -m644 "${srcdir}/sensord.conf" "${pkgdir}/etc/conf.d/sensord"
 
  install -D -m644 "${srcdir}/healthd.service" "${pkgdir}/usr/lib/systemd/system/healthd.service"
  install -D -m644 prog/init/*.service "${pkgdir}/usr/lib/systemd/system/"
}
