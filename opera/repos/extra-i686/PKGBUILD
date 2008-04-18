# $Id$
# Maintainer: Tom Killian <tom@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=opera
pkgver=9.27
pkgrel=1
pkgdesc="The Opera web browser"
url="http://www.opera.com/"
depends=(qt3)
license=('custom:opera')
arch=('i686')
options=('force')
source=(ftp://ftp.opera.com/pub/opera/linux/${pkgver/./}/final/en/i386/shared/opera-${pkgver}-20080331.6-shared-qt.i386-en.tar.bz2
        opera.desktop)
md5sums=('cc9a97ae719645b2a2ff092521ab9b6d' 'f99bef1a9200abe5a5cda78665cddc84')

build() {
   cd ${startdir}/src/opera-${pkgver}-20080331.6-shared-qt.i386-en-709
   sed 's|/usr/X11R6/lib/mozilla/plugins=1|/usr/lib/mozilla/plugins=1|' -i ini/pluginpath.ini || return 1
   ./install.sh DESTDIR=${startdir}/pkg
   install -D -m 644 ${startdir}/src/opera.desktop ${startdir}/pkg/usr/share/applications/opera.desktop
   install -D -m 644 LICENSE ${startdir}/pkg/usr/share/licenses/opera/license.txt
}
