# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=dcron
pkgver=3.2
pkgrel=3
pkgdesc="Dillon's Cron Daemon"
arch=(i686 x86_64)
license=('GPL')
groups=('base')
url="http://apollo.backplane.com/FreeSrc/"
backup=(var/spool/cron/root)
depends=('glibc')
provides=('cron')
source=(http://apollo.backplane.com/FreeSrc/dcron32.tgz
	dcron-3.1.patch
	root.crontab
	crond
	crond.logrotate
	run-cron)
md5sums=('c2c816deb389b4bfb00761f26afe3efd' '2f0c3f7497a12c8826c9be3f87843fcd'\
         '7fcc06b13708ebd667711b1fbf62ee6e' 'd7edac165ef19ebb9d0089bdc218b53a'\
         'aeabcd5e4924d1a7593c8782d1068c86' '5ff0cdcb9ec99778938ac6ef26800327')

build() {
  cd $startdir/src/dcron
  patch -Np1 -i ../dcron-3.1.patch || return 1
  make || return 1
  install -D -m4755 crontab $startdir/pkg/usr/bin/crontab
  install -D -m755 crond $startdir/pkg/usr/sbin/crond
  install -D -m644 crontab.1 $startdir/pkg/usr/man/man1/crontab.1
  install -D -m644 crond.8 $startdir/pkg/usr/man/man8/crond.8
  mkdir -p $startdir/pkg/var/spool/cron $startdir/pkg/etc/cron.d
  mkdir -p $startdir/pkg/etc/{rc.d,cron.hourly,cron.daily,cron.weekly,cron.monthly}
  install -D -m0600 ../root.crontab $startdir/pkg/var/spool/cron/root
  install -D -m755 ../crond $startdir/pkg/etc/rc.d/crond
  install -D -m644 ../crond.logrotate $startdir/pkg/etc/logrotate.d/crond
  install -D -m755 ../run-cron $startdir/pkg/usr/sbin/run-cron
}
