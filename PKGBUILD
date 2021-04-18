# Maintainer: Jhyub <seojanghyeob at gmail dot com>

pkgname='ttf-baemin'
pkgver=9
pkgrel=1
pkgdesc="The baemin series TrueType fonts provided by Woowa Bros."
arch=('any')
url="https://www.woowahan.com/#/fonts"
license=('custom:OFL')
source=(
    "http://d1mphx2csg3pcg.cloudfront.net/fonts/BMDOHYEON_ttf.ttf"
    "http://d1mphx2csg3pcg.cloudfront.net/fonts/BMEuljiro10yearslater.ttf"
    "http://d1mphx2csg3pcg.cloudfront.net/fonts/BMEULJIROTTF.ttf"
    "http://d1mphx2csg3pcg.cloudfront.net/fonts/BMHANNA_11yrs_ttf.ttf"
    "http://d1mphx2csg3pcg.cloudfront.net/fonts/BMHANNAAir_ttf.ttf"
    "http://d1mphx2csg3pcg.cloudfront.net/fonts/BMHANNAPro.ttf"
    "http://d1mphx2csg3pcg.cloudfront.net/fonts/BMJUA_ttf.ttf"
    "http://d1mphx2csg3pcg.cloudfront.net/fonts/BMKIRANGHAERANG-TTF.ttf"
    "http://d1mphx2csg3pcg.cloudfront.net/fonts/BMYEONSUNG_ttf.ttf"
    "LICENSE"
)
sha256sums=(
    '43a71996b1205786ba7a793d870d4f9d28b9dc71e22cc4c9078a5e5f24f23971'
    'f7dbed635efc674da7ef2c68fa0749362e7e78d1d584a21f6d0ce959cde5e79f'
    '9267f884385258c45b7e796dfa242508c756542a1a80059d03556e0d1903adf4'
    '7abaedf3f61f1613ff8833ad6319115ea1def5a2d1b5a1203a957d6abd2f8f18'
    '6f60f7d9615c22927acbc0073650cbeff776f2c6b0ca31c79529e074c9cebeba'
    '46dd67f836604840fe5abf9695d7982f396406260465fc225136ea23bed18e0a'
    'e8e6aa8b1b662c7bf0d7f136f29e822e0985176458a6e5d0ba08afc4a5c901a9'
    'd0973f3a497b42d999af2f163c63e2ebe4952c5de645d61228d2dbda13457a3f'
    '154d22ee908e6d5ac11acb3526a8dd5c6963a9379abe81330df0b1453080f63e'
    'ed5cb1c51fd39f0ddba6550978c0a6a0648b310571ec802ea9bd10c55a58e0f2'
)

package() {
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "${srcdir}"/*.ttf
    install -Dm644 -t "${pkgdir}/usr/share/licenses/$pkgname" "${srcdir}/LICENSE"
}
