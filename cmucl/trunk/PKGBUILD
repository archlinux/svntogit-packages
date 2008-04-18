# $Id$
# Contributor: John Proctor <jproctor@prium.net>
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>

pkgname=cmucl
pkgver=19d
pkgrel=1
pkgdesc="CMU Common Lisp"
depends=('glibc' 'lesstif')
makedepends=('sed' 'bc')
source=(http://common-lisp.net/project/cmucl/downloads/release/${pkgver}/cmucl-src-${pkgver}.tar.bz2 \
    http://common-lisp.net/project/cmucl/downloads/release/${pkgver}/cmucl-${pkgver}-x86-linux.tar.bz2 \
		cmucl-19c-xorg.patch)
md5sums=('3a3dba371a7e1db7fa4b8f338acd72a3' '802cd8b05e376ff04c9006dd04f5bc7e'\
         '13b083f9cf3c2f17f88c60b02edcd63c')
url="http://www.cons.org/cmucl/"

build() {
  cd $startdir/src
  (cd src && patch -p1 -i $startdir/src/cmucl-19c-xorg.patch) || return 1
  export CMUCLCORE=$startdir/src/lib/cmucl/lib/lisp.core
  # Create target buildroot
  ./src/tools/create-target.sh $CHOST linux_gencgc
  # Use binary-dist lisp to create initial kernel.core
  ./src/tools/build-world.sh $CHOST bin/lisp
  # build native lisp binary
  ./src/tools/rebuild-lisp.sh $CHOST 
  # Generate lisp.core
  ./src/tools/load-world.sh $CHOST "$pkgver archlinux release $pkgver"
  # rebuild kernel.core using native lisp 
  ./src/tools/build-world.sh $CHOST $CHOST/lisp/lisp
  # (Re)generate lisp.core
  ./src/tools/load-world.sh $CHOST "$pkgver archlinux release $pkgver"
  # Build auxilary stuff
  ./src/tools/build-utils.sh $CHOST 
  # make new binary dist archives
  ./src/tools/make-dist.sh $CHOST ${pkgver} x86 linux

  mkdir dist
  pushd dist
  # unarchive newly creating binary dist archives
  tar xvzf ../cmucl-${pkgver}-x86-linux.tar.gz
  tar xvzf ../cmucl-${pkgver}-x86-linux.extra.tar.gz

  mkdir -p $startdir/pkg/usr/lib/cmucl/
  cp -a bin $startdir/pkg/usr/lib/cmucl/
  cp -a lib/cmucl $startdir/pkg/usr/lib/

  mkdir -p $startdir/pkg/usr/man/man1
  install -p man/man1/* $startdir/pkg/usr/man/man1/
  popd 

  ## Setup app-wrapper
  install -m755 -p -D lib/cmucl/sample-wrapper $startdir/pkg/usr/bin/cmucl
  # Fixup paths in wrapper
  sed -i -e "s|^CMUCLLIB=.*|CMUCLLIB=/usr/lib/cmucl/lib|" $startdir/pkg/usr/bin/cmucl
  sed -i -e "s|/<<your-cmucl-path>>|/usr/lib/cmucl|"      $startdir/pkg/usr/bin/cmucl
  # many apps (ie, maxima) expect to find the wrapper named 'lisp' too
  ln -sf cmucl $startdir/pkg/usr/bin/lisp
  ## Unpackaged files
  rm -f $startdir/pkg/usr/lib/cmucl/sample-wrapper

}
