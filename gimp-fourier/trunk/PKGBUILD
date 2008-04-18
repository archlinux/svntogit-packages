# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=gimp-fourier
pkgver=0.3.1
pkgrel=1
pkgdesc="A GIMP Plug-In for fourier transformation"
arch=(i686 x86_64)
license=('GPL2') # asked the author - reply on 2007-11-07
url="http://people.via.ecp.fr/~remi/soft/gimp/gimp_plugin_en.php3"
depends=('fftw')
groups=('gimp-plugins')
source=("http://people.via.ecp.fr/~remi/soft/gimp/fourier-$pkgver.tar.gz")

build() {
  cd $startdir/src/fourier-$pkgver
    #cleanup: remove already provided binary:
    rm fourier
    make GIMPTOOL=gimptool-2.0 || return 1
    mkdir -p $startdir/pkg/usr/lib/gimp/2.0/plug-ins/
    install -c fourier $startdir/pkg/usr/lib/gimp/2.0/plug-ins/
}
md5sums=('a0c731df3927a997065082ed2b337fe0')
