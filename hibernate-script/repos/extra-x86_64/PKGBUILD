# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>

pkgname=hibernate-script
pkgver=1.96
pkgrel=2
pkgdesc="Scripts needed for software suspend aka hibernate"
arch=(i686 x86_64)
options=(!strip)
backup=('etc/hibernate/hibernate.conf' 'etc/hibernate/suspend2.conf' \
        'etc/hibernate/disk.conf' 'etc/hibernate/ram.conf' \
        'etc/hibernate/common.conf' 'etc/hibernate/blacklisted-modules' \
        'etc/hibernate/ususpend-both.conf' 'etc/hibernate/sysfs-ram.conf' \
        'etc/hibernate/ususpend-ram.conf' 'etc/hibernate/sysfs-disk.conf' \
        'etc/hibernate/ususpend-disk.conf')
url="http://www.suspend2.net"
source=(http://www.suspend2.net/downloads/all/hibernate-script-$pkgver.tar.gz \
        hibernate-script-${pkgver}-arch.patch hibernate.rc)
md5sums=('1ca5fc5505131c0fa08cfcc1caf39b0f'
         '92893c780fdf1820c8f9e55294d2ac7f'
         '7e470bc1f8090c41f57f50b63aba6d29')
depends=(bash kbd)


build() {
  cd $startdir/src/hibernate-script-$pkgver
  # Fix scriptlets to work properly with Archlinux
  patch -Np1 -i ../hibernate-script-${pkgver}-arch.patch || return 1
  export BASE_DIR=${startdir}/pkg
  export PREFIX=/usr
  mkdir -p $startdir/pkg/etc/{rc,logrotate}.d
  ./install.sh || return 1
  install -m 755 ../hibernate.rc $startdir/pkg/etc/rc.d/hibernate-cleanup
}
