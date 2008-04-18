# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=iputils
pkgver=20070202
_traceroutever=1.4a12
pkgrel=4
pkgdesc="IP Configuration Utilities (and Ping)"
arch=(i686 x86_64)
license=('GPL')
url="ftp://ftp.inr.ac.ru/ip-routing/"
groups=('base')
depends=('glibc')
makedepends=('jade')
conflicts=('netkit-base' 'arping' 'netkit-tftpd' 'traceroute')
replaces=('netkit-base' 'traceroute')
source=(http://www.skbuff.net/iputils/$pkgname-s$pkgver.tar.bz2
        ftp://ftp.ee.lbl.gov/traceroute-$_traceroutever.tar.gz
	iputils-20070202-no-open-max.patch)
options=(!makeflags)
md5sums=('1d38fb3cfc2b71496e43cf646bfc1d6e'
         '964d599ef696efccdeebe7721cd4828d'
	 'a2cbc0174dd883f68297aa7f3e7c4f5c')

build()
{
  #build iptuils
  cd $startdir/src/$pkgname-s$pkgver
  patch -Np1 -i ../iputils-20070202-no-open-max.patch || return 1
  make KERNEL_INCLUDE=/usr/include || return 1   # for i686
  for i in arping clockdiff rarpd rdisc tftpd tracepath tracepath6; do
    install -D -m755 $i $startdir/pkg/usr/sbin/$i
  done
  for i in ping ping6 traceroute6; do
    install -D -m4755 $i $startdir/pkg/bin/$i
  done

  msg ":: building docs"
  # good god, these docs are a pain
  # special thanks to  Michael(tm) Smith <mike@w3.org> - http://people.w3.org/mike/
  # from #docbook on freenode.org for figuring this out
  cd doc
  for file in *.sgml; do
      xf=${file/.sgml/.xml}
      sx -xlower -xno-nl-in-tag $file > $xf
      sed -i "s|<refname>\(.*\), \(.*\)</refname>|<refname>\1</refname>, <refname>\2</refname>|g" $xf
      xsltproc /usr/share/xml/docbook/xsl-stylesheets-1.73.1/manpages/docbook.xsl $xf
  done

  mkdir -p $startdir/pkg/usr/man/man8
  install -m644 arping.8 clockdiff.8 ping.8 ping6.8 rarpd.8 rdisc.8 \
                    tftpd.8 tracepath.8 tracepath6.8 traceroute6 \
                    $startdir/pkg/usr/man/man8/
  #make man
  #for i in arping clockdiff ping rarpd rdisc tftpd tracepath traceroute6; do
  #  install -D -m644 $i.8 $startdir/pkg/usr/man/man8/$i.8
  #done

  # build traceroute
  # this is combined in this package because it's awkward as a separate package
  cd ${startdir}/src/traceroute-$_traceroutever
  ./configure --prefix=/usr --sbindir=/bin
  #if [ "${CARCH}" = "x86_64" ]; then
    make CFLAGS="${CFLAGS} -Ilinux-include/" || return 1
  #else
  #  make || return 1
  #fi
  make DESTDIR=${startdir}/pkg install install-man

  chmod 4775 ${startdir}/pkg/bin/traceroute
}

