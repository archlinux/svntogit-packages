# $Id: PKGBUILD,v 1.18 2008/04/01 11:50:45 alexander Exp $
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
pkgname=firefox-i18n
pkgver=2.0.0.13
pkgrel=1
_languages=af,ar,be,bg,ca,cs,da,de,el,en-GB,es-AR,es-ES,eu,fi,fr,fy-NL,ga-IE,gu-IN,he,hu,it,ja,ka,ko,ku,lt,mk,mn,nb-NO,nl,nn-NO,pa-IN,pl,pt-BR,pt-PT,ru,sk,sl,sv-SE,tr,zh-CN,zh-TW
pkgdesc="Language packs for Firefox"
arch=(i686 x86_64)
license=('MPL')
url="http://www.mozilla.com/"
depends=("firefox=${pkgver}")
eval conflicts=(mozilla-firefox-i18n mozilla-firefox-{${_languages}} firefox-{${_languages}})
makedepends=('unzip')
eval source=(ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/linux-i686/xpi/{${_languages}}.xpi)

build() {
  cd ${startdir}/src
  for lang in $(echo "${_languages}" | sed 's|,| |g'); do
    unzip -o ${lang}.xpi
    sed -i "s|jar:chrome/${lang}.jar|jar:${lang}.jar|" chrome.manifest || return 1
    install -D -m 644 chrome/${lang}.jar ${startdir}/pkg/usr/lib/firefox-${pkgver}/chrome/${lang}.jar || return 1
    install -D -m 644 chrome.manifest ${startdir}/pkg/usr/lib/firefox-${pkgver}/chrome/${lang}.manifest || return 1
  done
}
md5sums=('80b9a30f4e23e7f8499badbf3dea7704'
         '122322aa27c2c726178daf10596ec875'
         'baa4d67285a2440e34511625e1163f24'
         '0730eb453ee4d5dc3dd4cf99c0b902a6'
         '303471cf47d6715ec368d4df9ab2eec4'
         '588ba3699f2c06e8d40ce4e3bd14dcb0'
         '230b7e4da149ab64601ae134e7aaf36d'
         '07e20d0fd2aeac731e5172437d19caae'
         'e8ae1e4d67686b5c5cc2d86042554bc6'
         '291c35dc2e0ec1bd61ea08d68f37d996'
         '51a84ff49d98c1e8b455de3277307a3a'
         '1aa627cbf267c65adc7d0dfeca173cba'
         '59d3566c6416ec1558db400ab8b9e4be'
         'bbf20402398dcebf1562f1c807d459e6'
         '81b5226e289eee52021f0836cdefd8f5'
         '716ff08b106d7ce4dc89ad9dbe16abad'
         '82a61446f58d694fc9c09c42055259be'
         'dfc5d06a82bbaeb3d02eb5a9e34d70b2'
         'b4ca0abf4a681c0b0ae8462aab963899'
         'bffb297600b97b125805e2f48f2c4626'
         'ccfba37ace4f0834d9072a58d476afa4'
         '912516f76f9e2775c402422fba6fb167'
         '286a7821b6a4416be13d92b961a1b647'
         'ab26bf601b5ce685c9e6e4f8bb57531b'
         '5e87bb2dafd007c1bca98124c13d1b5e'
         'ee176a5563de8389dfb65df83e9afcef'
         '17a1f8ba9c1d4510fcdb084ff555df3c'
         'd7e366def97baee600a9f73f6b175d41'
         '7e3a783e97921352a309127ff161d04a'
         'dba4f8df4f7e5124ecebad10782ef3a9'
         'da850e95f98266aeeb027f7bc1581933'
         '336de2aa5337aad84b16bedc8b6fae35'
         'eb805bb48fd12771609a5360481f7f59'
         'f06c25b670b3464a36ac915a0f21d455'
         '419c8c4f638cbf0423983f813210a600'
         '3390bc58d4c138477061dbea07fd43b7'
         'fb5e01b0c73da3db392086eeddc1d452'
         '1e5adb9fa87c30403f81346e11d0c149'
         '9961e1a9a6e944d3bb45141d81effd87'
         '791d1472d526bbb28f4f601df0916039'
         'f2750e28e7963a80f2cf12b736dc9f5d'
         'ec4aced3e5177046bc8accf79f96f3e3')
