# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=licenses
pkgver=20181104
pkgrel=1
pkgdesc='Standard licenses distribution package'
arch=('any')
license=('custom:none')
url='https://www.archlinux.org/'
groups=('base')
makedepends=('links')
source=(apache-2.0.txt::https://www.apache.org/licenses/LICENSE-2.0.txt
        cc-by-3.0.txt
        cc-by-nc-3.0.txt
        cc-by-nc-nd-3.0.txt
        cc-by-nc-sa-3.0.txt
        cc-by-nd-3.0.txt
        cc-by-sa-3.0.txt
        cc-readme.txt
        cddl-1.0.txt
        eclipse-1.0.txt
        https://www.gnu.org/licenses/agpl-3.0.txt
        https://www.gnu.org/licenses/gpl-2.0.txt
        https://www.gnu.org/licenses/gpl-3.0.txt
        https://www.gnu.org/licenses/lgpl-2.1.txt
        https://www.gnu.org/licenses/lgpl-3.0.txt
        https://www.gnu.org/licenses/fdl-1.2.txt
        https://www.gnu.org/licenses/fdl-1.3.txt
        https://www.latex-project.org/lppl.txt
        perlartistic.txt
        artistic-2_0.txt
        php-3.0.txt::http://www.php.net/license/3_0.txt
        ruby-license.txt
        cpl-1.0.txt
        python-2.txt
        w3c.txt
        ZopePublicLicense.txt
        mpl-1.1.txt::https://www.mozilla.org/media/MPL/1.1/index.txt
        mpl-2.0.txt::https://www.mozilla.org/media/MPL/2.0/index.txt
        boost-1.0.txt::http://www.boost.org/LICENSE_1_0.txt)
md5sums=('3b83ef96387f14655fc854ddc3c6bd57'
         'ffb24d1bbf8b83d373f0b8edc3feb0c6'
         '682a5e3b03510ba46c4f566478c871bc'
         '166b65b71e44630b436bfe937c4c0b73'
         '89bca4a2dde8b7d39c27a1dc24078932'
         '2502517d13d8136fffaf248489ad0870'
         '5367190077e12a7f55403d531ef3998e'
         '019bc72509b18a804f0ea8fd2bab1932'
         '6cb35f3976cd093011967fa1abbce386'
         'f300afd598546add034364cd0a533261'
         'eb1e647870add0502f8f010b19de32af'
         'b234ee4d69f5fce4486a80fdaf4a4263'
         '1ebbd3e34237af26da5dc08a4e440464'
         '4fbd65380cdd255951079008b364516c'
         '3000208d539ec061b899bce1d9ce9404'
         'cfe2a5472d5eaa226eae091d4114ce29'
         '60e948417268fd26557f89fff655183a'
         '9f4337828d782bdea41f03dd2ad1b808'
         'd09c120ca7db95ef2aeecec0cb08293b'
         'b4a94da2a1f918b217ef5156634fc9e0'
         '00b4bd92b48eaed71b4e4e7b7314c3b6'
         '8a960b08d972f43f91ae84a6f00dcbfb'
         'f083e41c43db25e18f36c91e57750b64'
         'a055911c32fb4ed6e96c453ceaeba857'
         '6f2095b5d61770740852873b195a4d21'
         'dc8502850eab9e1ff330a12d7ca18a19'
         '0c5913925d40b124fb52ce84c5deb3f3'
         '815ca599c9df247a0c7f619bab123dad'
         'e4224ccaecb14d942c71d31bef20d78c')

package() {
  cd "$pkgdir"
  mkdir -p usr/share/licenses/common
  cd usr/share/licenses/common

  mkdir AGPL3
  cp "$srcdir"/agpl-3.0.txt AGPL3/license.txt
  ln -s AGPL3 AGPL

  mkdir Apache
  cp "$srcdir"/apache-2.0.txt Apache/license.txt
  ln -s Apache APACHE

  mkdir Artistic2.0
  cp "$srcdir"/artistic-2_0.txt Artistic2.0/license.txt

  mkdir CCPL
  cp "$srcdir"/cc-by-3.0.txt CCPL/
  cp "$srcdir"/cc-by-nc-3.0.txt CCPL/
  cp "$srcdir"/cc-by-nc-nd-3.0.txt CCPL/
  cp "$srcdir"/cc-by-nc-sa-3.0.txt CCPL/
  cp "$srcdir"/cc-by-nd-3.0.txt CCPL/
  cp "$srcdir"/cc-by-sa-3.0.txt CCPL/
  cp "$srcdir"/cc-readme.txt CCPL/

  mkdir CDDL
  cp "$srcdir"/cddl-1.0.txt CDDL/license.txt

  mkdir CPL
  cp "$srcdir"/cpl-1.0.txt CPL/license.txt

  mkdir EPL
  cp "$srcdir"/eclipse-1.0.txt EPL/license.txt

  mkdir {GPL2,GPL3}
  cp "$srcdir"/gpl-2.0.txt GPL2/license.txt
  cp "$srcdir"/gpl-3.0.txt GPL3/license.txt
  ln -s GPL2 GPL

  mkdir {FDL1.2,FDL1.3}
  cp "$srcdir"/fdl-1.2.txt FDL1.2/license.txt
  cp "$srcdir"/fdl-1.3.txt FDL1.3/license.txt
  ln -s FDL1.2 FDL

  mkdir {LGPL2.1,LGPL3}
  cp "$srcdir"/lgpl-2.1.txt LGPL2.1/license.txt
  cp "$srcdir"/lgpl-3.0.txt LGPL3/license.txt
  ln -s LGPL2.1 LGPL

  mkdir LPPL
  cp "$srcdir"/lppl.txt LPPL/license.txt

  mkdir MPL
  cp "$srcdir"/mpl-1.1.txt MPL/license.txt

  mkdir MPL2
  cp "$srcdir"/mpl-2.0.txt MPL2/license.txt

  mkdir PerlArtistic
  cp "$srcdir"/perlartistic.txt PerlArtistic/license.txt

  mkdir PHP
  cp "$srcdir"/php-3.0.txt PHP/license.txt

  mkdir PSF
  cp "$srcdir"/python-2.txt PSF/license.txt

  mkdir RUBY
  cp "$srcdir"/ruby-license.txt RUBY/license.txt

  mkdir W3C
  cp "$srcdir"/w3c.txt W3C/license.txt

  mkdir ZPL
  cp "$srcdir"/ZopePublicLicense.txt ZPL/license.txt

  mkdir Boost
  cp "$srcdir"/boost-1.0.txt Boost/license.txt
}

# vim: ts=2 sw=2 et:
