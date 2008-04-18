# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.org>

pkgname=nfs-utils
pkgver=1.1.0
pkgrel=4
pkgdesc="Support programs for Network File Systems"
arch=('i686' 'x86_64')
url='http://nfs.sourceforge.net'
license=('GPL')
backup=('etc/exports' 'etc/conf.d/nfs')
depends=('glibc' 'tcp_wrappers' 'e2fsprogs' 'portmap' 'nfsidmap' 'libevent>=1.3e')
source=(http://heanet.dl.sourceforge.net/sourceforge/nfs/${pkgname}-${pkgver}.tar.gz
	nfsd
	nfslock
	exports
	nfs.conf.d
	start-statd.patch)
install=nfs-utils.install

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ../start-statd.patch || return 1
  ./configure --prefix=/usr --enable-nfsv3 --disable-gss \
    --with-statedir=/var/lib/nfs --sysconfdir=/etc
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m 755 ../nfsd ${startdir}/pkg/etc/rc.d/nfsd
  install -D -m 755 ../nfslock ${startdir}/pkg/etc/rc.d/nfslock
  install -D -m 644 ../exports ${startdir}/pkg/etc/exports
  install -D -m 644 ../nfs.conf.d ${startdir}/pkg/etc/conf.d/nfs
  mkdir ${startdir}/pkg/var/lib/nfs/v4recovery
}
md5sums=('df88c6fe88a26f9797e74cb2d3291a2a'
         '5a9436e492e68efaf801b9c496684541'
         '5d0d31f27f2319747d4499df11485ae7'
         '1358d29a549dfc37b522c35e823c6813'
         'b4aae6963ec25d226eb2d97214f5bb18'
         '9c8aeff40ca25312328afe3b7fad293f')
