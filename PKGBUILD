# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=i3status-rust-git
pkgver=0.13.0.r940.ga42de8b
pkgrel=2
pkgdesc='Very resourcefriendly and feature-rich replacement for i3status to use with bar programs (like i3bar and swaybar), written in pure Rust'
arch=('x86_64')
url='https://github.com/greshake/i3status-rust'
license=('GPL3')
depends=('libpulse')
makedepends=('git' 'rust')
optdepends=('alsa-utils: for the volume block'
            'bluez: for the bluetooth block'
            'curl: for the weather block'
            'fakeroot: for the pacman block to show pending updates'
            'ibus: for the ibus block'
            'lm_sensors: for the temperature block'
            'networkmanager: for the networkmanager block'
            'powerline-fonts: for all themes using the powerline arrow char'
            'pulseaudio: for the volume block'
            'speedtest-cli: for the speedtest block'
            'ttf-font-awesome-4: for the awesome icons'
            'upower: for the battery block')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=("${pkgname%-*}::git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
  cd "${pkgname%-*}"
  cargo build --release --features "pulseaudio"
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 target/release/i3status-rs "$pkgdir/usr/bin/i3status-rs"
  install -Dm644 man/i3status-rs.1 -t "$pkgdir/usr/share/man/man1"

  for example in example_config.toml example_icon.toml example_theme.toml; do
    install -Dm644 "$example" -t "$pkgdir/usr/share/doc/${pkgname%-*}/examples"
  done
}
