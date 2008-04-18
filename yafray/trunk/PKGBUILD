# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=yafray
pkgver=0.0.9
pkgrel=2
pkgdesc="Yet another Free Ray Tracer"
arch=(i686 x86_64)
depends=('openexr>=1.4.0a')
makedepends=('scons')
source=(http://www.yafray.org/sec/2/downloads/${pkgname}-${pkgver}.tar.gz)
url="http://www.yafray.org"
md5sums=('7365122e0ca6f439988f51e8b4db935c')

build() {
  cd ${startdir}/src/${pkgname}
  sed -i "s|flags+=.*$|flags+=' ${CFLAGS} -ffast-math -fomit-frame-pointer'|" linux-settings.py
  sed -i 's|return prefix+"/etc"|return "/etc"|' linux-settings.py
  scons prefix=/usr
   # fool the build system
  sed -i 's|return "/etc"|return "'${startdir}/pkg'/etc"|' linux-settings.py
  scons prefix=${startdir}/pkg/usr install
	find ${startdir}/pkg -name '.sconsign' -exec rm -f {} \;
}
