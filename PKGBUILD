# Maintainer: Matthias Loibl <mail@matthiasloibl.com>
# Maintainer: Kemal Akkoyun <kakkoyun@gmail.com>

pkgname=parca
pkgver=0.1.0
pkgrel=1

pkgdesc='Continuous profiling for analysis of CPU, memory usage over time, and down to the line number.'
url='https://parca.dev'
arch=('x86_64')
license=('Apache')

makedepends=('go' 'git' 'nodejs' 'yarn')

backup=('etc/parca/parca.yml' 'etc/conf.d/parca')

source=("parca-v$pkgver.tar.gz::https://github.com/parca-dev/parca/archive/refs/tags/v${pkgver}.tar.gz"
        parca.service
        parca.sysusers
        parca.conf)

sha256sums=('cd7d55999e72bf8a07a8e481701d80204e5a974da9489bd94ff376e6ff64c2f0'
            '7ed83cee9ef9b186fdb26e48f19d1f0d37960afe6d983341e253db6a23bf7fe6'
            '4e3462335427c83919a58c6060f194e4c45b76234b24f330a06b1ecf16789de0'
            'd917730e72fc1db483fc7a64e4ade9c4cebb91df9199b3981a3a107232602e23')

build() {
  # The makefile seems to not be able to execute npm properly, so run the make assets target manually
  cd $srcdir/parca-$pkgver/ui
  yarn install
  yarn workspace @parca/web build

  cd $srcdir/parca-$pkgver
  # Build the react app, normally a part of the assets target
  # make web/ui/static/react

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external" \
    ./cmd/parca
}

# Fails due to some proftest...
# check() {
#   cd $srcdir/parca-$pkgver
#   go test -short ./...
# }

package() {
  install -Dm644 parca.service "$pkgdir"/usr/lib/systemd/system/parca.service
  install -Dm644 parca.sysusers "$pkgdir"/usr/lib/sysusers.d/parca.conf
  install -Dm644 parca.conf "${pkgdir}"/etc/conf.d/parca

  cd $srcdir/parca-$pkgver

  install -Dm755 -t "$pkgdir"/usr/bin parca
  install -Dm640 -g parca -t "$pkgdir"/etc/parca parca.yaml
  install -dm750 -o parca -g parca "$pkgdir"/var/lib/parca
}
