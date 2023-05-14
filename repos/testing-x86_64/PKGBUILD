# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Dan McGee <dan@archlinux.org>

pkgbase=postgresql
pkgname=('postgresql-libs' 'postgresql-docs' 'postgresql')
pkgver=15.3
_majorver=${pkgver%.*}
pkgrel=1
pkgdesc='Sophisticated object-relational DBMS'
url='https://www.postgresql.org/'
arch=('x86_64')
license=('custom:PostgreSQL')
makedepends=('krb5' 'libxml2' 'python' 'perl' 'tcl>=8.6.0' 'openssl>=1.0.0'
             'pam' 'zlib' 'icu' 'systemd' 'libldap' 'llvm' 'clang' 'libxslt'
             'util-linux')
source=(https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        postgresql-run-socket.patch
        postgresql-perl-rpath.patch
        postgresql.pam
        postgresql.logrotate
        postgresql.service
        postgresql-check-db-dir
        postgresql.sysusers
        postgresql.tmpfiles)
md5sums=('7cb75773ff8fbe533701562c3278206b'
         '14674b7e9a224975ea70e19359682142'
         '297acc9145b94143e74c93f5ede34856'
         '96f82c38f3f540b53f3e5144900acf17'
         'd28e443f9f65a5712c52018b84e27137'
         '0418d1b78f15b969c1575657d47ab130'
         '7ac75a6797737ef3e628c0278aaae024'
         '2050d34e4dfa05f3c6fe4cd7615eaa4b'
         '02d017978f0bba21f455feceb3f0a45a')
sha256sums=('ffc7d4891f00ffbf5c3f4eab7fbbced8460b8c0ee63c5a5167133b9e6599d932'
            '1c3f7ba96400cf5064093f8a839df9076eaa064df020e6ec9c5e7ab8b6d527c6'
            'aee0792a7e0490810aa1e15dbfd5b45842780d864de6971926b362242b8d7cf0'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e'
            '25fb140b90345828dc01a4f286345757e700a47178bab03d217a7a5a79105b57'
            'a5d5fe94da6df6e9824db1dba7ad3bb85761f1356e627784fecec7caae0a87f0'
            '7fa8f0ef3f9d40abd4749cc327c2f52478cb6dfb6e2405bd0279c95e9ff99f12'
            '4a4c0bb9ceb156cc47e9446d8393d1f72b4fe9ea1d39ba17213359df9211da57')
b2sums=('4d2e79a9cb21faf47be963e31b1a8ccc9ae205b5836dfbf8ea426229a31dc63f40cd0280108abfa0553affe692c42137f7ad4e3bd1d269298689fee82c5dbb89'
        'd7a9d4d8281c5cdf642b5d6f7ebb03bdde00afc520bee4cac9fd18a2c25e4bc0aa59f3c3c9f44c257860e2560d126646f2ba81693f966fe93eb4e041adbb0b88'
        '5d94b9565506a0ee1029595ff36e0052727174a9bab2a878a33985031b855c6052f579abdab242dad3a265d07203d800305a795b0827f2b3a4171f2a49c80a17'
        '3eab84d332d96678fe6e435ee243c8f1a82b838f601d61d3604d11e918aed7a62202edca5e476c4b9031ed284570e6fcd6c659cfdbd9624aa0019d3233755f81'
        '2209b7550acad7955102ec6922754b4046b2a2ad2a7e1cfb2cc4053c0705abac7aa7d7968eab617f50894797d06345f51c9a669926bd2a77dcf688206a2027e0'
        'a4255df47b7ac1418d20aa73aa0f6e70c7952a10d706e5523043c48b2c3b6d8e39838049dfcc826913cd0f2c06502561d1abe8b19cce7071db66139ae93a37bf'
        '1452d612f396d08ba1af33331541dd475826ca0f8fedc15ff8f155ba7afe891a8a3d4fd69336e003ff8d6740ad8da4625a70540fc5b1bbe4df9c689b086bfd24'
        '5e9cba2f45604db83eb77c7bbb54bc499a38274be6cd97abb056c9bdf18e637a8ac354e18f41f614f7e1a2d6f13c2a0b562ab0aaebf9447cf5eb2d60e6501e12'
        '8a8e5ec24ea338b2b51b8d2be5a336ac8d4cc6b25200ed0f0d564df9942997478df0c54da2fac7b27d677774a34398f69047eecd0f97bdc0df8fe50a1b5ed74d')

# Upstream provides md5 and sha256

prepare() {
  cd postgresql-${pkgver}
  patch -p1 < ../postgresql-run-socket.patch
  patch -p1 < ../postgresql-perl-rpath.patch
}

build() {
  cd postgresql-${pkgver}
  local configure_options=(
    --prefix=/usr
    --mandir=/usr/share/man
    --datadir=/usr/share/postgresql
    --sysconfdir=/etc
    --with-gssapi
    --with-libxml
    --with-openssl
    --with-perl
    --with-python
    --with-tcl
    --with-pam
    --with-readline
    --with-system-tzdata=/usr/share/zoneinfo
    --with-uuid=e2fs
    --with-icu
    --with-systemd
    --with-ldap
    --with-llvm
    --with-libxslt
    --with-lz4
    --with-zstd
    --enable-nls
    --enable-thread-safety
    --disable-rpath
  )

  # Fix static libs
  CFLAGS+=" -ffat-lto-objects"

  ./configure "${configure_options[@]}"
  make world
}

_postgres_check() {
  make "${1}" || (find . -name regression.diffs | \
    while read -r line; do
      echo "make ${1} failure: ${line}"
      cat "${line}"
    done; exit 1)
}

check() {
  cd postgresql-${pkgver}
  _postgres_check check
  _postgres_check check-world
}

package_postgresql-libs() {
  pkgdesc="Libraries for use with PostgreSQL"
  depends=('krb5' 'openssl>=1.0.0' 'readline>=6.0' 'zlib' 'libldap')
  provides=('postgresql-client' 'libpq.so' 'libecpg.so' 'libecpg_compat.so' 'libpgtypes.so')
  conflicts=('postgresql-client')

  cd postgresql-${pkgver}

  # install license
  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # install libs and non-server binaries
  for dir in src/interfaces src/bin/pg_config src/bin/pg_dump src/bin/psql src/bin/scripts; do
    make -C ${dir} DESTDIR="${pkgdir}" install
  done

  for util in pg_config pg_dump pg_dumpall pg_restore psql \
      clusterdb createdb createuser dropdb dropuser pg_isready reindexdb vacuumdb; do
    install -Dm 644 doc/src/sgml/man1/${util}.1 "${pkgdir}"/usr/share/man/man1/${util}.1
  done

  cd src/include

  install -d "${pkgdir}"/usr/include/{libpq,postgresql/internal/libpq}

  # these headers are needed by the public headers of the interfaces
  install -m 644 pg_config.h "${pkgdir}/usr/include"
  install -m 644 pg_config_os.h "${pkgdir}/usr/include"
  install -m 644 pg_config_ext.h "${pkgdir}/usr/include"
  install -m 644 postgres_ext.h "${pkgdir}/usr/include"
  install -m 644 libpq/libpq-fs.h "${pkgdir}/usr/include/libpq"
  install -m 644 pg_config_manual.h "${pkgdir}/usr/include"

  # these he aders are needed by the not-so-public headers of the interfaces
  install -m 644 c.h "${pkgdir}/usr/include/postgresql/internal"
  install -m 644 port.h "${pkgdir}/usr/include/postgresql/internal"
  install -m 644 postgres_fe.h "${pkgdir}/usr/include/postgresql/internal"
  install -m 644 libpq/pqcomm.h "${pkgdir}/usr/include/postgresql/internal/libpq"
}

package_postgresql-docs() {
  pkgdesc="HTML documentation for PostgreSQL"
  options+=('docs')

  cd postgresql-${pkgver}

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  make -C doc/src/sgml DESTDIR="${pkgdir}" install-html
  chown -R root:root "${pkgdir}/usr/share/doc/postgresql/html"

  # clean up
  rmdir "${pkgdir}"/usr/share/man/man{1,3,7}
  rmdir "${pkgdir}"/usr/share/man
}

package_postgresql() {
  pkgdesc='Sophisticated object-relational DBMS'
  backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
  depends=("postgresql-libs>=${pkgver}" 'krb5' 'libxml2' 'readline>=6.0'
           'openssl>=1.0.0' 'pam' 'icu' 'systemd-libs' 'libldap' 'llvm-libs'
           'libxslt' 'lz4' 'zstd')
  optdepends=('python: for PL/Python 3 support'
              'perl: for PL/Perl support'
              'tcl: for PL/Tcl support'
              'postgresql-old-upgrade: upgrade from previous major version using pg_upgrade'
              'logrotate: rotates system logs automatically')
  options+=('staticlibs')
  install=postgresql.install

  cd postgresql-${pkgver}

  # install
  make DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install
  make -C doc/src/sgml DESTDIR="${pkgdir}" install-man

  # we don't want these, they are in the -libs package
  for dir in src/interfaces src/bin/pg_config src/bin/pg_dump src/bin/psql src/bin/scripts; do
    make -C ${dir} DESTDIR="${pkgdir}" uninstall
  done
  for util in pg_config pg_dump pg_dumpall pg_restore psql \
      clusterdb createdb createuser dropdb dropuser pg_isready reindexdb vacuumdb; do
    rm "${pkgdir}"/usr/share/man/man1/${util}.1
  done

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${srcdir}"
  install -Dm 755 postgresql-check-db-dir -t "${pkgdir}/usr/bin"

  install -Dm 644 ${pkgname}.pam "${pkgdir}/etc/pam.d/${pkgname}"
  install -Dm 644 ${pkgname}.logrotate "${pkgdir}/etc/logrotate.d/${pkgname}"

  install -Dm 644 ${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm 644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  # clean up unneeded installed items
  rm -rf "${pkgdir}/usr/include/postgresql/internal"
  rm -rf "${pkgdir}/usr/include/libpq"
  find "${pkgdir}/usr/include" -maxdepth 1 -type f -execdir rm {} +
  rmdir "${pkgdir}/usr/share/doc/postgresql/html"
}

# vim:set sw=2 sts=-1 et:
