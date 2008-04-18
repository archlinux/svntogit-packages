# $Id$
# Maintainer : Arjan Timmerman <arjan@soulfly.nl>
# Contributor: Daniel 'maniel' Kaminski <maniel.rulez//gmail.com>

pkgname=nant
pkgver=0.85
pkgrel=1
pkgdesc="A free .NET build tool, like make but without make's problems"
url="http://nant.sourceforge.net"
license="GPL"
depends=('mono')
source=(http://dl.sourceforge.net/sourceforge/nant/$pkgname-$pkgver-src.tar.gz)
md5sums=('45ae065439b6cbc0e02051b855843f50')

build() {
  mkdir -p $startdir/src/weird
  export MONO_SHARED_DIR=$startdir/src/weird

  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/src/$pkgname-$pkgver/build/mono-1.0.unix/nant-0.85-debug/bin/lib
  cp $startdir/src/$pkgname-$pkgver/lib/log4net.dll $startdir/src/nant-$pkgver/build/mono-1.0.unix/nant-0.85-debug/bin/lib
  sed -i 's!warnaserror="true"!warnaserror="false"!' `find -name '*.build'`
  make || return 1
  make install prefix=$startdir/pkg/usr || return 1
  echo '#!/bin/sh'> $startdir/pkg/usr/bin/nant
  echo 'exec /usr/bin/mono /usr/share/NAnt/bin/NAnt.exe "$@"' >> $startdir/pkg/usr/bin/nant
}

