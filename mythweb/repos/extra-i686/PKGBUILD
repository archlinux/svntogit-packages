# $Id$
# Maintainer: Juergen Hoetzel <juergen@archlinux.org> 
# Contributor: Philipp Giebel <arch@ambience-design.net>

pkgname=mythweb
pkgver=0.21
pkgrel=1
pkgdesc="Web interface for MythTV's backend"
arch=('i686' 'x86_64')
url="http://www.mythtv.org"
license=('GPL')
depends=("mythtv>=${pkgver}" 'apache' 'php')
install=mythweb.install
source=("http://www.mythtv.org/modules.php?name=Downloads&d_op=getit&lid=136&foo=/mythplugins-$pkgver.tar.bz2")
md5sums=('6c08043227bef1384858deee12b5cdc3')
groups=('mythtv-extras')

build() {
   mkdir -p $startdir/pkg/srv/www/mythweb/{image_cache,php_sessions}
   cp -r $startdir/src/mythplugins-$pkgver/$pkgname/* $startdir/pkg/srv/www/mythweb
   cp $startdir/src/mythplugins-$pkgver/$pkgname/data/.htaccess $startdir/pkg/srv/www/mythweb
   rm $startdir/pkg/srv/www/mythweb/README
   chown -R nobody:nobody $startdir/pkg/srv/www/mythweb
   chmod g+rw $startdir/pkg/srv/www/mythweb/{image_cache,php_sessions,data}
}


