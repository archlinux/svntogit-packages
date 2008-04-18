# $Id$
# Maintainer: Paul Mattal <paul@archlinux.org>
pkgname=hylafax
pkgver=4.4.4
pkgrel=1
pkgdesc="Fax Server"
arch=('i686' 'x86_64')
install='hylafax.install'
license=('custom')
depends=('libtiff' 'pam' 'ghostscript')
makedepends=('smtp-server')
url="http://www.hylafax.org/"
backup=(var/spool/hylafax/bin/{faxrcvd,notify} \
	usr/lib/fax/{faxcover.ps,hfaxd.conf,pagesizes,typerules} \
	var/spool/hylafax/etc/hosts.hfaxd) 
source=(ftp://ftp.hylafax.org/source/${pkgname}-${pkgver}.tar.gz hylafax \
        hylafax.cron.daily config.local)
md5sums=('4beb3d438ca6c4f00f1d94f9643e6668' '9b6700132ca65b0d5df91b585f18b9a5'\
         '52beffe7dc296b4f9ce9fd0387f7804e' '67f19b7e06602aa27d6d4d96ddbd54b9')

# build as root for successful build!
build() {
  uucp_created=0
  if ! grep 'uucp' /etc/passwd > /dev/null; then
    uucp_created=1
    groupadd -g 14 uucp &>/dev/null
    useradd -u 10 -g uucp -d '/' -s /bin/false uucp &>/dev/null
    useradd -u 69 -g daemon -d '/' -s /bin/false fax &>/dev/null
  fi
  mkdir -p $startdir/pkg/usr/{bin,lib/fax,man,sbin,share/ghostscript/fonts} \
  	|| return 1
  mkdir -p $startdir/pkg/var/{spool/hylafax,lock} || return 1
  mkdir -p $startdir/pkg/home/httpd/hylafax || return 1
  cd $startdir/src/${pkgname}-${pkgver} || return 1

  cp ../config.local . || return 1
  ./configure --nointeractive --with-OPTIMIZER="${CFLAGS}" || return 1
  make -j 1 || return 1
  make ROOT=$startdir/pkg install || return 1
  install -D -m 755 $startdir/src/hylafax $startdir/pkg/etc/rc.d/hylafax \
  	|| return 1
  install -D -m 744 $startdir/src/hylafax.cron.daily \
  	$startdir/pkg/etc/cron.daily/hylafax || return 1
  # remove group if created
  if [ $uucp_created -eq 1 ]; then
    userdel uucp &>/dev/null
    groupdel uucp &>/dev/null
    userdel fax &>/dev/null
  fi
  # add missing awk file for notify-4.1 script
  install -D -m 755 $startdir/src/${pkgname}-${pkgver}/util/notify.awk \
  	$startdir/pkg/var/spool/hylafax/bin/notify.awk || return 1

  install -D -m644 COPYRIGHT $startdir/pkg/usr/share/licenses/$pkgname/COPYRIGHT
}
