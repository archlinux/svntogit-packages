# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=logrotate
pkgver=3.7.5
pkgrel=1
pkgdesc="Rotates system logs automatically"
url='http://rhlinux.redhat.com'
arch=(i686 x86_64)
license=('GPL')
groups=('base')
depends=('popt' 'cron' 'gzip')
backup=('etc/logrotate.conf')

# The source is apparently a CVS checkout only. Create the tarball like so:
# cvs -d :pserver:anonymous@rhlinux.redhat.com:/usr/local/CVS co logrotate
# cd logrotate/
# make create-archive
# Ensure this tarball is places in other/logrotate/

source=(ftp://ftp.archlinux.org/other/logrotate/${pkgname}-${pkgver}.tar.gz
        logrotate.conf logrotate.cron.daily)
md5sums=('a1a3ea2f1d80e67e902c024bbdef616a'
         'c8b915903825befc401797b7620f249e'
         '8e23d5d4cc29b1e055b24df87e355cdc')

build() {
  cd $startdir/src/${pkgname}-${pkgver}

  sed -i 's|#define DEFAULT_MAIL_COMMAND .*|#define DEFAULT_MAIL_COMMAND "/usr/bin/mail"|'\
    config.h
  make || return 1
  make PREFIX=$startdir/pkg install
  install -D -m644 ../logrotate.conf $startdir/pkg/etc/logrotate.conf
  install -D -m744 ../logrotate.cron.daily $startdir/pkg/etc/cron.daily/logrotate
}
