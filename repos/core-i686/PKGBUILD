# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=ppp
pkgver=2.4.4
pkgrel=6
pkgdesc="A daemon which implements the PPP protocol for dial-up networking"
arch=(i686 x86_64) 
url="http://www.samba.org/ppp/"
license=('custom:GPL/BSD')
groups=('base')
depends=('glibc' 'libpcap>=0.9.8')
backup=(etc/ppp/{chap-secrets,pap-secrets,options,ip-up,ip-down})
source=(ftp://ftp.samba.org/pub/ppp/ppp-$pkgver.tar.gz \
        options pon poff ppp plog pon.1 ip-up ip-down)
md5sums=('183800762e266132218b204dfb428d29' '7a9259a8f038073eeea7e4552ff1849f'\
         '48c024f73a80c8b69c4def22f86902cc' '2d811f8470ccdea3b8c4505a438483e9'\
         '7561c73b557292d5ba1a9c5dbd270fde' '86cdaf133f7a79fb464f02d83afc7734'\
         '44cc662ba9aa61dd9add3ddd4c5ded57' 'fac0c773490371ea673f4be0977a230f'\
         'a88b40b1bf91eb5cca3762b7195e4fe2')

build() {
  cd $startdir/src/$pkgname-$pkgver
  # fix CFLAGS
  sed -i "s:-O2 -pipe -Wall -g:${CFLAGS}:" pppd/Makefile.linux
  sed -i "s:-g -O2:${CFLAGS}:" pppd/plugins/Makefile.linux
  sed -i "s:-O2:${CFLAGS}:" pppstats/Makefile.linux
  sed -i "s:-O2 -g -pipe:${CFLAGS}:" chat/Makefile.linux
  sed -i "s:-O:${CFLAGS}:" pppdump/Makefile.linux

  # enable active filter
  sed -i "s:^#FILTER=y:FILTER=y:" pppd/Makefile.linux

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg/usr install
  install -D -m644 $startdir/src/options $startdir/pkg/etc/ppp/options
  install -D -m755 $startdir/src/ip-up $startdir/pkg/etc/ppp/ip-up
  install -D -m755 $startdir/src/ip-down $startdir/pkg/etc/ppp/ip-down
  install -D -m755 $startdir/src/pon $startdir/pkg/usr/bin/pon
  install -D -m755 $startdir/src/poff $startdir/pkg/usr/bin/poff
  install -D -m755 $startdir/src/plog $startdir/pkg/usr/sbin/plog
  install -D -m600 etc.ppp/pap-secrets $startdir/pkg/etc/ppp/pap-secrets
  install -D -m600 etc.ppp/chap-secrets $startdir/pkg/etc/ppp/chap-secrets
  install -D -m755 $startdir/src/ppp $startdir/pkg/etc/rc.d/ppp 
  install -D -m644 $startdir/src/pon.1 $startdir/pkg/usr/man/man1/pon.1
  mkdir -p $startdir/pkg/etc/ppp/peers
}
