# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=vsftpd
pkgver=2.0.6
pkgrel=1
pkgdesc="Very Secure FTP daemon"
arch=(i686 x86_64)
license=('GPL')
backup=(etc/vsftpd.conf etc/xinetd.d/vsftpd)
url="http://vsftpd.beasts.org/"
makedepends=('vim')
depends=('glibc' 'pam' 'tcp_wrappers' 'openssl' 'libcap')
install=vsftpd.install
source=(ftp://vsftpd.beasts.org/users/cevans/vsftpd-$pkgver.tar.gz \
        vsftpd.xinetd vsftpd.d)
md5sums=('f7a742690d7f86e356fb66d3840079c7'
         'b07fd4609c70063c1d6b20142910c1a6'
         'e46ed8e4c4a6e6a3de59f60b98e4f569')

build() {
  cd $startdir/src/$pkgname-$pkgver
  # build-time config
  sed \
    -e 's|^#undef VSF_BUILD_TCPWRAPPERS$|#define VSF_BUILD_TCPWRAPPERS|' \
    -e 's|^#undef VSF_BUILD_SSL$|#define VSF_BUILD_SSL|' \
    -i builddefs.h
  make || return 1
  install -D -m755 vsftpd $startdir/pkg/usr/sbin/vsftpd
  install -D -m644 vsftpd.conf $startdir/pkg/etc/vsftpd.conf
  install -D -m644 vsftpd.8 $startdir/pkg/usr/man/man8/vsftpd.8
  install -D -m644 vsftpd.conf.5 $startdir/pkg/usr/man/man5/vsftpd.conf.5
  install -D -m644 ../vsftpd.xinetd $startdir/pkg/etc/xinetd.d/vsftpd 
  install -D -m755 ../vsftpd.d $startdir/pkg/etc/rc.d/vsftpd
  mkdir -p $startdir/pkg/usr/share/empty
  ex $startdir/pkg/etc/vsftpd.conf <<_EOF
2
i
#
# Use this to use vsftpd in standalone mode, otherwise it runs through (x)inetd
#listen=YES
.
w
q
_EOF
}
