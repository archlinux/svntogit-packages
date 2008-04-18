# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=autopano-sift
pkgver=2.4
pkgrel=3
pkgdesc="a C# based detector for picture matching"
arch=(i686 x86_64)
license=('GPL2')
url="http://user.cs.tu-berlin.de/~nowozin/autopano-sift/"
depends=('mono>=1.0' 'gtk-sharp')
source=(http://user.cs.tu-berlin.de/~nowozin/$pkgname/$pkgname-$pkgver.tar.gz \
       $pkgname.desktop)
md5sums=('e497074d0cb5586cdc66506d782ccbd7' '05fe02f9acdc484351aa8b9ab8153825')

build() {
 export MAKEFLAGS="-j1"
 # get rid of that .wapi errors; thanks to brice
  mkdir -p $startdir/pkg/weird
  export MONO_SHARED_DIR=$startdir/pkg/weird
 # build
  cd $startdir/src/$pkgname-$pkgver/src
  make clean all || return 1

  # manual install
  for library in *.dll; do
    install -Dm644 $library $startdir/pkg/usr/lib/autopano-sift/$library
  done
  cd util
  for binary in *.exe; do
    install -Dm644 $binary $startdir/pkg/usr/lib/autopano-sift/$binary
  done
  install -m644 autopanog/autopanog.exe \
    $startdir/pkg/usr/lib/autopano-sift/
  cd ..
   # install the shellscripts
   # sed the pathes
  sed -i 's|^mono|/usr/bin/mono|' util/monoopt.sh
  install -Dm755 util/monoopt.sh $startdir/pkg/usr/bin/monoopt.sh
  for script in bin/*.sh; do
    sed -i 's|^MONO.*$|MONO=/usr/bin/monoopt.sh|' $script
    sed -i 's|^AUTOPANO_PATH.*$|AUTOPANO_PATH=/usr/lib/autopano-sift|' $script
    install -m755 $script $startdir/pkg/usr/bin/
  done

  cat >> $startdir/pkg/usr/bin/autopanog << 'END_OF_GUISTARTSCRIPT'
#!/bin/sh
MONO=`dirname $0`/monoopt.sh
$MONO /usr/lib/autopano-sift/autopanog.exe $*
END_OF_GUISTARTSCRIPT
  chmod 755 $startdir/pkg/usr/bin/autopanog
 ###############################################################################
 # install additional things (manpages, desktop stuff)
  cd $startdir/src/$pkgname-$pkgver/doc
  for manpage in `/bin/ls *.1`; do
    gzip -c -9 $manpage > $manpage.gz
    install -Dm644 $manpage.gz $startdir/pkg/usr/man/man1/$manpage.gz
  done
  gzip  -c -9 autopano-sift.7 > autopano-sift.7.gz
  install -Dm644 $manpage.gz $startdir/pkg/usr/man/man7/autopano-sift.7.gz
  cd ..
  install -Dm644 src/util/autopanog/image-bottom-right.png $startdir/pkg/usr/share/pixmaps/autopano-sift.png
  install -Dm644 ../$pkgname.desktop $startdir/pkg/usr/share/applications/$pkgname.desktop
 # housecleaning
  rm -rf $startdir/pkg/weird
}
# vim: ft=sh ts=2 et
