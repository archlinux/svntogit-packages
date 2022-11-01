# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=krb5
_pkgvermajor=1.20
pkgver=1.20
pkgrel=2
pkgdesc='The Kerberos network authentication system'
url='https://web.mit.edu/kerberos/'
arch=('x86_64')
license=('custom')
depends=('glibc' 'e2fsprogs' 'libldap' 'keyutils' 'libverto-module-base'
         libkeyutils.so libss.so libcom_err.so libverto.so)
makedepends=('perl')
provides=(
  libgssapi_krb5.so
  libgssrpc.so
  libk5crypto.so
  libkadm5clnt_mit.so
  libkadm5srv_mit.so
  libkdb5.so
  libkdb_ldap.so
  libkrad.so
  libkrb5.so
  libkrb5support.so
)
backup=(
  'etc/krb5.conf'
  'var/lib/krb5kdc/kdc.conf'
)
options=('!emptydirs')
source=(https://web.mit.edu/kerberos/dist/krb5/${_pkgvermajor}/${pkgname}-${pkgver}.tar.gz{,.asc}
        0001-krb5-config_LDFLAGS.patch::https://github.com/krb5/krb5/commit/0bfd22feb6493f34fdc894daaf680c3a2f2e7784.patch
        krb5-kadmind.service
        krb5-kdc.service
        krb5-kpropd.service
        krb5-kpropd@.service
        krb5-kpropd.socket)
sha512sums=('9aed84a971a4d74188468870260087ec7c3a614cceb5fe32ad7da1cb8db3d66e00df801c9f900f0131ac56eb828674b8be93df474c2d13b892b70c7977388604'
            'SKIP'
            '5debf9dd2d0da84ff6a9e18887fc1bbd0530cc131ac2292ea725f89da8cc84c4b864ebbd1c92eff11d63b98643bff910da3dda40ddc9e1c43f4ce7bd2b6f54dd'
            'ae1fa980e8e30a83dfef7fe233be70a9ec530ebaffc344a0e7eba61e7de4c800421b45cf203f1e526cc8351754038d6539184b30aa049a567e2a9e80f0d39841'
            'b137ff0154f9af4891e9e78cec692af47ecfd92ca9ce6e00b40ef137d942ba04e8caf483fc5d464b9559ad4a5c4e75ec57b6eab7fc35181115ca1606c0b316c1'
            'b57bbe55c19c92a04cd3e8ad569adcc5aedd4246075b2e6dbcc363e523853332a3e7650be85098b91e495799f8b728ea550495ab303f46ccd9298a2260120b2f'
            'a31ed42e988fed892dd3f1ca1942c3cd4bf391d894c9cebe5e91f52797392261e129727590ae06e2f727bb7b0f8d73a7aa35e8b983d6bad77f22a099091ee944'
            '4e7ae175425e0787a1d5ff959471a88bf5af4cd6e213dc6d4048902fab7547c1186a082370b523f9549f5096acfab1fb03b4839e42bd80dc539130ae4bb3ea55')
validpgpkeys=('2C732B1C0DBEF678AB3AF606A32F17FD0055C305'  # Tom Yu <tlyu@mit.edu>
              'C4493CB739F4A89F9852CBC20CBA08575F8372DF') # Greg Hudson <ghudson@mit.edu>

prepare() {
  cd ${pkgname}-${pkgver}

  # https://github.com/krb5/krb5/commit/0bfd22feb6493f34fdc894daaf680c3a2f2e7784
  # https://krbdev.mit.edu/rt/Ticket/Display.html?id=9057
  patch -Np1 < "${srcdir}"/0001-krb5-config_LDFLAGS.patch

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
               --with-system-verto
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
