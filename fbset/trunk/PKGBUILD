# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Paul Mattal <pjmattal@elys.com>

pkgname=fbset
pkgver=2.1
pkgrel=2
pkgdesc="Framebuffer setup util"
arch=(i686 x86_64)
url="http://users.telenet.be/geertu/Linux/fbdev/"
license=('GPL')
depends=('glibc')
backup=(etc/fb.modes)
source=(http://users.telenet.be/geertu/Linux/fbdev/fbset-$pkgver.tar.gz)
md5sums=('e547cfcbb8c1a4f2a6b8ba4acb8b7164')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  install -D -m755 fbset $startdir/pkg/usr/sbin/fbset
  install -D -m644 fbset.8 $startdir/pkg/usr/man/man8/fbset.8
  install -D -m644 fb.modes.5 $startdir/pkg/usr/man/man5/fb.modes.5
  install -D -m644 etc/fb.modes.ATI $startdir/pkg/etc/fb.modes
}
