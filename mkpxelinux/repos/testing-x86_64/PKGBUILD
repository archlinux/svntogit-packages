# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=mkpxelinux
pkgver=2008.03
pkgrel=1
pkgdesc="Advanced, modular network pxe boot image creation utility"
arch=(i686 x86_64)
url="http://www.archlinux.org/"
depends=('mkinitcpio' 'tftp-hpa' 'dhcp' 'syslinux')
source=('boot.msg' 'mkpxelinux' 'mkpxelinux.conf' 'options.msg')
backup=(etc/mkpxelinux.conf)

build()
{
  cd $startdir/src/
  install -D -m755 mkpxelinux $startdir/pkg/usr/sbin/mkpxelinux
  install -D -m644 mkpxelinux.conf $startdir/pkg/etc/mkpxelinux.conf
  install -D -m644 boot.msg $startdir/pkg/usr/share/mkpxelinux/boot.msg
  install -D -m644 options.msg $startdir/pkg/usr/share/mkpxelinux/options.msg
}
md5sums=('f4a30ab94fdc1974f4fbdfd7235ca512'
         '82fe26ac9a6ab16bf6b04aa1efc9f910'
         'f1e8fd8c8e2d0b75a33356823ca17d90'
         'fa078942b8adf261e4d925e080dc3018')
