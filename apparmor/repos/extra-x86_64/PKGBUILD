# Maintainer: David Runge <dave@sleepmap.de>
pkgname=apparmor
pkgver=2.13.3
pkgrel=2
pkgdesc="Mandatory Access Control (MAC) using Linux Security Module (LSM)"
arch=('x86_64')
url="https://gitlab.com/apparmor/apparmor"
license=('GPL2' 'LGPL2.1')
depends=('audit' 'pam' 'python')
makedepends=('apache' 'ruby' 'swig')
checkdepends=('dejagnu' 'perl-locale-gettext' 'python-pyflakes')
optdepends=('perl: perl bindings'
            'ruby: ruby bindings')
provides=('libapparmor.so')
backup=('etc/apparmor/easyprof.conf'
        'etc/apparmor/logprof.conf'
        'etc/apparmor/notify.conf'
        'etc/apparmor/parser.conf'
        'etc/apparmor/subdomain.conf'
        'etc/apparmor/severity.db')
source=("https://launchpad.net/${pkgname}/${pkgver%.[0-9]}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha512sums=('137b2bf026ec655b662e9c264d7d48d878db474a3f1cc5a38bfd7df2f85b682bddb77b091ab5595178231a0a262c9ae9cdd61409461cd889bdee156906ef1141'
            'SKIP')
# AppArmor Development Team (AppArmor signing key) <apparmor@lists.ubuntu.com>
validpgpkeys=('3ECDCBA5FB34D254961CC53F6689E64E3D3664BB')
_core_perl="/usr/bin/core_perl"

prepare() {
  cd "${pkgname}-${pkgver}"
  # fix PYTHONPATH and add LD_LIBRARY_PATH for aa-logprof based check:
  # https://gitlab.com/apparmor/apparmor/issues/39
  local _py3_ver=$(python --version | cut -d " " -f2)
  local path="${PWD}/libraries/libapparmor/swig/python/build/lib.linux-${CARCH}-${_py3_ver%"."*}/LibAppArmor"
  local libs="${PWD}/libraries/libapparmor/src/.libs"
  sed -e "/PYTHONPATH/ s|utils\ |utils:$path\ LD_LIBRARY_PATH=$libs\ |" \
      -i profiles/Makefile
  # fix hardcoded install paths: https://gitlab.com/apparmor/apparmor/issues/38
  sed -e 's|/usr/sbin|/usr/bin|g' \
      -e 's|/sbin|/usr/bin|g' \
      -i parser/Makefile
  (
    cd libraries/libapparmor/
    autoreconf -vfi
  )
}

build() {
  cd "${pkgname}-${pkgver}"
  # export required perl executable locations
  export MAKEFLAGS+=" POD2MAN=${_core_perl}/pod2man"
  export MAKEFLAGS+=" POD2HTML=${_core_perl}/pod2html"
  export MAKEFLAGS+=" PODCHECKER=${_core_perl}/podchecker"
  export MAKEFLAGS+=" PROVE=${_core_perl}/prove"
  (
    cd "libraries/libapparmor/"
    ./configure --prefix=/usr \
                --sbindir=/usr/bin \
                --with-perl \
                --with-python \
                --with-ruby
    make
  )
  make -C binutils
  make -C parser
  make -C profiles
  make -C utils
  make -C changehat/pam_apparmor
  make -C changehat/mod_apparmor
  make -C utils/vim
}

check() {
  cd "$pkgname-$pkgver"
  make -C libraries/libapparmor check
  make -C binutils check
  make -C parser check
  # only running check-parser, as check-logprof (included in check) fails:
  # https://gitlab.com/apparmor/apparmor/issues/36
  make -C profiles check-parser
  make -C utils check
}

package() {
  cd "$pkgname-$pkgver"
  make -C libraries/libapparmor DESTDIR="${pkgdir}" install
  make -C changehat/pam_apparmor DESTDIR="${pkgdir}/usr" install
  make -C changehat/mod_apparmor DESTDIR="${pkgdir}" install
  make -C binutils DESTDIR="${pkgdir}" install
  make -C parser DESTDIR="${pkgdir}" \
                 APPARMOR_BIN_PREFIX="${pkgdir}/usr/lib/apparmor" \
                 install install-systemd
  make -C profiles DESTDIR="${pkgdir}" install
  make -C utils DESTDIR="${pkgdir}" \
                BINDIR="${pkgdir}/usr/bin" \
                VIM_INSTALL_PATH="${pkgdir}/usr/share/vim/vimfiles/syntax" \
                install
  # strip perl library: https://gitlab.com/apparmor/apparmor/issues/34
  find "${pkgdir}/usr/lib/perl5/" \
    -type f -iname "*.so" \
    -exec strip --strip-unneeded {} \;
  # removing empty core_perl directory:
  # https://gitlab.com/apparmor/apparmor/issues/40
  rm -rv "${pkgdir}"/usr/lib/perl5/*/core_perl
  # move ruby bindings to vendor_ruby:
  # https://gitlab.com/apparmor/apparmor/issues/35
  mv -v "${pkgdir}/usr/lib/ruby/site_ruby/" \
    "${pkgdir}/usr/lib/ruby/vendor_ruby/"
  # adding files below /etc/apparmor.d to backup array
  cd "${pkgdir}"
  # tricking extract_function_variable() in makepkg into not detecting the
  # backup array modification and adding remaining configuration files
  [[ /usr/bin/true ]] && backup=( ${backup[@]} $(find "etc/${pkgname}.d/" -type f) )
}
