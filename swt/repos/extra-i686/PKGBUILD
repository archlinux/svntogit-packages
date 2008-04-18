# $Id$
# Maintainer: simo <simo@archlinux.org>
pkgname=swt
pkgver=3.3
pkgrel=2
pkgdesc="An open source widget toolkit for Java"
_date=200706251500
arch=(i686 x86_64)
url="http://www.eclipse.org/swt/"
license=('EPL')
depends=('java-runtime')
makedepends=('java-gcj-compat' 'libxtst' 'mesa' 'libgnomeui' 'xulrunner>=1.8.1.11' 'unzip' \
             'pkgconfig' 'apache-ant')
if [ "${CARCH}" = "i686" ]; then
  source=(http://archive.eclipse.org/eclipse/downloads/drops/R-${pkgver}-${_date}/swt-${pkgver}-gtk-linux-x86.zip
          build-swt.xml)
  noextract=(swt-${pkgver}-gtk-linux-x86.zip)
  md5sums=('7398cdf9340cb131b76ed98495239520'
         'f5e548bc26a0f1f3c18131be76face40')
fi
if [ "${CARCH}" = "x86_64" ]; then
  source=(http://download.eclipse.org/eclipse/downloads/drops/R-${pkgver}-${_date}/swt-${pkgver}-gtk-linux-x86_64.zip
          build-swt.xml)
  noextract=(swt-${pkgver}-gtk-linux-x86_64.zip)
  md5sums=('b0a4b3442e61d2968acecfa18cdd3aa9'
         'f5e548bc26a0f1f3c18131be76face40')
fi

build() {
  cd ${startdir}/src
  unzip -jqo ${startdir}/src/swt-${pkgver}-gtk-linux-*.zip "*src.zip"
  unzip -qo src.zip
  rm -rf about_files
  mkdir src
  mv org src/
  cp build-swt.xml build.xml || return 1

  [ "${CARCH}" = "x86_64" ] && export SWT_PTR_CFLAGS=-DSWT_PTR_SIZE_64

  make -f make_linux.mak make_awt || return 1
  make -f make_linux.mak make_swt || return 1
  make -f make_linux.mak make_atk || return 1
  make -f make_linux.mak make_gnome || return 1
  MOZILLA_INCLUDES="`pkg-config --cflags xulrunner-xpcom`" \
  MOZILLA_LIBS="`pkg-config --libs xulrunner-xpcom` -Wl,-R/opt/mozilla/lib/xulrunner" \
    make -f make_linux.mak make_mozilla || return 1
  XULRUNNER_INCLUDES="`pkg-config --cflags xulrunner-xpcom`" \
  XULRUNNER_LIBS="`pkg-config --libs xulrunner-xpcom` -Wl,-R/opt/mozilla/lib/xulrunner" \
    make -f make_linux.mak make_xulrunner || return 1

  make -f make_linux.mak make_cairo || return 1
  make -f make_linux.mak make_glx || return 1
 
  ant compile || return 1
  cp version.txt build/version.txt
  cp src/org/eclipse/swt/internal/SWTMessages.properties build/org/eclipse/swt/internal/

  ant jar || return 1

  install -D -m644 swt.jar ${startdir}/pkg/usr/share/java/swt.jar
  mkdir -p ${startdir}/pkg/usr/lib
  install -m755 *.so ${startdir}/pkg/usr/lib/
}
