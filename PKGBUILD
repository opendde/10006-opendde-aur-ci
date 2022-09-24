# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-chivo-mono
pkgver=1.007
pkgrel=1
pkgdesc='Neo-grotesque monospaced typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/chivo/'
license=('OFL')
_commit='82cecb4b8c2af9aa74a1c2745987f7e463025ad1'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-Black.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-BlackItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-Bold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-BoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-ExtraBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-ExtraBoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-ExtraLight.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-ExtraLightItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-Italic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-Light.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-LightItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-Medium.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-MediumItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-Regular.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-SemiBold.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-SemiBoldItalic.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-Thin.otf"
        "https://raw.githubusercontent.com/Omnibus-Type/Chivo/${_commit}/Chivo-Mono/otf/ChivoMono-ThinItalic.otf")
sha256sums=('5e4ab199aee98d04ca9bed9088b793291dd03e4d775876012ab4f14de77af3fa'
            '40ec1060036ba10cde389ca7910e882ebcb051ee374129117219460cde80eb58'
            '01b3b8a48ba935dd256450f7bd8259e131797cb011f9793738466d870eb0d17f'
            '9c47e17b570df31f701e085030145cfa717a34f3da1083a7598e9a076cd8b512'
            '64dae0367b96b03f31bc06578818aa8fa00c1d63b992bcccfaa07b814e7e3d83'
            '1242932ab5f75d6b090acf1077c83584e64006d31558755fce112bc4fc498766'
            '48ec6b5d2da877f06e056c1ce479e403467ab21f28c730eeb754c10506c0b736'
            '6003c64088ff5198185e2ba8a6d1b097f6a0aed83523e134c4babcf3a626b109'
            'c7749dff61b914425d6625c87fc68c92741d4a6bb5ee60524fb4148684357fab'
            'eea00514c8ba8ea7d04a862afc7a24aee9383ab73663f0aa3be2eac27b315a83'
            'c5c6cf3b498761a90e4f9f37ba7384701f02b282ad966444ce746bb60e417f81'
            'baf91dacc6974c03f96799e304dda0655684c79ed21e570db4850c55d2122bc2'
            '7e945f6f075acd265914292bf2e789567f6a1edcc8b210ad79fbf7956dca0be0'
            '588717cec0bbe478c830a74aff7d3a0f6fab322d9e0bc30f6c6f1207dd5598a9'
            '62c6ba22de5dab65d04763b31f56d179f8faef0afaa5361d0f0539a1446c917f'
            'f23a75d3ca1262456211365e35b0c545d7361a5b77b2cf41d8caa4ae631c6aff'
            'e15cbec220f0191135b5d69526dee0b0f195df22ed0a425c81f05193c249aba7'
            '24eecc03c0da23ad4c651270134854b0066f9385628ba81198a740df1ccb5712'
            'cb9ea84f863035fe5bdcab5dd5740fc102a0b23171ddc3308b4f5eaa6e8985c4')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
