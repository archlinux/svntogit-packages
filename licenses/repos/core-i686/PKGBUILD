# $Id$
# Maintainer: Judd Vinet <judd@archlinux.org>

pkgname=licenses
pkgver=2.3
pkgrel=1
pkgdesc="The standard licenses distribution package"
arch=('i686' 'x86_64')
license=('custom:none')
url="http://archlinux.org"
groups=('base')
source=(http://www.apache.org/licenses/LICENSE-2.0.txt
        cddl-1.0.txt
        eclipse-1.0.txt
        http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
        http://www.gnu.org/licenses/gpl-3.0.txt
        http://www.gnu.org/licenses/old-licenses/lgpl-2.1.txt
        http://www.gnu.org/licenses/lgpl.txt
        http://www.gnu.org/licenses/fdl.txt
        http://www.mozilla.org/MPL/MPL-1.1.txt
        perlartistic.txt
        http://www.php.net/license/3_0.txt
        http://www.ruby-lang.org/en/LICENSE.txt
        cpl-1.0.txt
        python-2.txt
        LICENSE.ralink-firmware.txt
        ZopePublicLicense.txt)
md5sums=('3b83ef96387f14655fc854ddc3c6bd57'
         '6cb35f3976cd093011967fa1abbce386'
         'f300afd598546add034364cd0a533261'
         '751419260aa954499f7abaabaa882bbe'
         'd32239bcb673463ab874e80d47fae504'
         'fbc093901857fcd118f065f900982c24'
         '6a6a8e020838b23406c81b19c1d46df6'
         'ad1419ecc56e060eccf8184a87c4285f'
         'bfe1f75d606912a4111c90743d6c7325'
         'd09c120ca7db95ef2aeecec0cb08293b'
         'a45bb1bbeed9e26b26c5763df1d3913d'
         '68d59ff8306e3a9f5f1c01462c77a317'
         'f083e41c43db25e18f36c91e57750b64'
         '614f4f550910d90428a567cfaafe62a9'
         '682eac07428a4e8f138bc082f090ecac'
         'dc8502850eab9e1ff330a12d7ca18a19')

build() {
  cd $startdir/pkg
  mkdir -p usr/share/licenses/common
  cd usr/share/licenses/common

  mkdir APACHE
  cp $startdir/src/LICENSE-2.0.txt APACHE/license.txt

  mkdir CDDL
  cp $startdir/src/cddl-1.0.txt CDDL/license.txt

  mkdir CPL
  cp $startdir/src/cpl-1.0.txt CPL/license.txt

  mkdir EPL
  cp $startdir/src/eclipse-1.0.txt EPL/license.txt

  mkdir {GPL,GPL3}
  cp $startdir/src/gpl-2.0.txt GPL/license.txt
  cp $startdir/src/gpl-3.0.txt GPL3/license.txt
  ln -s GPL GPL2

  mkdir FDL
  cp $startdir/src/fdl.txt FDL/license.txt

  mkdir {LGPL,LGPL3}
  cp $startdir/src/lgpl-2.1.txt LGPL/license.txt
  cp $startdir/src/lgpl.txt LGPL3/license.txt
  ln -s LGPL LGPL2

  mkdir MPL
  cp $startdir/src/MPL-1.1.txt MPL/license.txt

  mkdir PerlArtistic
  cp $startdir/src/perlartistic.txt PerlArtistic/license.txt

  mkdir PHP
  cp $startdir/src/3_0.txt PHP/license.txt
  
  mkdir PSF
  cp $startdir/src/python-2.txt PSF/license.txt

  mkdir RALINK
  cp $startdir/src/LICENSE.ralink-firmware.txt RALINK/license.txt

  mkdir RUBY
  cp $startdir/src/LICENSE.txt RUBY/license.txt

  mkdir ZPL
  cp $startdir/src/ZopePublicLicense.txt ZPL/license.txt
}
