# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Jason Taylor <jftaylor21@gmail.com>

pkgname=lapack
pkgver=3.1.1
pkgrel=3
pkgdesc="Linear Algebra PACKage"
url="http://www.netlib.org/lapack"
arch=('i686' 'x86_64')
license=("custom")
depends=('gcc-libs>=4.3.0')
makedepends=('blas')
source=(http://www.netlib.org/${pkgname}/${pkgname}-${pkgver}.tgz
	make.inc.archlinux
	make.inc.archlinux-static)
md5sums=('00b21551a899bcfbaa7b8443e1faeef9' 'a9504078034722a348d83d17206c91ca'\
         '33c2ebbcc06eb8af4d417a502c868d16')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  install -m755 -d ${startdir}/pkg/usr/lib
  install -m755 -d ${startdir}/pkg/usr/share/man/man1

# shared:
  cp ${startdir}/src/make.inc.archlinux ${startdir}/src/${pkgname}-${pkgver}/make.inc
  if [ "${CARCH}" = "x86_64" ]; then
    sed -i 's/OPTS     = -funroll-all-loops -O3/OPTS     = -funroll-all-loops -O3 -fPIC/' make.inc
    sed -i 's/NOOPT    = -O0/NOOPT    = -O0 -fPIC/' make.inc
    sed -i 's/i686/x86_86/' make.inc
  fi
  make lib || return 1
  install -m755 *.so.* ${startdir}/pkg/usr/lib/ || return 1
  make clean 

# static:
  cp ${startdir}/src/make.inc.archlinux-static ${startdir}/src/${pkgname}-${pkgver}/make.inc
  if [ "${CARCH}" = "x86_64" ]; then
    sed -i 's/OPTS     = -funroll-all-loops -O3/OPTS     = -funroll-all-loops -O3 -fPIC/' make.inc
    sed -i 's/NOOPT    = -O0/NOOPT    = -O0 -fPIC/' make.inc
    sed -i 's/i686/x86_86/' make.inc
  fi
  make lib || return 1
  install -m644 *.a ${startdir}/pkg/usr/lib/ || return 1

# man pages
  for _file in manpages/man/manl/* manpages/blas/man/manl/*; do
    install -m644 ${_file} ${startdir}/pkg/usr/share/man/man1/$(basename ${_file} .l).1
  done

  install -d -m755 ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
