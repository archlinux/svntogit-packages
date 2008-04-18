# $Id$
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>

pkgname=erlang
pkgver=R12B.1
pkgrel=1
pkgdesc="A small concurrent functional programming language developed by Ericsson."
arch=(i686 x86_64)
options=('!makeflags')
depends=('ncurses' 'glibc')
license=('custom')
makedepends=('java-environment' 'perl' 'openssl')
source=(http://www.erlang.org/download/otp_src_${pkgver/./-}.tar.gz
	http://www.erlang.org/download/otp_doc_man_${pkgver/./-}.tar.gz)
md5sums=('6de3630b446e9c2150edfe01e383c917' '96da62bcfb40e5d3ec2945bb2b050024')

url="http://www.erlang.org/index.html"

build() {
  ERTSVERSION=5.6
  cd $startdir/src/otp_src_${pkgver/./-}

  # fix #7633 - shouldn't hurt i686
  sed -i '/SSL_DYNAMIC_ONLY=/s:no:yes:' erts/configure || return 1

  ./configure --prefix=/usr --enable-smp-support --enable-threads
  make || return 1
  make INSTALL_PREFIX=$startdir/pkg install || return 1

# fix prefix
  cd $startdir/pkg
  for i in usr/lib/erlang/bin/erl \
      usr/lib/erlang/bin/start \
      usr/lib/erlang/erts-${ERTSVERSION}/bin/erl \
      usr/lib/erlang/erts-${ERTSVERSION}/bin/start \
      usr/lib/erlang/releases/RELEASES ;do 
    sed -i "s#$startdir/pkg##" $i
  done

# fix symlinks
  cd $startdir/pkg/usr/lib/erlang/bin
  ln -sf ../erts-${ERTSVERSION}/bin/epmd 

  cd $startdir/pkg/usr/bin
  for file in *; do
    ln -sfv ../lib/erlang/bin/$file || return 1
  done

	# install documentation 
  cp -r $startdir/src/{COPYRIGHT,PR.template,README,man} $startdir/pkg/usr/lib/erlang
  install -Dm644 $startdir/src/otp_src_${pkgver/./-}/EPLICENCE $startdir/pkg/usr/share/licenses/$pkgname/EPLICENCE
}
