# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel tools: imgpkg kapp kbld kctrl kwt vendir ytt"
pkgver=20221128
pkgrel=1
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
provides_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides_aarch64=(imgpkg kapp kbld kctrl vendir ytt)
conflicts_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
conflicts_aarch64=(imgpkg kapp kbld kctrl vendir ytt)

source_x86_64=(
imgpkg-v0.34.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.34.0/imgpkg-linux-amd64
kapp-v0.54.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.54.0/kapp-linux-amd64
kbld-v0.36.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.36.0/kbld-linux-amd64
kctrl-v0.43.2::https://github.com/vmware-tanzu/carvel-kapp-controller/releases/download/v0.43.2/kctrl-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
vendir-v0.32.1::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.32.1/vendir-linux-amd64
ytt-v0.44.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.44.0/ytt-linux-amd64
)
sha256sums_x86_64=(
e9b69dfd38e6d09f87ddbf8b2356cbf4d41172a84304640ecafe6be4841304d9
886cd9d634214904ee34f44510abe85ce60acbbe4529131ad97bee387d6327fe
bbae1d86b627b1a78cf9d0e1b911377fa55f2dbc058b964cdada8382bf6432dd
3fdf5dd5f01e1558da15a2b53ae98758765b3853f0601697fe5b7903b1a6abe5
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
2030c324150b43f9c5af5b8b89a88f3787e20fd19cec4ec1d0fce3cf32432e43
b3fbce9c6828c7eea09491c24fe49ddba7afe09e4405db33373d2776c91b1e6c
)
source_aarch64=(
imgpkg-v0.34.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.34.0/imgpkg-linux-arm64
kapp-v0.54.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.54.0/kapp-linux-arm64
kbld-v0.36.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.36.0/kbld-linux-arm64
kctrl-v0.43.2::https://github.com/vmware-tanzu/carvel-kapp-controller/releases/download/v0.43.2/kctrl-linux-arm64
vendir-v0.32.1::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.32.1/vendir-linux-arm64
ytt-v0.44.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.44.0/ytt-linux-arm64
)
sha256sums_aarch64=(
09b201aa142102f7db5655963b59e8f890580f86be658dfc0460f4b0b2e881b0
1afa5624183464b4c9dca7a7f63ea51c7f78d74a722e11ec4a774c8e68fb5784
d7e182e1544a34fd3bc7dcd5c8bb347216a651ffc33e1130c08889d3adc01335
3d2588967d708bcf3b1f1371b48744e30281c25c2296c75e975cb82b8c12f588
a65c2e5ae21d8994b06be4eef92ec34ee6f1b905ccc4e1705b227603ea7614b2
4d36b859c01d9899e87a65e5533cb37ab62b17ee8120dd0454b417608130e431
)
package() {
[[ -f "${srcdir}/imgpkg-v0.34.0" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.34.0" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/kapp-v0.54.0" ]] && install -Dm 755 "${srcdir}/kapp-v0.54.0" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kbld-v0.36.0" ]] && install -Dm 755 "${srcdir}/kbld-v0.36.0" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kctrl-v0.43.2" ]] && install -Dm 755 "${srcdir}/kctrl-v0.43.2" "${pkgdir}/usr/bin/kctrl"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/vendir-v0.32.1" ]] && install -Dm 755 "${srcdir}/vendir-v0.32.1" "${pkgdir}/usr/bin/vendir"
[[ -f "${srcdir}/ytt-v0.44.0" ]] && install -Dm 755 "${srcdir}/ytt-v0.44.0" "${pkgdir}/usr/bin/ytt"
}
