# $Id$
# Maintainer : Aaron, phrakture, Griffin <aaron@archlinux.org>
# Contributor: Christopher "nuopus" Cox <nuopus@gmail.com>

pkgname=laptop-mode-tools
pkgver=1.41
pkgrel=1
pkgdesc="Laptop mode is a kernel mode that allows you to extend the battery life of your laptop"
arch=(i686 x86_64)
url="http://www.samwel.tk/laptop_mode/"
depends=(bash hdparm)
license=('GPL')
source=(http://www.samwel.tk/laptop_mode/tools/downloads/${pkgname}_${pkgver}.tar.gz \
laptop-mode)
#Out of hand? Nah!
backup=(etc/laptop-mode/conf.d/ac97-powersave.conf
        etc/laptop-mode/conf.d/auto-hibernate.conf
        etc/laptop-mode/conf.d/configuration-file-control.conf
        etc/laptop-mode/conf.d/cpufreq.conf
        etc/laptop-mode/conf.d/dpms-standby.conf
        etc/laptop-mode/conf.d/lcd-brightness.conf
        etc/laptop-mode/conf.d/start-stop-programs.conf
        etc/laptop-mode/conf.d/terminal-blanking.conf
        etc/laptop-mode/conf.d/wireless-ipw-power.conf
        etc/laptop-mode/conf.d/wireless-iwl-power.conf
        etc/laptop-mode/laptop-mode.conf
        etc/laptop-mode/lm-profiler.conf)
md5sums=('b94da139712795910b3dd1783da32459'
         '241a0e07fc3b340b3381bcde8a74b71d')

#laptop-mode-tools has one of the worst install scripts ever... manual here
build()
{
    cd $startdir/src/${pkgname}_${pkgver}

    #state dir
    mkdir -p $startdir/pkg/var/run/laptop-mode-tools/

    #binaries
    mkdir -p $startdir/pkg/usr/sbin/
    install -m700 usr/sbin/* $startdir/pkg/usr/sbin/

    #config files
    mkdir -p $startdir/pkg/etc/laptop-mode/conf.d
    install -D -m644 etc/laptop-mode/laptop-mode.conf $startdir/pkg/etc/laptop-mode/
    install -D -m600 etc/laptop-mode/lm-profiler.conf $startdir/pkg/etc/laptop-mode/
    install -m600 etc/laptop-mode/conf.d/* $startdir/pkg/etc/laptop-mode/conf.d/

    #modules
    mkdir -p $startdir/pkg/usr/share/laptop-mode-tools/modules/
    install -m700 usr/share/laptop-mode-tools/modules/* $startdir/pkg/usr/share/laptop-mode-tools/modules/

    #man pages
    mkdir -p $startdir/pkg/usr/share/man/man8/
    install -D -m644 man/* $startdir/pkg/usr/share/man/man8/

    #acpi support
    mkdir -p $startdir/pkg/etc/acpi/actions
    install -D -m700 etc/acpi/actions/* $startdir/pkg/etc/acpi/actions
    mkdir -p $startdir/pkg/etc/acpi/events
    install -D -m600 etc/acpi/events/* $startdir/pkg/etc/acpi/events

    #apm support - TODO still needed?
    mkdir -p $startdir/pkg/etc/apm/event.d/
    install -D -m700 etc/apm/event.d/* $startdir/pkg/etc/apm/event.d

    #pm-utils support
    mkdir -p $startdir/pkg/etc/power/scripts.d/
    install -D -m700 etc/power/scripts.d/* $startdir/pkg/etc/power/scripts.d
    mkdir -p $startdir/pkg/etc/power/event.d
    ln -fs /etc/power/scripts.d/laptop-mode $startdir/pkg/etc/power/event.d

    #arch init script
    mkdir -p $startdir/pkg/etc/rc.d
    install -m755 $startdir/src/laptop-mode $startdir/pkg/etc/rc.d/
}
