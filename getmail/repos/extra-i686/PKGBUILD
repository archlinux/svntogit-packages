# $Id$
# Maintainer: simo <simo@archlinux.org>
# Committer: Manolis Tzanidakis <manolis@archlinux.org>

pkgname=getmail
pkgver=4.7.7
pkgrel=1
pkgdesc="A POP3 mail retriever with reliable Maildir and command delivery."
arch=(i686 x86_64)
url="http://pyropus.ca/software/getmail"
license="GPL"
depends=('python>=2.4')
source=(http://pyropus.ca/software/getmail/old-versions/$pkgname-$pkgver.tar.gz)
md5sums=('d6252e8ebe89fb17baaeb9acba707e39')

build() {
  cd $startdir/src/$pkgname-$pkgver
  /usr/bin/python setup.py build || return 1
  /usr/bin/python setup.py install --root=$startdir/pkg
}
