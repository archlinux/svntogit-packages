# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=mkinitcpio
pkgver=0.5.18.1
pkgrel=1
pkgdesc="Advanced, modular initramfs image creation utility"
arch=(i686 x86_64)
url="http://www.archlinux.org/"
license=('GPL')
groups=('base')
depends=('klibc>=1.5-5' 'klibc-extras>=2.4' 'klibc-udev>=116-3'
         'gen-init-cpio' 'klibc-module-init-tools' 'coreutils'
         'bash' 'klibc-kbd')
#makedepends=('asciidoc')
source=(ftp://ftp.archlinux.org/other/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
backup=(etc/mkinitcpio.conf)
replaces=('mkinitrd' 'mkinitramfs')
md5sums=('6d6703a3e0d217ccf3226f991c8e3c1a')

build()
{
  cd $startdir/src/${pkgname}-${pkgver}
  ./install.sh $startdir/pkg
}
