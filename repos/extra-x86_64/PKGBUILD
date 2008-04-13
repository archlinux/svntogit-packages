# $Id: PKGBUILD,v 1.36 2008/03/03 02:47:17 eric Exp $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=rsync
pkgver=3.0.2
pkgrel=1
pkgdesc="A file transfer program to keep remote files in sync"
arch=('i686' 'x86_64')
url="http://samba.anu.edu.au/rsync/"
license=('GPL3')
depends=('acl')
backup=('etc/rsyncd.conf' 'etc/xinetd.d/rsync')
source=(http://rsync.samba.org/ftp/rsync/${pkgname}-${pkgver}.tar.gz \
        rsyncd.conf rsyncd rsync.xinetd)
md5sums=('fd4c5d77d8cb7bb86ab209076fa214d9' '4395c0591638349b1a7aeaaa4da1f03a'\
         '9de4d03d49f4b5c73ffd67d452716a49' 'ea3e9277dc908bc51f9eddc0f6b935c1')
sha1sums=('0d1e69c28ee57a6cca6b9a52b18c7fb835ca7a2e'
          '48be09294134dfed888818872fe552a59c29147a'
          'ebec275bbd0c11692c91dc59368349601bd9eaf4'
          'fdb99785bc87ee13d77aa90dc1804f3f75dd7fc1')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./prepare-source || return 1
  ./configure --prefix=/usr --with-included-popt \
              --enable-acl-support --enable-xattr-support
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m 755 ../rsyncd ${startdir}/pkg/etc/rc.d/rsyncd
  install -D -m 644 ../rsyncd.conf ${startdir}/pkg/etc/rsyncd.conf
  install -D -m 644 ../rsync.xinetd ${startdir}/pkg/etc/xinetd.d/rsync
}
