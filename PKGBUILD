# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
# Maintainer: Allen Zhong <zhongbenli@pingcap.com>
pkgname=tikv
pkgver=3.0.10
pkgrel=2
pkgdesc='Distributed transactional key-value database, originally created to complement TiDB'
makedepends=('go' 'make' 'rustup' 'awk' 'cmake' 'gcc')
arch=('x86_64')
url='https://github.com/tikv/tikv'
license=('Apache')
provides=('tikv-server')
backup=(etc/tikv/tikv.toml)
depends=('tikv-pd' 'gcc-libs')
source=(tikv-${pkgver}.tar.gz::https://github.com/tikv/tikv/archive/v${pkgver}.tar.gz
        "pr-6704.patch::https://patch-diff.githubusercontent.com/raw/tikv/tikv/pull/6704.patch"
        tikv.service
        tikv-sysusers.conf
        tikv-tmpfiles.conf
        tikv.toml)
sha256sums=('72b0388d8c5c746d11a16baaa12dc1753e83031997b1c7dc8b4f2f48123b17c4'
            '6604c22b6e1f8cd2ae6a4296e3e98bbf40b99e796840b34c34a2a773baed2a81'
            '870b8eaf83bc0d22b05b0f3a7890660e483cf77bb1d84bc50ad04fb23068cd8c'
            '744b252e29099b0099dc41e30bc3badd33b3d661c7126af8044faa4fc2df8927'
            '935291bac6a216c6f880df9bfaec8900266413bb202ac483e79f291e1f28e9f1'
            '24aff9d7aa90a18ac3a0474f4e4575baa5051a7ee0bb9a4c3a3d4aff49af7ac7')

prepare() {
    cd tikv-${pkgver}

    # apply upstream patch
    patch -Np1 -i ../pr-6704.patch

    rustup component add rustfmt-preview

    # patch Makefile
    sed -i 's/cargo build/cargo build --locked/g' Makefile
}

build() {
    cd tikv-${pkgver}

    # Remove all git operations.
    sed -i '/TIKV_BUILD_GIT_/d' Makefile

    export TIKV_BUILD_GIT_HASH=v$pkgver
    export TIKV_BUILD_GIT_BRANCH=release

    make build_release
}

package() {
  # Install binary
  install -Dm755 "$srcdir/tikv-${pkgver}/target/release/tikv-ctl" "$pkgdir/usr/bin/tikv-ctl"
  install -Dm755 "$srcdir/tikv-${pkgver}/target/release/tikv-server" "$pkgdir/usr/bin/tikv-server"
  install -Dm755 "$srcdir/tikv-${pkgver}/target/release/tikv-importer" "$pkgdir/usr/bin/tikv-importer"
  # Install systemd service
  install -Dm644 "$srcdir/tikv.service" "$pkgdir/usr/lib/systemd/system/tikv.service"
  # Install sysusers
  install -Dm644 "$srcdir/tikv-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/tikv.conf"
  # Install tmpfiles
  install -Dm644 "$srcdir/tikv-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/tikv.conf"
  # Install default config
  install -Dm644 tikv.toml "$pkgdir/etc/tikv/tikv.toml"
}

# vim: ft=sh syn=sh et
