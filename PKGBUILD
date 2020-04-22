# Maintainer: Yacob Zitouni <yacob.zitouni at gmail dot com>

pkgname=tso-version-patcher-bin
pkgver=1.0
pkgrel=1
pkgdesc=".NET Core filesystem patcher based off of BsDiff. For patching TSO v1.1239.1.0 back to N&I, but can be used for anything."
arch=("x86_64")
url="https://github.com/riperiperi/TSO-Version-Patcher"
license=("MPL2")
depends=("mono")
provides=("tso-version-patcher")
source=("https://github.com/riperiperi/TSO-Version-Patcher/releases/download/v$pkgver/Release.zip"
        "tso-version-patcher.sh")
md5sums=('0815e2bef5942cfee82d41577a71250c'
         'a8ceab8e1f7933e872ad6d069a167470')

package() {
    install -d "$pkgdir"/usr/lib/tso-version-patcher
    install -d "$pkgdir"/usr/share/tso-version-patcher
    install -Dm755 bz2* "$pkgdir"/usr/lib/tso-version-patcher
    install -m755 deltaq.dll "$pkgdir"/usr/lib/tso-version-patcher
    install -m755 TSOVersionPatcherF* "$pkgdir"/usr/lib/tso-version-patcher
    install -Dm644 1239toNI.tsop "$pkgdir"/usr/share/tso-version-patcher
    install -Dm755 tso-version-patcher.sh "$pkgdir"/usr/bin/tso-version-patcher
}

