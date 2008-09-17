# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=mksyslinux
pkgver=2008.03
pkgrel=1
pkgdesc="Advanced, modular syslinux boot image creation utility"
arch=(i686 x86_64)
license=('GPL')
url="http://www.archlinux.org/"
depends=('mkinitcpio' 'syslinux')
source=('boot.msg' 'mksyslinux' 'mksyslinux.conf' 'options.msg')
backup=(etc/mksyslinux.conf)

build()
{
  cd $startdir/src/
  install -D -m755 mksyslinux $startdir/pkg/usr/sbin/mksyslinux
  install -D -m644 mksyslinux.conf $startdir/pkg/etc/mksyslinux.conf
  install -D -m644 boot.msg $startdir/pkg/usr/share/mksyslinux/boot.msg
  install -D -m644 options.msg  $startdir/pkg/usr/share/mksyslinux/options.msg
}
md5sums=('6a269fc5b58c7bcc6688efeaa2075606'
         '748763a29e29cb0570d108f8700ebcd4'
         'a393348c07bccabcd52b4d8c5d4d42a7'
         'fa078942b8adf261e4d925e080dc3018')
