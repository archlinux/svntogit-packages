# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=xfsprogs
pkgver=2.9.7
pkgrel=1
pkgdesc="XFS filesystem utilities"
arch=(i686 x86_64)
license=('LGPL')
url="http://oss.sgi.com/projects/xfs/"
groups=('base')
depends=(e2fsprogs)
options=('!makeflags' '!libtool')
source=(ftp://oss.sgi.com/projects/xfs/cmd_tars/xfsprogs_${pkgver}-1.tar.gz)
md5sums=('2bba6d3e4183defacf99e5e8ce805460')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  #sed -i '/autoconf/d' Makefile

 if [ "$CARCH" == "x86_64" ]; then
     export OPTIMIZER="-march=x86-64 -O1"    	 # for x86_64
  else  export OPTIMIZER="-march=${CARCH} -O1"   # for i686
fi

  export DEBUG=-DNDEBUG
  make || return 1
  make DIST_ROOT=${startdir}/pkg install install-dev
}
