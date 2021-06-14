# Maintainer: Adel Khial <adel.khial@gmail.com>
pkgname=ttf-tajawal
pkgver=1.0
pkgrel=1
pkgdesc="Tajawal is a distinctive modern typeface, available in seven weights."
arch=(any)
url=https://github.com/googlefonts/tajawal
license=(custom:OFL)
source=("Tajawal-Black.ttf::https://raw.githubusercontent.com/googlefonts/tajawal/main/fonts/ttf/Tajawal-Black.ttf"
        "Tajawal-Bold.ttf::https://raw.githubusercontent.com/googlefonts/tajawal/main/fonts/ttf/Tajawal-Bold.ttf"
        "Tajawal-ExtraBold.ttf::https://raw.githubusercontent.com/googlefonts/tajawal/main/fonts/ttf/Tajawal-ExtraBold.ttf"
        "Tajawal-ExtraLight.ttf::https://raw.githubusercontent.com/googlefonts/tajawal/main/fonts/ttf/Tajawal-ExtraLight.ttf"
        "Tajawal-Light.ttf::https://raw.githubusercontent.com/googlefonts/tajawal/main/fonts/ttf/Tajawal-Light.ttf"
        "Tajawal-Medium.ttf::https://raw.githubusercontent.com/googlefonts/tajawal/main/fonts/ttf/Tajawal-Medium.ttf"
        "Tajawal-Regular.ttf::https://raw.githubusercontent.com/googlefonts/tajawal/main/fonts/ttf/Tajawal-Regular.ttf"
        "OFL.txt::https://raw.githubusercontent.com/googlefonts/tajawal/main/OFL.txt")
sha256sums=('f8f771e0440c6f2bee0ce80139e1c4724984d6c783bef552694edf56bf3540f9'
            '7aefa2d69880dd8e7da19757b3eed9c7dcaa0a4a267815bd637f0d3187595359'
            '1220e0bd4b4226e0f8dbd41c4bab08070557f31d98a0d2549e2c16658b7bf91c'
            '277220227056f05dd455784d4d70383680ff432552ba3b3d4985d3b41cb37af1'
            'f44c5383551a01f7a522dd4a1c32f4bdea6e9e78f2fd9f8ee9b0f970d5479bf7'
            'd57892ab617d1bc7549ffa6fc1be0e6c377c51b6623e57097f3edefb190c5f3f'
            '2896e6bdfbaca32884b4d96692202d8d9bdf13b4d04c39380e71569a22885bf5'
            '04f4f5e3ff39bafcc63b9ff6aedf1d42aa26ab04e109dd2964fb537f1d0e5c45')

package() {
        install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" *.ttf
        install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" OFL.txt
}
