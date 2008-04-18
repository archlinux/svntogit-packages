# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
pkgname=firefox-i18n
pkgver=2.0.0.14
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
md5sums=('8453c67093c5716be6fcce8e529fcc27'
         'dd8ec27e0c2e3d885eba3a53333fbf86'
         '0ba3e4067a406cd48b2d098de35c1819'
         '24cf260971cb039da476f9a313c0fea3'
         '9b2f70145b403dbd74994349f02605b0'
         'eede6d40f1a09d6d83e3e64623ffa3ca'
         '8d1a361fdd0fbf16d9d5620f18df3467'
         'ffa5e21f4a91774d57ce18918e86539d'
         '3de70a7bb98454694c7c3c9a35b989cd'
         '4c9816fd52cd8199b02082af7c0a6894'
         'fc9ba6ee689567db8fb501d92c5b630d'
         '23a1275e40d1c66804f00eb1dc02d5af'
         '9ea9d325d677ef5d644edaf52f5dc4b8'
         'b7a6a223f1181f369ddc632d5be514cb'
         'b09b28a696cb995c98444b099d834832'
         '5dfac90c2053e4e90b95d6287f0ca23f'
         'f42e7b0cb6cda7211fabf6aa92d15c0f'
         '049860834b8ac565e562e062545fa294'
         '45ab2bb0e32d6ca1f452a49e94e26589'
         '3ceaa1797c4d9f86c47087e0a6a0b37a'
         '330ea0a5385e6f61c7d40d044f5d9f9a'
         'f8716634c32e7a361120e105a382b686'
         '76db8a6275923a30fca9e23cbc019f5a'
         'e91b126160ebb3329754b4440c1d6d6d'
         '835424b2302d5b09d9257693a2a8c072'
         'b3ecbf95bd84a33a36e81f777474a728'
         '13eb628fd926d8236e17f1f30f10e89c'
         'af2c6ec2462d1513c40fb5e36179473d'
         'f1afdafa7a58df4ca4f3acabf7370b15'
         'eb11a6a2599b96c99be940cde45853bf'
         '8606e604fad0ce3e4821fee0a1ed61b1'
         'f74e5d3b8a31d65785a774a5525192fb'
         '4a78923e9e57b7f868dd3468e7934e67'
         'f5e252ccae469905f402438b31b3c0f3'
         '6e38647f310f273a692728ad303cdf4d'
         '49788cab942370a7f60ac56542d1703a'
         'aa04414878d5f0594faf6287cb46616b'
         'b51420798a2be039f60df7349bf437aa'
         'caaa8ef734ab591de4eb75edcc1069af'
         '82715fd9f8ee2466b03bf80aef1b9573'
         'f628c7bc238628278894c5df56035253'
         '4f196a298ff9055c64312fdb3b1276ac')
