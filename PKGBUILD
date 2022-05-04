# Maintainer: Anthony Wang <ta180m@pm.me>
# Contributor: ny-a <nyaarch64 at gmail dot com>
# Contributor: Daniel Moch <daniel@danielmoch.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>

pkgname=mastodon
pkgver=3.5.2
pkgrel=2
pkgdesc='Your self-hosted, globally interconnected microblogging community'
arch=(x86_64)
url=https://github.com/mastodon/mastodon
license=(AGPL3)
depends=(ffmpeg
         imagemagick
         libidn
         libpqxx
         libxml2
         libxslt
         libyaml
         nodejs
         postgresql
         redis
         ruby-bundler
         protobuf
         yarn
         zlib)
makedepends=(git)
backup=(etc/mastodon.conf)
install=mastodon.install
options=(!strip)
source=(https://github.com/mastodon/mastodon/archive/v$pkgver.tar.gz
        mastodon.target
        mastodon.sysusers.d
        mastodon.tmpfiles.d)
sha512sums=('de9def1681f394872bf5959d8dab2f0434f519183028924664177e61cd361aea6d48d265d06c63f40624be16506102e30b510fbc720c4708286528d946e5e9d4'
            'c9820c2a83d08bd5d842a78e924682db97ebd5c7291b682603ad30dafcdcc5816c13e717ad39554f042b9d9ed71ab902ce3f604952264a900a72612ee8060acb'
            '4ee4210bde391e6dc782cb7c14f2cb968c95ad541aa0efcf843a811f8cc5f0d1067ee3c8346bb412aa9fd1dd5a8bd05a4524df7dc4a106957009853dd237074a'
            '27c4eb01d462c525b59e5808a3b2501b63a34425752128388fbde82f7eb5944b20d2f8d8b1be8ed8adb165cab4cfb8e13f90215f20989ca671a0422ffa37001f')

prepare() {
  cd mastodon-$pkgver

  # Allow use of any bundler
  sed -i -e '/BUNDLED/,+1d' Gemfile.lock
}

build() {
  cd mastodon-$pkgver
  bundle config set deployment 'true'
  bundle config set without 'development test'
  bundle install -j$(getconf _NPROCESSORS_ONLN)
  yarn install --pure-lockfile
}

package() {
  install -d "$pkgdir"/{var/lib,etc}
  cp -a mastodon-$pkgver "$pkgdir"/var/lib/mastodon

  # Put the config file in /etc and link to it
  touch "$pkgdir"/etc/mastodon.conf
  ln -s /etc/mastodon.conf "$pkgdir"/var/lib/mastodon/.env.production
  ln -s /usr/bin/node "$pkgdir"/var/lib/mastodon/node

  install -Dm 644 mastodon.target -t "$pkgdir"/usr/lib/systemd/system
  install -Dm 644 mastodon.sysusers.d "$pkgdir"/usr/lib/sysusers.d/mastodon.conf
  install -Dm 644 mastodon.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/mastodon.conf

  cd mastodon-$pkgver/dist

  # Fix path discrepancies
  sed -e 's/home\/mastodon\/live/var\/lib\/mastodon/g' \
    -e 's/home\/mastodon\/.rbenv\/shims/usr\/bin/' \
    -i mastodon-*.service

  install -Dm 644 mastodon-*.service -t "$pkgdir"/usr/lib/systemd/system
}
