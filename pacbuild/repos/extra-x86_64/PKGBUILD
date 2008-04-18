# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
pkgname=pacbuild
pkgver=0.4
pkgrel=1
pkgdesc="A distributed build management system"
arch=(i686 x86_64)
url="http://groups.google.com/group/pacbuild"
license="GPL"
depends=('python' 'snarf' 'python-sqlobject' 'python-pysqlite')
backup=('etc/appleConfig.py' 'etc/strawberryConfig.py' 'etc/mkchroot.conf')
source=(http://projects.xennet.org/pacbuild/$pkgname-$pkgver.tar.gz)
md5sums=('e224db17c2c492fb65f02d5d33ab7457')
sha1sums=('040117e6829618e271f29f1b6f11340c49930fa1')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --root $startdir/pkg
  touch $startdir/pkg/etc/appleConfig.pyc
  touch $startdir/pkg/etc/strawberryConfig.pyc
  mkdir -p $startdir/pkg/etc/rc.d
  install -m 755 apple.rcd $startdir/pkg/etc/rc.d/apple
  install -m 755 strawberry.rcd $startdir/pkg/etc/rc.d/strawberry
}
