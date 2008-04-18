# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=cx_freeze
pkgver=3.0.3
pkgrel=4
pkgdesc="A set of utilities for freezing Python scripts into executables"
arch=('i686' 'x86_64')
url="http://www.python.net/crew/atuining/cx_Freeze/"
license=('custom')
depends=('python')
source=(http://downloads.sourceforge.net/sourceforge/cx-freeze/cx_Freeze-$pkgver-source.tgz FreezePython.sh)
md5sums=('8a8d99b020a7b650fb8f1f64f096c2cd' '5cc60d1644eba12a57c22cc1348a4afd')
sha1sums=('63dc3afa5a05d31d616ce7441efb5cae3df574b3' '4c581fafbbdf63f136ffdf2da5e2ad04525647cb')

build() {
  cd $startdir/src/cx_Freeze-$pkgver
  python MakeFrozenBases.py
  python FreezePython.py     --no-copy-deps FreezePython.py || return 1

  install -d $startdir/pkg/usr/share/cx-freeze/{bases,initscripts}
  install -m755 FreezePython $startdir/pkg/usr/share/cx-freeze/
  install -m755 bases/* $startdir/pkg/usr/share/cx-freeze/bases
  install -m644 initscripts/* $startdir/pkg/usr/share/cx-freeze/initscripts
  install -D -m644 LICENSE.txt $startdir/pkg/usr/share/licenses/cx_freeze/COPYING
  install -D -m755 ../FreezePython.sh $startdir/pkg/usr/bin/FreezePython
}
