# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
pkgname=python
pkgver=2.5.2
pkgrel=2
_pybasever=2.5
pkgdesc="A high-level scripting language"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.python.org"
depends=('db>=4.6' 'bzip2' 'gdbm' 'openssl>=0.9.8d' 'zlib')
makedepends=('tk>=8.5.0' 'sqlite3')
provides=('python-ctypes')
conflicts=('python-ctypes')
replaces=('python-ctypes')
source=(http://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.bz2
	Python-2.4.4-gdbm-1.patch
	db4.6-setup.py-detection.patch
	python-2.5.CVE-2007-4965-int-overflow.patch
	python2.6-set_wakeup_fd4.patch)
md5sums=('afb5451049eda91fbde10bd5a4b7fadc'
         '2b61e06365e9fb5f3af22d946efa8be6'
         'ad59f0d7c862d9714c7580899bc1c356'
         '491416c1b337fc61b6cdf5981d895a7d'
         'ec56710959deb01b5fa35829cafec6a3')

build() {
  cd ${startdir}/src/Python-${pkgver}
  patch -Np1 -i ${startdir}/src/Python-2.4.4-gdbm-1.patch || return 1
  patch -Np0 -i ${startdir}/src/db4.6-setup.py-detection.patch || return 1
  # fix http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-4965
  patch -Np1 -i ${startdir}/src//python-2.5.CVE-2007-4965-int-overflow.patch || return 1

  patch -Np2 -i ${startdir}/src/python2.6-set_wakeup_fd4.patch || return 1

  ./configure --prefix=/usr --enable-shared --with-threads --enable-unicode
  # This is supposed to be the previous version's python directory
  #  NOT the current one
  sed -i 's#SITEPATH=#SITEPATH=:../python2.4/site-packages#' Makefile
  make || return 1
  make DESTDIR=${startdir}/pkg install

  rm ${startdir}/pkg/usr/bin/python
  ln -sf python${_pybasever} ${startdir}/pkg/usr/bin/python

  # Install the tools
  #modulator
  cat > ${startdir}/pkg/usr/bin/modulator << EOF
#!/bin/bash
exec /usr/lib/python${_pybasever}/site-packages/modulator/modulator.py
EOF

  chmod 755 ${startdir}/pkg/usr/bin/modulator
  cp -r Tools/modulator ${startdir}/pkg/usr/lib/python${_pybasever}/site-packages/

  #pynche
  cat > ${startdir}/pkg/usr/bin/pynche << EOF
#!/bin/bash
exec /usr/lib/python${_pybasever}/site-packages/pynche/pynche
EOF

  chmod 755 ${startdir}/pkg/usr/bin/pynche
  rm -f Tools/pynche/*.pyw
  cp -r Tools/pynche ${startdir}/pkg/usr/lib/python${_pybasever}/site-packages/

  #gettext
  install -m755 Tools/i18n/pygettext.py ${startdir}/pkg/usr/bin/
  install -m755 Tools/i18n/msgfmt.py ${startdir}/pkg/usr/bin/

  mkdir -p ${startdir}/pkg/usr/lib/python${_pybasever}/Tools/scripts
  install Tools/scripts/README ${startdir}/pkg/usr/lib/python${_pybasever}/Tools/scripts/
  install Tools/scripts/*py ${startdir}/pkg/usr/lib/python${_pybasever}/Tools/scripts/

  # license
  install -D -m644 LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
}
