# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor:  Douglas Soares de Andrade <douglas@archlinux.org>

pkgbase=twisted
pkgname=(python-twisted python2-twisted)
pkgver=20.3.0
pkgrel=3
pkgdesc="Asynchronous networking framework written in Python"
arch=('x86_64')
url="https://twistedmatrix.com/"
license=('MIT')
makedepends=('python-zope-interface' 'python2-zope-interface' 'python-setuptools'
             'python2-setuptools' 'python-service-identity' 'python2-service-identity'
             'python-incremental' 'python2-incremental' 'python-constantly' 'python2-constantly'
             'python-automat' 'python2-automat' 'python-hyperlink' 'python2-hyperlink'
             'python-attrs' 'python2-attrs' 'python-pyhamcrest' 'python2-pyhamcrest')
checkdepends=('subversion' 'xorg-server-xvfb' 'tk' 'openssh' 'gtk3' 'python-gobject'
              'python-subunit' 'python-h2' 'python-priority' 'python-cryptography' 'python-idna'
              'python-pyasn1' 'python-pyserial' 'python-bcrypt')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/twisted/twisted/archive/twisted-$pkgver.tar.gz")
sha512sums=('72307a0b9165d5f6b31f5563f4f76f9c759349d55f6dcaf43358eab3e8f1b2065e0b12c8ac43f14061ee17cb2d9b27f463bcb9e642750fb8e6e510e403bd2b06')

prepare() {
  cp -a twisted-twisted-$pkgver{,-py2}

  sed -i 's:^#!.*bin.*python:#!/usr/bin/python2:' \
    twisted-twisted-$pkgver-py2/src/twisted/mail/test/pop3testserver.py \
    twisted-twisted-$pkgver-py2/src/twisted/trial/test/scripttest.py
}

build() {
  cd "$srcdir"/twisted-twisted-$pkgver
  python setup.py build

  cd "$srcdir"/twisted-twisted-$pkgver-py2
  python2 setup.py build
}

check() {
  export LC_CTYPE=en_US.UTF-8

  # do glob expansion in variable assignment
  pythonpaths=("$srcdir/twisted-twisted-$pkgver/build/lib.linux-$CARCH"-3*)

  # tests use the underlying function from the 'python -m twisted.trial' module, to prevent loading system entry points
  PYTHONPATH="${pythonpaths[0]}" xvfb-run python -c 'from twisted.scripts.trial import run; run()' twisted || warning "Tests failed"
}

package_python-twisted() {
  depends=('python-zope-interface' 'python-incremental' 'python-constantly' 'python-automat'
           'python-hyperlink' 'python-attrs' 'python-pyhamcrest')
  optdepends=('python-pyopenssl: for TLS client hostname verification'
              'python-service-identity: for TLS client hostname verification'
              'python-idna: for TLS client hostname verification'
              'python-cryptography: for using conch'
              'python-pyasn1: for using conch'
              'python-appdirs: for using conch'
              'python-bcrypt: for using conch'
              'python-h2: for http2 support'
              'python-priority: for http2 support'
              'python-pyserial: for serial support'
              'tk: for using tkconch')

  cd twisted-twisted-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  # twisted in python 3 supports only few command line tools for now.
  # Let's rename the tools the other way round after the python 3 version supports all.
  for name in trial twistd twist ckeygen cftp conch pyhtmlizer tkconch mailmail; do
    mv "$pkgdir"/usr/bin/${name}{,3}
  done

  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-twisted() {
  depends=('python2-zope-interface' 'python2-incremental' 'python2-constantly' 'python2-automat'
           'python2-hyperlink' 'python2-attrs' 'python2-pyhamcrest')
  optdepends=('python2-pyopenssl: for TLS client hostname verification'
              'python2-service-identity: for TLS client hostname verification'
              'python2-idna: for TLS client hostname verification'
              'python2-cryptography: for using conch'
              'python2-pyasn1: for using conch'
              'python2-appdirs: for using conch'
              'python2-bcrypt: for using conch'
              'python2-priority: for http2 support'
              'python2-pyserial: for serial support'
              'python2-soappy: for twisted.web.soap'
              'tk: for using tkconch')

  cd twisted-twisted-$pkgver-py2
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
