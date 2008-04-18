# $Id$
#Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=capi4hylafax
pkgver=010300
pkgrel=1 # arch64 is not really up to date 
pkgdesc="capi plugin for hylafax to enable isdn faxing"
arch=(i686 x86_64)
url="ftp://ftp.avm.de/tools"
depends=('glibc' 'capi4k-utils' 'hylafax')
source=(ftp://ftp.avm.de/tools/capi4hylafax.linux/capi4hylafax-01.03.00.tar.gz
	config.faxCAPI capi4hylafax.rc)
install=capi4hylafax.install
backup=(var/spool/hylafax/etc/config.faxCAPI)
build() {
  cd $startdir/src/$pkgname-01.03.00
# fix config file
  sed -i -e 's#/etc/config.faxCAPI#/var/spool/hylafax/etc/config.faxCAPI#g' src/defaults.h.in
  ./configure
  make
  install -m755 -D src/faxsend/c2faxsend $startdir/pkg/usr/bin/c2faxsend
  install -m755 -D src/faxrecv/c2faxrecv $startdir/pkg/usr/bin/c2faxrecv
  install -m755 -D setupconffile $startdir/pkg/usr/bin/c2faxaddmodem
  install -m644 -D $startdir/src/config.faxCAPI $startdir/pkg/var/spool/hylafax/etc/config.faxCAPI
  install -m755 -D $startdir/src/capi4hylafax.rc $startdir/pkg/etc/rc.d/capi4hylafax
# adding FIFO
  mkfifo $startdir/pkg/var/spool/hylafax/FIFO.faxCAPI
  chown 10 $startdir/pkg/var/spool/hylafax/FIFO.faxCAPI
  chgrp 14 $startdir/pkg/var/spool/hylafax/FIFO.faxCAPI
  chmod 0600 $startdir/pkg/var/spool/hylafax/FIFO.faxCAPI
  mkdir -p $startdir/pkg/etc/udev/rules.d
# fix /var/spool/hylafax permission
  chown 10 $startdir/pkg/var/spool/hylafax
  chgrp 14 $startdir/pkg/var/spool/hylafax
# adding udev rule
cat << EOF >> $startdir/pkg/etc/udev/rules.d/capi4hylafax.rules
# CAPI devices
KERNEL=="capi",		NAME="capi20", SYMLINK+="isdn/capi20", GROUP="uucp"
KERNEL=="capi*",		NAME="capi/%n", GROUP="uucp"
EOF
# fix c2faxadd
  sed -i -e 's#/etc/config.faxCAPI#/var/spool/hylafax/etc/config.faxCAPI#g' $startdir/pkg/usr/bin/c2faxaddmodem
  echo "main_config_dialog" >>  $startdir/pkg/usr/bin/c2faxaddmodem
}
md5sums=('d37dc652ac80d1525ef8693be55ee67f' '653b60695d21c128f020a86274ca9192'\
         '1fe40c58289fa3ba625ce6fe2fdb3d07')
