# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
#Contributed: eliott <eliott@solarblue.net>, Andre Naumann <anaumann@SPARCed.org> 
pkgname=nxclient
pkgver=3.1.0.2
pkgrel=1
pkgdesc="Nomachine's nxclient for nx servers"
arch=(i686 x86_64)
url="http://nomachine.com"
makedepends=('rpmextract')
license=('custom:nomachine')
depends=('cups' 'libcups' 'nx-common' 'libxext' 'libxft')
[ "$CARCH" = "x86_64" ] && source=(http://64.34.161.181/download/3.1.0/Linux/$pkgname-3.1.0-2.x86_64.rpm nomachine.key)
[ "$CARCH" = "x86_64" ] && md5sums=('4c08a8df7aeee2fb475ebb670f3129e4'
         'cb5df74aff5160eab9cd4313019ae228')
[ "$CARCH" = "i686" ] && source=(http://64.34.161.181/download/3.1.0/Linux/$pkgname-3.1.0-2.i386.rpm nomachine.key)
[ "$CARCH" = "i686" ] &&  md5sums=('9f6794416717d1e2e1c031d44adc14ae'
         'cb5df74aff5160eab9cd4313019ae228')
install=nxclient.install

build() {
  cd $startdir/src
  rpmextract.sh *.rpm
  rm usr/NX/bin/nxssh usr/NX/bin/nxesd
  rm -r usr/NX/lib
  rm usr/NX/share/keys/server.id_dsa.key
  sed -i -e 's,/usr/NX,/opt/NX,g' etc/profile.d/nx.sh etc/profile.d/nx.csh
  sed -i -e 's,/usr/NX/,/opt/NX/,g' $startdir/src/usr/NX/share/applnk/network/*.desktop
  #sed -i -e 's,/bin/nxclient,/bin/nxclient-nomachine,g' $startdir/src/usr/NX/share/applnk/network/*.desktop

  install -D -m 755 $startdir/src/etc/profile.d/nx.sh $startdir/pkg/etc/profile.d/nx.sh 
  install -D -m 755 $startdir/src/etc/profile.d/nx.csh $startdir/pkg/etc/profile.d/nx.csh 
  install -D -m 644 $startdir/src/usr/NX/share/applnk/network/nxclient-wizard.desktop $startdir/pkg/usr/share/applications/nxclient-wizard.desktop
  install -D -m 644 $startdir/src/usr/NX/share/applnk/network/nxclient.desktop $startdir/pkg/usr/share/applications/nxclient.desktop
  install -D -m 644 $startdir/src/usr/NX/share/applnk/network/nxclient-admin.desktop $startdir/pkg/usr/share/applications/nxclient-admin.desktop
  rm -r $startdir/src/usr/NX/share/applnk
  cd usr
  mkdir -p $startdir/pkg/opt
  mv NX $startdir/pkg/opt
  # add default key file
  install -D -m 644 $startdir/src/nomachine.key $startdir/pkg/opt/NX/share/keys/server.id_dsa.key
  #mv $startdir/pkg/opt/NX/bin/nxclient $startdir/pkg/opt/NX/bin/nxclient-nomachine
  # add license file
  mkdir -p $startdir/pkg/usr/share/licenses/nxclient
  mv $startdir/pkg/opt/NX/share/documents/client/license-info $startdir/pkg/usr/share/licenses/nxclient/LICENSE
}
