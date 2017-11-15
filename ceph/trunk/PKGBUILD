# Maintainer: Sébastien "Seblu" Luttringer <seblu@archlinux.org>
# Contributor: Thore Bödecker <foxxx0@archlinux.org>

pkgbase='ceph'
pkgname=('ceph' 'ceph-libs')
pkgver=12.2.1
pkgrel=2
pkgdesc='Distributed, fault-tolerant storage platform delivering object, block, and file system'
arch=('x86_64')
url='https://ceph.com/'
license=('GPL')
makedepends=('babeltrace>=1.5.3-1' 'bc' 'boost' 'boost-libs' 'cmake' 'cpio'
  'crypto++' 'curl' 'cython' 'cython2' 'expat' 'fcgi' 'fuse2' 'gcc-libs' 'git'
  'glibc' 'gperf' 'gperftools' 'gptfdisk' 'inetutils' 'jq' 'junit' 'keyutils'
  'leveldb' 'libaio' 'libatomic_ops' 'libedit' 'libsystemd' 'libutil-linux'
  'libxml2' 'lsb-release' 'lttng-ust>=2.10.0-8' 'lz4' 'ncurses' 'nss' 'parted'
  'pcre' 'procps-ng' 'python2-cherrypy' 'python2-jinja'
  'python2-lttngust>=2.10.0-8' 'python2-nose' 'python2-pecan' 'python2-pip'
  'python2-prettytable' 'python2-pyopenssl' 'python2-setuptools'
  'python2-sphinx' 'python2-tox' 'python2-virtualenv' 'python2-werkzeug'
  'sed' 'snappy' 'socat' 'systemd' 'valgrind' 'xfsprogs' 'xmlstarlet' 'yasm'
  'zlib' 'zstd')
options=('emptydirs')
source=("https://download.ceph.com/tarballs/${pkgbase}-${pkgver}.tar.gz"
        'ceph.sysusers'
        'fix-ceph_disk-python-interpreter.patch'
        'fix-or-disable-broken-tests.patch'
        'fix-python2-paths.patch'
        'remove-distro-version-detection.patch')
sha512sums=('ec2623c1f6ab563c6fd0bb5fd046c78528fdbedca7cde347c92a9b15005d2ab2b1a46d7294e93f56933386462f1066750285109aafb6bf94f7d5bcdb7214d8a8'
            '4354001c1abd9a0c385ba7bd529e3638fb6660b6a88d4e49706d4ac21c81b8e829303a20fb5445730bdac18c4865efb10bc809c1cd56d743c12aa9a52e160049'
            '7abd94a333fb0d6c9f7156d69ed6d4bf123f0f3030407f4347209d677b282e5023664d43e74a21a27b7856d3493ae469a17ea8a810331c7266018cc34eee4841'
            '43cbd68841758d58d11ab9acfb04800bf8b34321503b8ebc3b02291c5e2de7a60e26dc0d5e99af75dae63aa7d03e3e9322aba7cbe3b4f1dfb5e7d01fc5b40cad'
            'd5d9e8123833212f6cf0ecef209a5dd9b9a8ec70d780b5140884dc9f87690ec305fb2569c5d1da2b28deb05bd03caecc534acc9dc5ce7ec75e2580df4b5b2063'
            'e2ed33e2ac37bfdb9597083388e1a87f10051e976033055d440b1a4bc2bd11148c29128fb9841771ca983c12fb36b343bcc04219dea87199321ceea9aa18b3cc')

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      msg2 "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done

  # remove tests that require root privileges
  rm src/test/cli/ceph-authtool/cap*.t

  # remove broken tests
  rm src/test/cli/crushtool/build.t
  rm -rf qa/btrfs
  rm src/btrfs_ioc_test.c

  # this test will try to perform btrfs operations when a btrfs mount
  # is active on the build host, which will fail
  if mount | grep 'type btrfs' &>/dev/null; then
    sed -i '/run-tox-ceph-disk/d' src/test/CMakeLists.txt
  fi
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  mkdir -p build
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_SBINDIR=/usr/bin \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
    -DWITH_BABELTRACE=ON \
    -DWITH_CEPHFS=ON \
    -DWITH_FUSE=ON \
    -DWITH_LTTNG=ON \
    -DWITH_LZ4=ON \
    -DWITH_MGR=ON \
    -DWITH_NSS=ON \
    -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
    -DWITH_RADOSGW=ON \
    -DWITH_RADOSGW_BEAST_FRONTEND=ON \
    -DWITH_RDMA=OFF \
    -DWITH_SSL=ON \
    -DWITH_SYSTEM_BOOST=ON \
    -DWITH_SYSTEMD=ON \
    -DWITH_TESTS=ON \
    -DWITH_XFS=ON \
    -DENABLE_SHARED=ON \
    ..

  make all
}

check() {
  cd "${srcdir}/${pkgbase}-${pkgver}/build"

  export CTEST_PARALLEL_LEVEL="$(nproc)"
  make check

  # sometimes processes are not properly terminated...
  for process in ceph-mon ceph-mgr ceph-osd; do
    pkill -9 "$process" || true
  done
}

package_ceph-libs() {
  depends=('boost-libs' 'curl' 'glibc' 'keyutils' 'leveldb' 'libaio'
    'libutil-linux' 'lttng-ust' 'nss' 'python2' 'xfsprogs')

  cd "${srcdir}/${pkgbase}-${pkgver}/build"

  # main install
  make DESTDIR="$pkgdir" install

  # remove stuff that goes into the ceph package
  rm -rf "${pkgdir}"/usr/lib/{ceph/mgr,systemd,sysusers.d,tmpfiles.d}
  rm -rf "${pkgdir}/usr/share"
  rm -rf "${pkgdir}/usr/sbin"
  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/etc"
  rm -rf "${pkgdir}/var"
}

package_ceph() {
  depends=('ceph-libs' 'babeltrace' 'boost-libs' 'curl' 'fuse2' 'glibc'
    'gperftools' 'keyutils' 'leveldb' 'libaio' 'libsystemd' 'libutil-linux'
    'lsb-release' 'lttng-ust' 'ncurses' 'nss' 'python2' 'python2-cherrypy'
    'python2-jinja' 'python2-pecan' 'python2-prettytable' 'python2-pyopenssl'
    'python2-setuptools' 'python2-werkzeug' 'snappy' 'xfsprogs')

  cd "${srcdir}/${pkgbase}-${pkgver}/build"

  # main install
  make DESTDIR="$pkgdir" install

  # remove stuff that is in the ceph-libs package
  find "${pkgdir}/usr/lib" -maxdepth 1 -type f -delete
  find "${pkgdir}/usr/lib" -maxdepth 1 -type l -delete
  find "${pkgdir}/usr/lib/ceph" -maxdepth 1 -type f -delete
  find "${pkgdir}/usr/lib/ceph" -maxdepth 1 -type l -delete
  rm -rf "${pkgdir}"/usr/lib/{ceph/{compressor,crypto,erasure-code},python2.7,rados-classes}
  rm -rf "${pkgdir}/usr/include"

  # install tmpfiles.d and sysusers.d stuff
  install -Dm644 "${srcdir}/${pkgbase}-${pkgver}/systemd/ceph.tmpfiles.d" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgbase}.conf"
  install -Dm644 "${srcdir}/ceph.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgbase}.conf"

  # remove debian init script
  rm -rf "${pkgdir}/etc/init.d"

  # fix sbin dir (cmake opt seems to have no effect)
  mv "${pkgdir}"/usr/sbin/* "${pkgdir}/usr/bin/"
  rm -rf "${pkgdir}/usr/sbin"

  # remove drop.ceph.com ssh stuff
  rm -f "${pkgdir}/usr/share/ceph/{{known_hosts,id_rsa}_drop.ceph.com,.pub}"

  # fix bash completions path
  install -d -m 755 "${pkgdir}/usr/share/bash-completion"
  mv "$pkgdir"/{etc/bash_completion.d,usr/share/bash-completion/completions}

  # fix EnvironmentFile location in systemd service files
  sed -i 's|/etc/sysconfig/|/etc/conf.d/|g' "${pkgdir}"/usr/lib/systemd/system/*.service

  # prepare some paths and set correct permissions
  install -D -d -m750 -o   0 -g 340 "${pkgdir}/etc/ceph"
  install -D -d -m750 -o 340 -g 340 "${pkgdir}/var/log/ceph"
  install -D -d -m750 -o 340 -g 340 "${pkgdir}/var/lib/ceph"
  install -D -d -m750 -o 340 -g 340 "${pkgdir}/var/lib/ceph/bootstrap-mds"
  install -D -d -m750 -o 340 -g 340 "${pkgdir}/var/lib/ceph/bootstrap-osd"
  install -D -d -m750 -o 340 -g 340 "${pkgdir}/var/lib/ceph/bootstrap-rgw"
  install -D -d -m750 -o 340 -g 340 "${pkgdir}/var/lib/ceph/mon"
  install -D -d -m750 -o 340 -g 340 "${pkgdir}/var/lib/ceph/mgr"
  install -D -d -m750 -o 340 -g 340 "${pkgdir}/var/lib/ceph/osd"
}

# vim:set ts=2 sw=2 et:
