# $Id$
# Contributor: Giovanni Scafora <linuxmania@gmail.com>
# Maintainer: Thomas Baechler <thomas@archlinux.org>

pkgname=microcode_ctl
# Version of the update tool
_toolver=1.17
# Version of the microcode image
_microcodever=20080401
pkgver=${_toolver}.${_microcodever}
pkgrel=1
pkgdesc="A companion to the IA32 microcode kernel driver"
arch=('i686' 'x86_64')
url="http://www.urbanmyth.org/microcode"
license=('GPL')
install=microcode_ctl.install
#depends=('kernel26>=2.6.20')
source=(http://www.urbanmyth.org/microcode/$pkgname-${_toolver}.tar.gz
        http://downloadmirror.intel.com/14303/eng/microcode-${_microcodever}.dat
        microcode
        microcode.rules)
md5sums=('98a7f06acef8459c8ef2a1b0fb86a99e'
         '0918e46d7912ebc40dd59e33e8e78547'
         'e694f32b7e30674786100b371ab50384'
         'e6f212fcb6af8c4f3464db2e9210655e')

build() {
  cd $startdir/src/$pkgname-${_toolver}
  make all || return 1
  make DESTDIR=$startdir/pkg PREFIX=/usr RCFILETO=/etc/rc.d RCFILE=../microcode RCFILEFINAL=microcode install || return 1
  install -D -m644 ../microcode.rules $startdir/pkg/etc/udev/rules.d/microcode.rules || return 1
  install -D -m644 ../microcode-${_microcodever}.dat $startdir/pkg/etc/microcode.dat
}
