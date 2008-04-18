# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>

pkgname=proftpd
pkgver=1.3.1
pkgrel=1
pkgdesc="A high-performance, scalable FTP server"
arch=('i686' 'x86_64')
url="http://www.proftpd.org"
license=('GPL')
depends=('glibc' 'pam' 'ncurses')
backup=('etc/proftpd.conf' 'etc/conf.d/proftpd')
source=(ftp://ftp.proftpd.org/distrib/source/$pkgname-$pkgver.tar.bz2 proftpd \
        proftpd.logrotate proftpd.conf.d)
md5sums=('175958df8de92d5209b7b1e2e23a5a28' '2ab07084433a57c994e65eabdf3971a9'\
         'ddb09eb13131becdf0e081eef413116b' '71d5932b0461c318ed68c2c0c2660736')
sha1sums=('0b54286492967172c5355e2f489f9665b46591e5' '29684bdff212ff148f773dd6232cecd78b42ca2b' \
          '83c38ec40efb7cc09d9824b98e65cd948a195cc6' 'f34f60cb4fb1f4af7be7aca427cbad3cad22bbb9')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-pam \
    --with-modules=mod_quotatab:mod_quotatab_file \
    --sysconfdir=/etc --localstatedir=/var --enable-ctrls
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 ../proftpd.logrotate $startdir/pkg/etc/logrotate.d/proftpd
  install -D -m644 ../proftpd.conf.d $startdir/pkg/etc/conf.d/proftpd
  install -D -m755 ../proftpd ${startdir}/pkg/etc/rc.d/proftpd
  cd $startdir/pkg/etc
  sed -i 's|nogroup|nobody|g' proftpd.conf
  rm -r ${startdir}/pkg/usr/{libexec,share}
}
