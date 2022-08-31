# Maintainer: zhullyb <zhullyb [at] outlook dot com>
# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Bruce Zhang <zttt183525594@gmail.com>

pkgname=dingtalk-bin
_pkgname=dingtalk
_pkgname2=com.alibabainc.dingtalk
pkgver=1.4.0.20829
pkgrel=1
pkgdesc="钉钉"
arch=("x86_64")
url="https://www.dingtalk.com/"
license=("custom")
depends=("glu" 'gtk2')
#makedepends=("icoutils")
optdepends=('zenity: fix crashes when downloading files, not required on kde.')
provides=('com.alibabainc.dingtalk' 'dingtalk')
conflicts=('com.alibabainc.dingtalk')
replaces=('com.alibabainc.dingtalk')
# https://tms.dingtalk.com/markets/dingtalk/service-terms-zh md5 will change per download
source=("${_pkgname}_${pkgver}-${arch}.deb::https://dtapp-pub.dingtalk.com/dingtalk-desktop/xc_dingtalk_update/linux_deb/Release/${_pkgname2}_${pkgver}_amd64.deb"
        "service-terms-zh"
        "${_pkgname2}.desktop"
        "dingtalk.sh"
        "${_pkgname2}.svg"
        "https://archive.archlinux.org/packages/c/cairo/cairo-1.17.4-5-x86_64.pkg.tar.zst"
        'xdg-open.sh'
        )


# DebSource & pkgver can be get here: https://dtapp-pub.dingtalk.com/dingtalk-desktop/xc_dingtalk_update/linux_deb/Update/other/linux_dingtalk_update.json

sha512sums=('13e2b18db6f3dfa77525e8615633f712b1b4256f024405e67cb087a5d1ac9387138550436b47b013e621810da25551c34f2c9e76d498ecc3ba380e6ae1713362'
            'b83d493ed68be0f5a6b851fd93d819bb3a6e62feeb71a5bef10bad24b5ea8f3cf09deea4f31ed727449888a6eae1be99fa9cf263bc921cb8bb2958e2f37a7d64'
            'c8570ec4cd978e26ac622a83db053a0555324752f5000dc5b3cd680d782138e8ef856f09ec9b7850e04e1faa1e39de94dabeb16fbfbe0fd44af43247b30e8b2f'
            'a974db88cf2c0a7cac703dab5b4a84873273cd04a7904124122fde8bab7f9773704d3041816e0096bd3f7e383c012d3ff1e9b0482e241c2dd223ebb759734a88'
            '5f05f90704526fbd16371f6f9deaa171a3cac25a103b21daba72a3028ab7cdf9b566a3ac7842c6ce88d30cc29fe0c8b989c77aa36daab73793a827a1a0d6c775'
            '94a108a3f3f88bc7ede370d5e3f84afaedd78d892f7352926091881c066cbe0da55bebb5fc83978ca83c6420ed0c94fbba1f3454c5ff8d33a38669a0a11a80ac'
            '685f7eb38fd0e34aac3f1e1272f4c6f9404765decee82831b9fc4e743e0b0a022f8e49bd5623f524890a719af0b1333b96773fb386b74aeded4307e8b1a626ed')

prepare(){
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
}

package(){
    cd ${srcdir}

    mkdir -p ${pkgdir}/opt/${_pkgname}/release
    mkdir -p ${pkgdir}/usr/share/doc/
    mv opt/apps/${_pkgname2}/files/*-Release.*/* ${pkgdir}/opt/${_pkgname}/release
    mv opt/apps/${_pkgname2}/files/version ${pkgdir}/opt/${_pkgname}
    mv opt/apps/${_pkgname2}/files/doc/${_pkgname2} ${pkgdir}/usr/share/doc/${_pkgname}

    # binary wrapper
    install -Dm755 ${srcdir}/dingtalk.sh ${pkgdir}/usr/bin/dingtalk

    # desktop enrty
    install -Dm644 ${_pkgname2}.desktop -t ${pkgdir}/usr/share/applications/

    install -Dm644 ${srcdir}/${_pkgname2}.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg

    # license
    install -Dm644 service-terms-zh ${pkgdir}/usr/share/licenses/${_pkgname}/service-terms-zh.html

    # fix chinese input in workbench
    rm -rf ${pkgdir}/opt/${_pkgname}/release/libgtk-x11-2.0.so.*

    # fix cairo
    cd $srcdir/usr/lib
    install -Dm755 libcairo.so.2 -t ${pkgdir}/usr/lib/dingtalk

    # fix open url
    install -Dm755 $srcdir/xdg-open.sh ${pkgdir}/opt/dingtalk/release/xdg-open

    rm -rf ${pkgdir}/opt/${_pkgname}/release/{libm.so.6,Resources/{i18n/tool/*.exe,qss/mac},libstdc*}

    # remove unused lib
    rm -rf ${pkgdir}/opt/${_pkgname}/release/{libcurl.so.4,libz*}
}
