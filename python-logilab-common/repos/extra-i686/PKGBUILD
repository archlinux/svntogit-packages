# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=python-logilab-common
pkgver=0.28.0
pkgrel=1
pkgdesc="Useful miscellaneous modules used by Logilab projects"
arch=('i686' 'x86_64')
url="http://www.logilab.org/project/logilab-common"
license=('LGPL')
depends=('python-egenix-mx-base')
source=(ftp://ftp.logilab.fr/pub/common/logilab-common-$pkgver.tar.gz)
md5sums=('83f4f83607175237fcb580120979458d')
sha1sums=('e197cc1929dbf20f20693180555233c71dfa308a')

build() {
  cd $startdir/src/logilab-common-$pkgver
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
