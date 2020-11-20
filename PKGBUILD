# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Sans serif font with rounded tips by Vernon Adams.'
pkgname=ttf-nunito
pkgver=3.6
pkgrel=1
arch=(any)
license=(custom:OFL)
url=https://github.com/googlefonts/nunito
_commit=f4ef4a4db5ef1d68db51323bbcd9bbc41b7a9373
_dl_base_url="${url}/raw/${_commit}/fonts/TTF"
source=("${_dl_base_url}/Nunito-Black.ttf"
        "${_dl_base_url}/Nunito-BlackItalic.ttf"
        "${_dl_base_url}/Nunito-Bold.ttf"
        "${_dl_base_url}/Nunito-BoldItalic.ttf"
        "${_dl_base_url}/Nunito-ExtraBold.ttf"
        "${_dl_base_url}/Nunito-ExtraBoldItalic.ttf"
        "${_dl_base_url}/Nunito-ExtraLight.ttf"
        "${_dl_base_url}/Nunito-ExtraLightItalic.ttf"
        "${_dl_base_url}/Nunito-Italic.ttf"
        "${_dl_base_url}/Nunito-Light.ttf"
        "${_dl_base_url}/Nunito-LightItalic.ttf"
        "${_dl_base_url}/Nunito-Regular.ttf"
        "${_dl_base_url}/Nunito-SemiBold.ttf"
        "${_dl_base_url}/Nunito-SemiBoldItalic.ttf"
        "${_dl_base_url}/NunitoHeavy-Regular.ttf"
        "${_dl_base_url}/NunitoHeavy-Italic.ttf"
        "${url}/raw/master/OFL.txt")
sha512sums=('447d21234e7e5c60d6ead559def18530a4bb14d27949a2950dcf5ccfab0df7c041047b99c431656cdfb46db697de64abbc266339cc8f4ddc59c4ba08d824d68e'
            '850e57e49a0cff1f7bf2672801048f87e55d80ca4b3e5ebba1177408e371d1c76c4ceaa1e1661c413883e011e35380fac29e4e35d563512fbd6f6edf8aaf341e'
            '15e5514034a7ef6fc2b8d018fdb6fdb31e367522912fd65d9a0ee0bd513f104d93731d911e5a47b7f64ef3c4cab2dba53a86594debbe80e66acb9ee656db34a6'
            'c64d9efeff4360e7ed42e60cd79f1e4955cebb2cb9d4214e409be35e6bd35192901cbc608190042b93f843caa1694f0d24c8563e228007ff239bfebfa4896b97'
            '330925bdc1adec29d84afac5b6f7088dfdfd053c336a72f813fce0bdc2c2992f1a4093344d1dffa1a608b3c75f14706f0df1c6cab31c318ad7ef807434849c27'
            '9c3eac5f76c24e009deea2da45de088475b69c493b58905d7e3c559b9e1cab1ef570fae0f23079d5cfbeb29f1a2d09578448110da5e265c01495e6c0a14b825a'
            '86a4f44e43619f18c892379e40e5ceca08b53a5e192ecf4ab8a36afbdfcb2d3d5ad0e2b7a5de88b14ca6f97e8730a5901c9a3cd811ed76f36a98a6d517aa7fde'
            '517cbbd0b0acc0f0c24fc37cb2c61a6ede8ae9d00eedd8dbf7dd8d114240fe276e1e905bd7f8f28f55072fe90739a8a4b6978e5f82368f406d5d6a09c347625f'
            '2d961bbba31b20aebc1041d8a51c31c98fc32a2baaa12f3d04483cce4f656077818003db3a772d22641f50b2482768af991885222f7aa66dd3f748b5ec2b8441'
            'ae8fc36ca7cd165d0a380dbb8a67c0618eacdc02097578bc7a2cc8169d5b40b0d00c57de96a8869e8b62540d56997f7ca2e903f712f0c90b639acbf38963149b'
            '8f5837e697b01d7c387200aae8b2e2bedcede5524236af6532074d68f1b01ec0c90a13479f96e0148e980c476c1ccbc6b062975c40c16556b110487f125fbacb'
            '3990a7d13951da132fc56f2d91f0f2cc5affe314ca9f50605689da2a189b4a747b5eb83bae577e7125ab99cd879ad27e1066a65e02a0398c6e3855cd088515de'
            'b6e82835267b0fe05e587547593bd061060679df9ee8a6774dbc72972699aff58adac473c598e03e4bedac48ee6dfa87dd2704f0ef1a7b87940f397c79efe008'
            'ae8f63afcdca8182284a7e31263d70abfd6b84d693985e854ba7f5acd5da76f9edf2f71a4f1aee893d7e7e0c0208ca450d3b8562cd63a12c0bc0ae70ff122449'
            '8db2ee4b5cc6c1a98a5bc48acbda314ed12cdf8125caa4d89a1f9037afa165d054aa035ef0e9c3fac095c94509a17d9c36645e2ac0bf1eb917960fbe737e9ca9'
            'c8f0684ed7a3c8e109695029f52a42cfd0ba35ca0daac131e8e10c599d8cb9cc2e038f6d4cf86f5d91028e47e20f2659fd6af025c5ce6d7c4a23966971cc4c08'
            '068569d289978824bdcec69636978705f74c368fb91a816059bbacb58ad23cf31ce9d643cdd165d60c98b84412f411c92e29034dbfbba71c13eff9033d482ab6')

package () {
        install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" "${srcdir}"/*.ttf
        install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}"/OFL.txt
}
