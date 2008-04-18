# $Id$
# Maintainer: kevin <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=ifplugd
pkgver=0.28
pkgrel=3
pkgdesc="A daemon which brings up/down network interfaces upon cable insertion/removal."
url="http://0pointer.de/lennart/projects/ifplugd"
depends=('libdaemon' 'bash')
install="$pkgname.install"
backup=(etc/ifplugd/ifplugd.conf)
source=($url/$pkgname-$pkgver.tar.gz ifplugd ifplugd.action)
md5sums=('df6f4bab52f46ffd6eb1f5912d4ccee3' '93207aaae535301e9e45243964b19164'\
         'a92d8dac96d920281f34b7895f31519b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --with-initdir=/etc/init.d \
      --disable-xmltoman --disable-subversion --disable-lynx
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install

  # replace INTERFACES with NET_IFS since AL
  # already uses it in /etc/rc.conf
  /bin/sed -i "s:INTERFACES:NET_IFS:g" \
      $startdir/pkg/etc/ifplugd/ifplugd.conf

  # replace the default init script & action
  # files with ours.
  /bin/rm -rf $startdir/pkg/etc/init.d
  /bin/install -D -m755 $startdir/ifplugd $startdir/pkg/etc/rc.d/ifplugd
  /bin/install -D -m755 $startdir/ifplugd.action \
      $startdir/pkg/etc/ifplugd/ifplugd.action
}
# vim: ts=2 sw=2 et ft=sh
