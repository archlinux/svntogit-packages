# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=krb5
_pkgvermajor=1.15
pkgver=${_pkgvermajor}.1
pkgrel=1
pkgdesc='The Kerberos network authentication system'
url='https://web.mit.edu/kerberos/'
arch=('i686' 'x86_64')
license=('custom')
depends=('e2fsprogs' 'libldap' 'keyutils')
makedepends=('perl')
backup=('etc/krb5.conf' 'var/lib/krb5kdc/kdc.conf')
options=('!emptydirs')
source=(https://web.mit.edu/kerberos/dist/krb5/${_pkgvermajor}/${pkgname}-${pkgver}.tar.gz{,.asc}
        krb5-config_LDFLAGS.patch
        krb5-kadmind.service
        krb5-kdc.service
        krb5-kpropd.service
        krb5-kpropd@.service
        krb5-kpropd.socket)
sha512sums=('068b4c012722d8c232049d2a617f7ee28ceeaba6be94a78439e69e37b66cfdc49085641e42cfb03b2fbb72d21517b537e437061ec4dd2bf864f31e55e05fe918'
            'SKIP'
            '5a3782ff17b383f8cd0415fd13538ab56afd788130d6ad640e9f2682b7deaae7f25713ce358058ed771091040dccf62a3bc87e6fd473d505ec189a95debcc801'
            'ae1fa980e8e30a83dfef7fe233be70a9ec530ebaffc344a0e7eba61e7de4c800421b45cf203f1e526cc8351754038d6539184b30aa049a567e2a9e80f0d39841'
            'b137ff0154f9af4891e9e78cec692af47ecfd92ca9ce6e00b40ef137d942ba04e8caf483fc5d464b9559ad4a5c4e75ec57b6eab7fc35181115ca1606c0b316c1'
            'b57bbe55c19c92a04cd3e8ad569adcc5aedd4246075b2e6dbcc363e523853332a3e7650be85098b91e495799f8b728ea550495ab303f46ccd9298a2260120b2f'
            'a31ed42e988fed892dd3f1ca1942c3cd4bf391d894c9cebe5e91f52797392261e129727590ae06e2f727bb7b0f8d73a7aa35e8b983d6bad77f22a099091ee944'
            '4e7ae175425e0787a1d5ff959471a88bf5af4cd6e213dc6d4048902fab7547c1186a082370b523f9549f5096acfab1fb03b4839e42bd80dc539130ae4bb3ea55')
validpgpkeys=('2C732B1C0DBEF678AB3AF606A32F17FD0055C305'  # Tom Yu <tlyu@mit.edu>
              'C4493CB739F4A89F9852CBC20CBA08575F8372DF') # Greg Hudson <ghudson@mit.edu>

prepare() {
  cd ${pkgname}-${pkgver}

  # cf https://bugs.gentoo.org/show_bug.cgi?id=448778
  patch -p1 < "${srcdir}"/krb5-config_LDFLAGS.patch

  # FS#25384
  sed -i "/KRB5ROOT=/s/\/local//" src/util/ac_check_krb5.m4
}

build() {
   cd ${pkgname}-${pkgver}/src
   export CFLAGS+=" -fPIC -fno-strict-aliasing -fstack-protector-all"
   export CPPFLAGS+=" -I/usr/include/et"
   ./configure --prefix=/usr \
               --sbindir=/usr/bin \
               --sysconfdir=/etc \
               --localstatedir=/var/lib \
               --enable-shared \
               --with-system-et \
               --with-system-ss \
               --disable-rpath \
               --without-tcl \
               --enable-dns-for-realm \
               --with-ldap \
               --without-system-verto
   make
}

package() {
   cd ${pkgname}-${pkgver}/src
   make DESTDIR="${pkgdir}" EXAMPLEDIR=/usr/share/doc/${pkgname}/examples install

   # Fix FS#29889
   install -m 644 plugins/kdb/ldap/libkdb_ldap/kerberos.{ldif,schema} \
     "${pkgdir}/usr/share/doc/${pkgname}/examples"

   install -Dpm 644 config-files/krb5.conf -t "${pkgdir}/etc"
   install -Dpm 644 config-files/kdc.conf -t "${pkgdir}/var/lib/krb5kdc"

   install -Dm 644 util/ac_check_krb5.m4 -t "${pkgdir}/usr/share/aclocal"

   install -Dm 644 "${srcdir}"/${pkgname}-${pkgver}/NOTICE \
     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

   # systemd stuff
   install -Dm 644 "${srcdir}"/krb5-{kadmind.service,kdc.service,kpropd.service,kpropd@.service,kpropd.socket} \
      -t "${pkgdir}/usr/lib/systemd/system"
}

# vim: ts=2 sw=2 et:
