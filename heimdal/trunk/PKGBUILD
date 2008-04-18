# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

#
### Attention: build it 2 times - it links against itself! ###
#   ^ better remove old pkg before ;)

pkgname=heimdal
pkgver=1.0.1
pkgrel=2
pkgdesc="Heimdal Kerberos V5 libraries"
arch=(i686 x86_64)
url="http://www.pdc.kth.se/heimdal/"
depends=('db>=4.6' 'openssl' 'e2fsprogs')
options=('!libtool' '!emptydirs')
backup=(etc/krb5.conf)
source=(ftp://ftp.pdc.kth.se/pub/heimdal/src/heimdal-$pkgver.tar.gz \
	002_all_heimdal-no_libedit.patch \
	003_all_heimdal-fPIC.patch \
	004_all_heimdal-rxapps.patch \
	006_all_heimdal-suid_fix.patch \
	heimdal-kdc.rc \
	kadmind.rc \
	kpasswd.rc)
md5sums=('498e24f52b4f2e658e31f728a1279769'
         '1199c4a4a38e9c2b2c0a99bd5781767a'
         '3d0262aa218e1611500de735d3581e28'
         '0fe81cb1e33b2a2e60edaf47dfdfe4de'
         '30372b1581e4d49a76688e450fd42443'
         'e59650992b9541a30dfce727a194f6e0'
         '1f2f86a67bbfddb7af581d35fdca9627'
         'f8f1eca95b9d3f2b4ebf2417b71b81cf')

build() {
  [ -e /usr/lib/libasn1.so ] && echo "## remove old heimdal pkg first ##" && return 1

  cd ${startdir}/src/heimdal-${pkgver}
  patch -Np0 -i ${startdir}/src/002_all_heimdal-no_libedit.patch || return 1
  patch -Np0 -i ${startdir}/src/003_all_heimdal-fPIC.patch || return 1
  patch -Np0 -i ${startdir}/src/004_all_heimdal-rxapps.patch || return 1
  patch -Np0 -i ${startdir}/src/006_all_heimdal-suid_fix.patch || return 1
  
  libtoolize -f -c || return 1
  aclocal -I cf || return 1  
  autoheader || return 1
  automake -a || return 1
  autoconf || return 1
  libtoolize -f -c || return 1
  sed -i -e 's|var/heimdal|var/lib/heimdal|g' configure.in configure \
	doc/setup.texi doc/heimdal.info kadmin/kadmind.8 kdc/kdc.8 \
	lib/hdb/hdb.h lib/krb5/krb5.conf.5 lib/krb5/krb5.conf.cat5

  ./configure --prefix=/usr --enable-shared=yes --without-x \
	--sysconfdir=/etc  --mandir=/usr/man \
	--datadir=/var/lib/heimdal \
	--localstatedir=/var/lib/heimdal \
	--with-openssl=/usr \
	--with-readline-lib=/usr/lib \
	--with-readline-include=/usr/include/readline \
	--libexecdir=/usr/sbin --with-berkeley-db \
	--disable-krb4
	
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  for i in telnetd ftpd rshd; do
    mv ${startdir}/pkg/usr/man/man8/${i}.8 ${startdir}/pkg/usr/man/man8/k${i}.8
    mv ${startdir}/pkg/usr/sbin/${i} ${startdir}/pkg/usr/sbin/k${i}
  done
  
  for i in rcp rsh telnet ftp su login; do
    if [ -f ${startdir}/pkg/usr/man/man1/${i}.1 ]; then
      mv ${startdir}/pkg/usr/man/man1/${i}.1 ${startdir}/pkg/usr/man/man1/k${i}.1
    fi
    mv ${startdir}/pkg/usr/bin/${i} ${startdir}/pkg/usr/bin/k${i}
  done
  rm -rf ${startdir}/pkg/usr/man/cat{1,3,5,8}
  
  #Arch could be a KDC too
  mkdir -p ${startdir}/pkg/etc/rc.d
  install -m644 ${startdir}/src/heimdal-${pkgver}/krb5.conf ${startdir}/pkg/etc
  for i in heimdal-kdc kadmind kpasswd; do
    install -m755 ${startdir}/src/${i}.rc ${startdir}/pkg/etc/rc.d/${i}
  done

  #Remove some conflicts 
  rm ${startdir}/pkg/usr/man/man5/ftpusers.5*
  rm ${startdir}/pkg/usr/man/man5/login.access.5*
  # and some more
  rm ${startdir}/pkg/usr/bin/mk_cmds
  rm ${startdir}/pkg/usr/include/ss/ss.h
  rm ${startdir}/pkg/usr/lib/libss.a
  rm ${startdir}/pkg/usr/lib/libss.so
}
