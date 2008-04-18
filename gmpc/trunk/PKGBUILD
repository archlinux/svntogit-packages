# $Id$
# Maintainer:  tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=gmpc
pkgver=0.15.5.0
pkgrel=1
pkgdesc="a GNOME based GUI client tool for MPD"
arch=(i686 x86_64)
url="http://sarine.nl/gmpc"
license=("GPL")
depends=('libglade' 'libmpd' 'curl>=7.16.2' 'libsm')
options=(!libtool)
source=(http://sarine.nl/index.php\?mact=Uploads,cntnt01,getfile,0\&cntnt01showtemplate=false\&cntnt01upload_id=38\&cntnt01returnid=71)
md5sums=('8d04d8f1bad663d037b107d1845d62e6')

build() {
  cd ${startdir}/src
  mv index.php* ./${pkgname}-${pkgver}.tar.gz
  tar xzf ${pkgname}-${pkgver}.tar.gz 

  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  sed -i 's|GNOME;Application;AudioVideo;|GTK;Application;AudioVideo;Player;|' \
    data/${pkgname}.desktop
  make DESTDIR=${startdir}/pkg install
}
