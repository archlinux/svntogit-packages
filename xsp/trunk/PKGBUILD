# $Id$
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=xsp
pkgver=1.9
pkgrel=1
pkgdesc="A simple webserver based on mono - provides ASP.NET support"
arch=(i686 x86_64)
license=('custom')
url="http://www.go-mono.com"
depends=('mono>=1.9')
options=(!makeflags)
install=${pkgname}.install
source=(http://www.go-mono.com/sources/${pkgname}/${pkgname}-${pkgver}.tar.bz2 \
        ${pkgname}.rc.d ${pkgname}.conf.d ${pkgname}.webapp)
md5sums=('6ec9e718e2c67088bba4e21092b85f22'
         '9575bd7d6f64d51ba05bdd6370665858'
         '35d921df0fefc30f47a438c95d420efc'
         '3136575652778d8b905dae8302ceec03')

build() {
 # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR=${startdir}/src/weird
  mkdir -p "${MONO_SHARED_DIR}"
 # import pathes
 # build
  cd ${startdir}/src/${pkgname}-${pkgver}
  #sed -i 's|/bin/sh|\0\nexport MONO_PATH=${MONO_PATH}:/opt/mono/lib/mono/1.0|' scripts/script.in
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
 # tweak the xsp shellscript to grab system dll's
  for script in scripts/*2; do
    sed -i 's|/usr/lib/mono/1.0|/usr/lib/mono/2.0|' $script
  done
   #destdir related bugfixes
  sed -i 's|mkdir \$(datadir)|mkdir $(DESTDIR)$(datadir)|' test/2.0/treeview/Makefile
  sed -i 's|gif \$(datadir)|gif $(DESTDIR)$(datadir)|' test/2.0/treeview/Makefile
  make DESTDIR=${startdir}/pkg install
 # move test files from share to arch' default html home
  mkdir -p ${startdir}/pkg/home/httpd/html
  mv ${startdir}/pkg/usr/lib/xsp/test $startdir/pkg/home/httpd/html/xsp
  rm -rf ${startdir}/pkg/usr/share
  chown -R nobody:nobody ${startdir}/pkg/home/httpd/html/${pkgname}

 # install a deamon
  install -D -m755 ${startdir}/src/${pkgname}.rc.d \
    ${startdir}/pkg/etc/rc.d/${pkgname}
 # install a deamon configurationfile
  install -D -m644 $startdir/src/$pkgname.conf.d \
    ${startdir}/pkg/etc/conf.d/${pkgname}
 # install a xsp configuration home
  install -D -m644 ${startdir}/src/${pkgname}.webapp \
    ${startdir}/pkg/etc/${pkgname}/${pkgname}.webapp
  install -D -m644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
