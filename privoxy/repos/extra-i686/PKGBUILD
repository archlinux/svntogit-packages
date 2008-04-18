# $Id$
# Maintainer: Juergen Hoetzel <juergen@hoetzel.info>
# Contributor: basilburn (basilburn), Paul Bredbury (brebs) 

pkgname=privoxy
pkgver=3.0.8
pkgrel=3
pkgdesc="a web proxy with advanced filtering capabilities"
arch=(i686 x86_64)
url="http://www.privoxy.org"
license=('GPL')
depends=('pcre')
makedepends=('autoconf')
backup=(etc/privoxy/{config,trust,default.action,user.filter,default.filter} \
        etc/privoxy/{standard,user}.action etc/logrotate.d/privoxy)
source=(http://downloads.sourceforge.net/sourceforge/ijbswa/privoxy-$pkgver-stable-src.tar.gz privoxy \
        privoxy.logrotated \
        privoxy.confd)
md5sums=('252c0e085218fb930c4bc7563e9cedd9' '3c0f0c3ce941d74f40ddf0f858f7ba8d'\
         'a364c34c8dc6eb78c9a6b777237932de' 'c27cf5aaf0cf89825fd0f7a5a4ebd7c0')
install=privoxy.install

build() {
  GROUP_ID=42
  cd $startdir/src/privoxy-$pkgver-stable
  autoheader && autoconf
  ./configure --prefix=/usr --sysconfdir=/etc/privoxy --enable-zlib
  make || return 1
  make prefix=$startdir/pkg/usr MAN_DEST=$startdir/pkg/usr/share/man/man1 \
    GROUP=$GROUP_ID CONF_BASE=$startdir/pkg/etc/privoxy VAR_DEST=$startdir/pkg/var \
    install

  rm $startdir/pkg/var/log/privoxy/* # don't overwrite existing logfiles!
  install -D -m755 ../privoxy $startdir/pkg/etc/rc.d/privoxy
  install -D -m644 ../privoxy.logrotated $startdir/pkg/etc/logrotate.d/privoxy
  install -D -m644 ../privoxy.confd $startdir/pkg/etc/conf.d/privoxy
  # fix the config paths
  sed -i \
    -e 's|^confdir.*$|confdir /etc/privoxy|' \
    -e 's|^logdir.*$|logdir /var/log/privoxy|' \
    -e '/^user-manual/s/.*/#user-manual \/usr\/share\/doc\/privoxy\/user-manual\//' \
    $startdir/pkg/etc/privoxy/config

  # fix permissions
  chown -R $GROUP_ID:$GROUP_ID $startdir/pkg/etc/privoxy/
  find $startdir/pkg/etc/privoxy/ -type d | xargs chmod 770
  find $startdir/pkg/etc/privoxy/ -type f | xargs chmod 660
  chmod g+rwx,u+rwx,o-rwx $startdir/pkg/var/log/privoxy
  chgrp ${GROUP_ID} $startdir/pkg/var/log/privoxy/
}
