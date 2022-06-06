# Maintainer 2021: Nadya <nadyushka228@riseup.net>
# Maintainer 2022-: spyophobia <76800505+spyophobia@users.noreply.github.com>
pkgname=cloak-obfuscation-bin
pkgver=2.5.2
pkgrel=1
pkgdesc='A pluggable transport that works alongside traditional proxy tools like OpenVPN to evade deep-packet-inspection based censorship'
arch=('x86_64' 'arm' 'aarch64')
url='https://github.com/cbeuw/Cloak'
license=('GPL3')
conflicts=("cloak-obfuscation" "cloak-obfuscation-git")
source=("${url}/archive/v${pkgver}.tar.gz")
source_x86_64=(
    "${url}/releases/download/v${pkgver}/ck-client-linux-amd64-v${pkgver}"
    "${url}/releases/download/v${pkgver}/ck-server-linux-amd64-v${pkgver}"
)
source_arm=(
    "${url}/releases/download/v${pkgver}/ck-client-linux-arm-v${pkgver}"
    "${url}/releases/download/v${pkgver}/ck-server-linux-arm-v${pkgver}"
)
source_aarch64=(
    "${url}/releases/download/v${pkgver}/ck-client-linux-arm64-v${pkgver}"
    "${url}/releases/download/v${pkgver}/ck-server-linux-arm64-v${pkgver}"
)

sha512sums=('f75ca585cd2aabfd2a3cd9c66686876ce8c1d58677d16053bf5e7c66e48068d6d73377313f9d67faa1c4ffef81e8f37754c275ea530a12df7f5b5de8dca71de1')
sha512sums_x86_64=(
    'd2b6d91d4cd49470096773824783d9b2f017dcfe5e647ee8165a4495b3f62d7e03d4dc84671a014e3cf0c13b0fe39240545045dc4bf7bb4bce47189d693120d2'
    '8daf98edcd611bf248cb3ea32cb44d2dc0d3ad31bfbbcc70b7fa25a10c6def1e07b51627a53ec8f477015d43ec3ce2c93a21638ad53f6a52909e594171a4d5d5'
)
sha512sums_arm=(
    'a294df11a23cd81f58ec0c3fb7ccb1f2fc843c33e648edf79da1c7de04b36d2615f32562d1fa28a578fda6d7a4c2df6a40b8b7618859f2df174ec95b8a6825d9'
    '364f9ff4126374ce00c1514b6006e84b020257d59b310faeabf012c9abc8e0f8e9b962fe9ae5c3d0632adfbbe2d900d2dd7a0075e026e6912de9a236d03af0ba'
)
sha512sums_aarch64=(
    '5d1ca5e039769248875f858e725e93eaf22363334f3ac920df67b9abd2e1359759c533726df691a643446d29beecff23f5aea2219fbb152043b762338167dd96'
    'c5b8db017b99c250aaa98f6a68ba0dfbb59181365ec843aaed30b46f06f81777518b87b6f2d644f07ee981f8a1f0cfd02681da0eff79926a92b9d4a328c5de99'
)

backup=(
    'etc/cloak/ckclient.json'
    'etc/cloak/ckserver.json'
)

package() {
    cd "${srcdir}"
    install -Dm 755 "ck-client-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/ck-client"
    install -Dm 755 "ck-server-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/ck-server"

    cd "${srcdir}/Cloak-${pkgver}/example_config"
    install -Dm 644 -t "${pkgdir}/etc/cloak" ckclient.json ckserver.json
}
