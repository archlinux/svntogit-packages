# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=apparmor
pkgver=2.13.4
pkgrel=4
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
source=("https://launchpad.net/${pkgname}/${pkgver%.[0-9]}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"{,.asc}
        "${pkgname}-2.13.4-make4.3.patch::https://gitlab.com/apparmor/apparmor/-/merge_requests/465.patch"
        "${pkgname}-2.13.4-vim_file.patch::https://gitlab.com/apparmor/apparmor/-/merge_requests/472.patch"
        "${pkgname}-2.13.4-run_variable.patch::https://gitlab.com/apparmor/apparmor/-/commit/454fca7483eae7b7ee613343c2c02abaa20e37e3.patch"
        "${pkgname}-2.13.4-fix_systemd_userdb.patch::https://gitlab.com/apparmor/apparmor/-/commit/d4296d217c888e08e10bec300fe35351c2ef2f81.patch")
sha512sums=('d42748bf36ae66849f79653a62d499e9d17a97c4d680fb653eb1c379d0593aaa09f7ddfc6f2fa0d2fb468bce05fb25444976f60a5ec24778fdd7ec20d1c13651'
            'SKIP'
            '8d0eb65624a7dcc7f019974a7ad10ec0b3e2d61e51a3f9771564b4e0ddaaece17e90f78388933e8f9451ad413a51dd16d479b99733ceef73b86eb8308122a335'
            '987d2d0dd1148c28796cbb933ea79a14ef2bdf903253a10f369614f0cbbd0309c9848e28dd2f2aa216d8deaf8412e6dd043e867da34466fe39169fc0e44f07ad'
            '0abe606ad510cc97947152b28750354bd43046b38abcd6b28bbc04916fad39308f78b3626ca8b4a3ec59612fea908bdef2e309376f617595b5fc1aaec2bc6343'
            '0fde84730115b2854b85d1b72fbbd5c54730e887af333bfff917da529a08a429d3494efdae9d1baa1d05891d925b04d69f079d11d4afb0907cbfefbd0f280583')
# AppArmor Development Team (AppArmor signing key) <apparmor@lists.ubuntu.com>
validpgpkeys=('3ECDCBA5FB34D254961CC53F6689E64E3D3664BB')
_core_perl="/usr/bin/core_perl"

prepare() {
  cd "${pkgname}-${pkgver}"
  # fix problems in Makefile (header inclusion):
  # https://gitlab.com/apparmor/apparmor/-/issues/74
  patch -Np1 -i "../${pkgname}-2.13.4-make4.3.patch"
  # fix generating of apparmor.vim:
  # https://bugs.archlinux.org/task/65450
  patch -Np1 -i "../${pkgname}-2.13.4-vim_file.patch"
  # fix problems with /run/systemd/userdb access
  # https://bugs.archlinux.org/task/65777
  # https://gitlab.com/apparmor/apparmor/-/issues/82
  patch -Np1 -i "../${pkgname}-2.13.4-run_variable.patch"
  patch -Np1 -i "../${pkgname}-2.13.4-fix_systemd_userdb.patch"
  # fix PYTHONPATH and add LD_LIBRARY_PATH for aa-logprof based check:
  # https://gitlab.com/apparmor/apparmor/issues/39
  local _py3_ver=$(python --version | cut -d " " -f2)
  local path="${PWD}/libraries/libapparmor/swig/python/build/lib.linux-${CARCH}-${_py3_ver%"."*}/LibAppArmor"
  local libs="${PWD}/libraries/libapparmor/src/.libs"
  sed -e "/PYTHONPATH/ s|utils\ |utils:$path\ LD_LIBRARY_PATH=$libs\ |" \
      -i profiles/Makefile
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
  echo "INFO: Running check: libraries/libapparmor"
  make -C libraries/libapparmor check
  echo "INFO: Running check binutils"
  make -C binutils check
  echo "INFO: Running check parser"
  make -C parser check

  # check-logprof (included in check) fails:
  # https://gitlab.com/apparmor/apparmor/issues/36
  # echo "INFO: Running check-logprof profiles"
  # make -C profiles check-logprof

  echo "INFO: Running check-parser profiles"
  make -C profiles check-parser
  echo "INFO: Running check utils"
  make -C utils check
}

package() {
  cd "$pkgname-$pkgver"
  make -C libraries/libapparmor DESTDIR="${pkgdir}" install
  make -C changehat/pam_apparmor DESTDIR="${pkgdir}/usr" install
  make -C changehat/mod_apparmor DESTDIR="${pkgdir}" install
  make -C binutils DESTDIR="${pkgdir}" install
  make -C parser -j1 DESTDIR="${pkgdir}" \
                     SBINDIR="${pkgdir}/usr/bin" \
                     USR_SBINDIR="${pkgdir}/usr/bin" \
                     APPARMOR_BIN_PREFIX="${pkgdir}/usr/lib/apparmor" \
                     install install-systemd
  make -C profiles DESTDIR="${pkgdir}" install
  make -C utils DESTDIR="${pkgdir}" \
                BINDIR="${pkgdir}/usr/bin" \
                VIM_INSTALL_PATH="${pkgdir}/usr/share/vim/vimfiles/syntax" \
                install

  # set file mode to allow the perl library to be stripped:
  # https://gitlab.com/apparmor/apparmor/issues/34
  find "${pkgdir}/usr/lib/perl5/" \
    -type f -iname "*.so" \
    -exec chmod 755 {} \;

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
