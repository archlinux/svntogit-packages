# $Id$
# Maintainer : Aaron, phrakture, Griffin <aaron@archlinux.org>
# Contributor: Christopher "nuopus" Cox <nuopus@gmail.com>

pkgname=laptop-mode-tools
pkgver=1.35
pkgrel=2
pkgdesc="Laptop mode is a kernel mode that allows you to extend the battery life of your laptop"
arch=(i686 x86_64)
url="http://www.samwel.tk/laptop_mode/"
depends=(bash hdparm)
license=('GPL')
source=(http://www.samwel.tk/laptop_mode/tools/downloads/laptop-mode-tools_${pkgver}.tar.gz \
    laptop-mode)
backup=(etc/laptop-mode/laptop-mode.conf)
md5sums=('e89dd846e4e88d117fc666842c109221' 'f4c7c6f5541d8e1f896b9ee3f1d65cbb')

build()
{
  cd $startdir/src/$pkgname-$pkgver

  cp -ra usr $startdir/pkg/
  cp -ra etc $startdir/pkg/
  mkdir -p $startdir/pkg/usr/man
  cp -ra man $startdir/pkg/usr/man/man8

  rm -r $startdir/pkg/etc/init.d

  mkdir -p $startdir/pkg/etc/rc.d
  install -m755 $startdir/src/laptop-mode $startdir/pkg/etc/rc.d/

  # Bug 5065 : Bad directory permissions
  find $startdir/pkg -type d -perm 2755 -exec chmod 755 {} \;

  # Fix binary permissions
  chmod 700 $startdir/pkg/usr/sbin/laptop_mode
  chmod 744 $startdir/pkg/usr/sbin/lm-profiler
  chmod 755 $startdir/pkg/usr/sbin/lm-syslog-setup
  chmod 755 $startdir/pkg/usr/lib/laptop-mode-tools/modules/wireless-ipw-power
  chmod 755 $startdir/pkg/etc/apm/event.d/laptop-mode
  chmod 755 $startdir/pkg/etc/power/scripts.d/laptop-mode
  chmod 755 $startdir/pkg/etc/power/event.d/laptop-mode
  chmod 755 $startdir/pkg/etc/acpi/actions/*

  # Our state dir
  mkdir -p $startdir/pkg/var/run/laptop-mode-tools/
}
