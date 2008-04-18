# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributed by Sarah Hay <sarahhay@mb.sympatico.ca>, Tobias Powalowski <t.powa@gmx.de>, Simo L. <neotuli@yahoo.com>, eric <eric@archlinux.org>

pkgname=sane
pkgver=1.0.19
pkgrel=2
pkgdesc="Scanner Access Now Easy"
arch=(i686 x86_64)
license=('GPL')
depends=('libtiff' 'libgphoto2' 'libjpeg' 'libieee1284' 'libusb' 'bash')
source=(ftp://ftp.sane-project.org/pub/sane/$pkgname-backends-$pkgver/$pkgname-backends-$pkgver.tar.gz \
	http://heanet.dl.sourceforge.net/sourceforge/hp44x0backend/sane_hp_rts88xx-0.18.tar.gz
	patch-sane.sh.patch sane.xinetd)
url="http://www.sane-project.org"
install=$pkgname.install
backup=(etc/sane.d/{abaton.conf,agfafocus.conf,apple.conf,artec.conf,artec_eplus48u.conf,avision.conf,bh.conf,canon.conf,canon630u.conf,canon_pp.conf,coolscan.conf,coolscan2.conf,dc210.conf,dc240.conf,dc25.conf,dell1600n_net.conf,dll.conf,dmc.conf,epson.conf,epson2.conf,fujitsu.conf,genesys.conf,gphoto2.conf,gt68xx.conf,hp.conf,hp4200.conf,hp5400.conf,hp_rts88xx.conf,hpsj5s.conf,ibm.conf,leo.conf,lexmark.conf,ma1509.conf,matsushita.conf,microtek.conf,microtek2.conf,mustek.conf,mustek_pp.conf,mustek_usb.conf,nec.conf,net.conf,pie.conf,plustek.conf,plustek_pp.conf,qcam.conf,ricoh.conf,s9036.conf,saned.conf,sceptre.conf,sharp.conf,sm3840.conf,snapscan.conf,sp15c.conf,st400.conf,stv680.conf,tamarack.conf,teco1.conf,teco2.conf,teco3.conf,test.conf,u12.conf,umax.conf,umax1220u.conf,umax_pp.conf,v4l.conf} etc/xinetd.d/sane)
options=(!libtool !makeflags)

build() {
  # add hp44x backend
  cd $startdir/src/sane_hp_rts88xx/sane_hp_rts88xx/
  patch -Np0 -i $startdir/src/patch-sane.sh.patch || return 1
  ./patch-sane.sh $startdir/src/$pkgname-backends-$pkgver || return 1
  cd $startdir/src/$pkgname-backends-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install
  # fix hp officejets
  echo "#hpaio" >> $startdir/pkg/etc/sane.d/dll.conf
  # disable epson2 backend by default
  sed -i -e  's/^epson2/#epson2/g' $startdir/pkg/etc/sane.d/dll.conf
  # install udev files
  cd $startdir/src
  /bin/install -D -m0644 $startdir/src/$pkgname-backends-$pkgver/tools/udev/libsane.rules \
			 $startdir/pkg/etc/udev/rules.d/53-sane.rules
  # fix for new udev syntax >= udev 098
  sed -i -e 's#SYSFS#ATTRS#g' $startdir/pkg/etc/udev/rules.d/53-sane.rules
  # fix group on /var/lock
  mkdir -p $startdir/pkg/var/lock/sane
  chgrp 0 $startdir/pkg/var
  chmod 755 $startdir/pkg/var
  chmod 1777 $startdir/pkg/var/lock
  chgrp 0 $startdir/pkg/var/lock
  chmod 775 $startdir/pkg/var/lock/sane
  chgrp 96 $startdir/pkg/var/lock/sane
  # install xinetd file
  install -D -m644 $startdir/src/sane.xinetd $startdir/pkg/etc/xinetd.d/sane
}
md5sums=('8c0936272dcfd4e98c51512699f1c06f'
         '09d3eaf73f35b7795cd8418b8dc60f69'
         '1555b998e43d43d8841ff3ad3cd9602e'
         'da946cc36fb83612162cf9505986d4b2')
