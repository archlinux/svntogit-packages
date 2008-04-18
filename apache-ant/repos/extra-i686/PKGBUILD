# $Id$
# Contributor: Andrew Wright <andreww@photism.org>
# Maintainer: Paul Mattal <paul@archlinux.org>

pkgname=apache-ant
pkgver=1.7.0
pkgrel=2
pkgdesc="Ant is a java-based build tool."
arch=(i686 x86_64)
license=('APACHE')
url="http://ant.apache.org/"
depends=('java-runtime')
makedepends=('java-environment')
source=(http://archive.apache.org/dist/ant/source/${pkgname}-${pkgver}-src.tar.bz2
        http://heanet.dl.sourceforge.net/sourceforge/junit/junit3.8.1.zip)
md5sums=('22b378e27ab300e4d73bf09d91c7e2a6' '5110326e4b7f7497dfa60ede4b626751')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  if [ -f /etc/profile.d/java-gcj-compat.sh ]; then
    . /etc/profile.d/java-gcj-compat.sh
  elif [ -f /etc/profile.d/jdk.sh ]; then
    . /etc/profile.d/jre.sh
    . /etc/profile.d/jdk.sh
  fi

   # we need the junit jar in the classpath to build ant
  export CLASSPATH="${startdir}/src/junit3.8.1/junit.jar"

  # build
  mkdir dist || return 1
  ./build.sh -Ddist.dir=dist/ dist || return 1

  # install
  export ANT_HOME="${startdir}/pkg/usr"
  ./build.sh install-lite || return 1
}
