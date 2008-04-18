# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
 
pkgname=psutils
pkgver=1.17
pkgrel=1
pkgdesc="A set of postscript utilities"
arch=(i686 x86_64)
license=('custom')
depends=('glibc' 'ghostscript')
provides=('psutils-lprng')
replaces=('psutils-lprng')
url="http://www.tardis.ed.ac.uk/~ajcd/psutils/index.html"
source=(ftp://ftp.enst.fr/pub/unix/a2ps/${pkgname}-${pkgver}.tar.gz
        psutils-1.17.diff)
md5sums=('b161522f3bd1507655326afa7db4a0ad' '2b49e9e796000b42f42804d4b50a2be1')

build() {
  cd ${startdir}/src/${pkgname}
  patch -Np1 -i ${startdir}/src/psutils-1.17.diff
  mkdir -p ${startdir}/pkg/usr ${startdir}/pkg/usr/include \
    ${startdir}/pkg/usr/man
  make -f Makefile.unix BINDIR=${startdir}/pkg/usr/bin \
    INCLUDEDIR=${startdir}/pkg/usr/include/psutils PERL=/usr/bin/perl \
    MANDIR=${startdir}/pkg/usr/man/man1 || return 1
  make -f Makefile.unix BINDIR=${startdir}/pkg/usr/bin \
    INCLUDEDIR=${startdir}/pkg/usr/include/psutils PERL=/usr/bin/perl \
    MANDIR=${startdir}/pkg/usr/man/man1 install
  mkdir -p ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/
}
