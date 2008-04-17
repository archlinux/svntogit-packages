# $Id: PKGBUILD,v 1.9 2008/03/29 12:26:27 daniel Exp $
# Maintainer: Tom Killian <tom@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=opera-devel
pkgver=9.50
pkgrel=0.20
pkgdesc="The Opera web browser developement and testing version"
url="http://www.opera.com/"
depends=('qt3')
license=('custom:opera')
arch=('i686' 'x86_64')
conflicts=('opera')
provides=('opera')
source=(http://snapshot.opera.com/unix/snapshot-1929/intel-linux/opera-9.50-20080417.6-shared-qt.i386-1929.tar.bz2 opera.desktop opera_logo48.png)
md5sums=('d7fe95095d2ad36fc0a0064297babb1b'
         '63420a6c4e77f7d9aa3d8f0ebd330947'
         'a270c65b8d4f8e2e76439f417ea44265')

[ "$CARCH" = "x86_64" ] && source=(http://snapshot.opera.com/unix/snapshot-1929/x86_64-linux/opera-9.50-20080417.2-shared-qt.x86_64-1929.tar.bz2
 opera.desktop opera_logo48.png)
[ "$CARCH" = "x86_64" ] && md5sums=('13dc137935e90eadacbf136982b3cfab'
         '63420a6c4e77f7d9aa3d8f0ebd330947'
         'a270c65b8d4f8e2e76439f417ea44265')

build() {
if [ "$CARCH" = "x86_64" ]; then
       cd ${startdir}/src/opera-9.50-20080417.2-shared-qt.x86_64-1929
       sed 's|/usr/X11R6/lib/mozilla/plugins=1|/usr/lib/mozilla/plugins=1|' -i usr/share/opera/ini/pluginpath.ini || return 1
  else cd ${startdir}/src/opera-9.50-20080417.6-shared-qt.i386-1929
       sed 's|/usr/X11R6/lib/mozilla/plugins=1|/usr/lib/mozilla/plugins=1|' -i usr/share/opera/ini/pluginpath.ini || return 1
fi
   ./install.sh DESTDIR=${startdir}/pkg
   install -D -m 644 ${startdir}/src/opera.desktop ${startdir}/pkg/usr/share/applications/opera.desktop
   install -D -m 644 LICENSE ${startdir}/pkg/usr/share/licenses/opera/license.txt
   install -D -m 644 ${startdir}/src/opera_logo48.png ${startdir}/pkg/usr/share/opera/images/opera_48x48.png
}
