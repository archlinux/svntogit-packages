# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>

pkgname=bftpd
pkgver=2.1
pkgrel=1
pkgdesc="A very configurable (and secure) Linux FTP server"
arch=(i686 x86_64)
url="http://bftpd.sourceforge.net/"
license=('GPL')
depends=('glibc' 'pam')
backup=(etc/bftpd.conf etc/logrotate.d/bftpd etc/pam.d/bftpd var/log/bftpd.log)
source=(http://downloads.sourceforge.net/sourceforge/bftpd/bftpd-$pkgver.tar.gz
        bftpd.rc bftpd.logrotate bftpd.pam)
md5sums=('8f53ff650be1a10aa03ce5c4789c31bb'
         '56a1bf7738a6db2b2cff89e611f4f11a'
         '853680dad0df39d0b4d2fb43d4be430a'
         '96f82c38f3f540b53f3e5144900acf17')

build() {
  cd $startdir/src/$pkgname
  # install fixes
  sed -i -e 's| /var| $(DESTDIR)/var|g' Makefile.in
  ./configure --prefix=/usr --enable-pam
  make || return 1
  install -d -m755 $startdir/pkg/usr/{sbin,man/man8}
  install -d -m755 $startdir/pkg/var/run/bftpd
  install -d -m755 $startdir/pkg/var/log
  install -D -m644 $startdir/src/bftpd.logrotate $startdir/pkg/etc/logrotate.d/bftpd || return 1
  install -D -m755 $startdir/src/bftpd.rc $startdir/pkg/etc/rc.d/bftpd || return 1
  make DESTDIR=$startdir/pkg install || return 1
  mkdir -p $startdir/pkg/etc/pam.d
  cp $startdir/src/bftpd.pam $startdir/pkg/etc/pam.d/bftpd || return 1
}
