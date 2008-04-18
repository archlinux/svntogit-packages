# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=hwdetect
pkgver=0.9
pkgrel=1
pkgdesc="Hardware detection script with loading modules and mkinitcpio.conf / rc.conf support"
arch=(i686 x86_64)
license=('custom:none')
groups=('base')
backup=()
depends=('sh' 'awk' 'grep' 'coreutils' 'sed')
source=(hwdetect)
md5sums=('bae2a26062c1ae8036b3a2173c8e3b51')

build() {
  install -D -m 755 $startdir/src/hwdetect $startdir/pkg/sbin/hwdetect
}

