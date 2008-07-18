# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=mkbootcd
pkgver=2008.03
pkgrel=1
pkgdesc="Advanced, modular isolinux bootcd image creation utility"
arch=(i686 x86_64)
license=('GPL')
url="http://www.archlinux.org/"
depends=('mkinitcpio' 'cdrkit' 'syslinux')
source=('boot.msg' 'mkbootcd' 'mkbootcd.conf' 'options.msg')
backup=(etc/mkbootcd.conf)

build()
{
  cd $startdir/src/
  install -D -m755 mkbootcd $startdir/pkg/usr/sbin/mkbootcd
  install -D -m644 mkbootcd.conf $startdir/pkg/etc/mkbootcd.conf
  install -D -m644 boot.msg $startdir/pkg/usr/share/mkbootcd/boot.msg
  install -D -m644 options.msg $startdir/pkg/usr/share/mkbootcd/options.msg
}
md5sums=('d02e111f81204044644f728ff85e2284'
         'c2b957d5431ba10f01c708e2b7b15d74'
         'e08b9b952b5e468feb16e3f20ee3faf2'
         'fa078942b8adf261e4d925e080dc3018')
