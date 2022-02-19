# Maintainer: Que Quotion <quequotion@mailinator.com>

pkgname=throttlectl
pkgver=5
pkgrel=1
pkgdesc="Command-line user discretion power managment utility"
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?id=180762"
license=('GPL')
depends=('bash')
optdepends=('x86_energy_perf_policy' 'hdparm' 'nvidia-utils' 'iw' 'ethtool')
backup=(etc/throttle.d/{powersave,performance})
source=('throttlectl'
        'throttle-cut.service'
        'powersave'
        'performance')
sha512sums=('067bcb38ded98a571ce5005c7f755761e437df7d3a8cf777605f11b497b7ae11c3b4e2470ce0f322412b1571962d061b404e4b670715baa2f1134af404aca6d9'
            '6254e73446a91ea7945b9e4db1a1047eb2055d93aee315006857711ab21cba140da3badcf5834d2628e4799494a069647d11aa378a9bac67691df8d8b3adc12f'
            '926f7c787aea8c1027f331fe2e9417ba8e4f15a79f51610baafeed5d0de86d8f41da92f4460c29a5ce251e7cc110e26c2c344931af91949dc529595cc18c0f0e'
            '0d90ae4c0b9600f50ffd3e2c1a03b49d2fbdb9a2d14c8211e86463787549ada156498f68989d851952fe34660daaacc11242f5ee9e9e318f3d2a3eba0971eb53')

package() {
  install -Dm755 {${srcdir},${pkgdir}/usr/bin}/throttlectl
  install -Dm644 {${srcdir},${pkgdir}/etc/throttle.d}/powersave
  install -Dm644 {${srcdir},${pkgdir}/etc/throttle.d}/performance

  install -Dm644 {${srcdir},${pkgdir}/etc/systemd/system}/throttle-cut.service
  #install -Dm644 {${srcdir},${pkgdir}/etc/udev/rules.d}/throttle-runtime-pm.rules

}
