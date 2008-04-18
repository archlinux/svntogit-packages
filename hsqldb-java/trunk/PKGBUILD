# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>

pkgname=hsqldb-java
pkgver=1.8.0.9
pkgrel=1
pkgdesc="HSQLDB Java libraries"
arch=(i686 x86_64)
license=('custom')
makedepends=('java-gcj-compat' 'unzip' 'apache-ant')
source=(http://downloads.sourceforge.net/sourceforge/hsqldb/hsqldb_${pkgver//./_}.zip)
url="http://hsqldb.org/"
md5sums=('c3f8010e3e2c73143eb702b7f28f0c8e')

build() {
  [ -z "${JAVA_HOME}" ] && . /etc/profile.d/java-gcj-compat.sh
  cd ${startdir}/src/hsqldb/build
  export BOOTJAVAC_OPTS="-source 1.3 -target 1.3 -nowarn"

  ant jar || return 1

  mkdir -p ${startdir}/pkg/usr/share/java
  install -m644 ${startdir}/src/hsqldb/lib/hsqldb.jar ${startdir}/pkg/usr/share/java/

  mkdir -p ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 ${startdir}/src/hsqldb/doc/hsqldb_lic.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/
}
