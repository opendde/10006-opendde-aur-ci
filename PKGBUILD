# Maintainer: Rodrigo de la Fuente < rodrigo at delafuente dot email >
# Maintainer: pancho horrillo < pancho at pancho dot name >
# Contributor: Maxime Borges < contact at maximeborg dot es >
# Contributor: Carl George < arch at cgtx dot us >

_name="caddy"
pkgname="$_name-bin"
pkgver=1.0.4
pkgrel=3
pkgdesc='HTTP/2 Web Server with Automatic HTTPS'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://caddyserver.com'
license=('Apache')
backup=('etc/caddy/caddy.conf')
provides=("$_name")
conflicts=("$_name")
install='caddy.install'
source_x86_64=("https://github.com/mholt/caddy/releases/download/v${pkgver//_/-}/caddy_v${pkgver//_/-}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/mholt/caddy/releases/download/v${pkgver//_/-}/caddy_v${pkgver//_/-}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/mholt/caddy/releases/download/v${pkgver//_/-}/caddy_v${pkgver//_/-}_linux_arm7.tar.gz")
source=('https://caddyserver.com/v1/resources/images/brand/caddy-at-your-service-white.svg'
	'index.html'
	'caddy.service'
	'caddy.tmpfiles'
	'caddy.conf')
sha512sums=('fbe0a5bf505c414d9f7dc15b89efa3e03abeecd6e4674bac1db1d3ae6302977a0a605b9b9bc4b7a969f62c5dfa9aeeb0a0b7c705f1a8e793443ee51061d0a4c9'
            '7d8d308c9e262f0a2d6b84e996858ce4c7bb4816660c6ad1bbdafbf01d0eb35720cdccb12cc3418547e0dad6dbe87a0e6a3d15d519fb7d44d32f03f126a15117'
            'fa249c1fe22bd02cb7e6fbeaa5d31cf11cb61e89065597d17709425b1009b0bb9eb76de6a0ee5ec5c601712976a1b8819dd60e34c76eeb1e8f339f6363633e71'
            '3bf3a0c568be72717e935bbe0864f8fd6d472278f9d49974aed0fda9032103002f0158bf0ad32f374f80c06300c46d26f4c69798845b45b5234f7bdc594f4041'
            'c329cfa66428287cc554274790130f94f13d53d60a2d4ffba44a229913805f8bcf50e2df0073808009e57f026f2f0962d412cc38723719e6c248d90aaa4fdd33')
sha512sums_x86_64=('c3e7ac2ad1cba15ef3184784a08c4f1dc3b867d551476a0902a9d04d08d975cb8786daebc3ae074f9026296cb3214a331b8bfbea909e7b1a3e51ade73382d42b')
sha512sums_aarch64=('deaf5997d0378525ba0417361b56ed20e3a2f727c19519511251951709c443ae9cdb2b5530d82efa86042d45eb360306b10eccb2538969c80dcf88ca0d67f911')
sha512sums_armv7h=('c783d1bbcdf473d4319dfe8bd38e301b92bacb5643337e51a4f0cb4143f9b690ab963af1d7cef20f29683f0962d2b2b6cd88d1760dfc46dfdfd6373e89b0e3d8')

package() {
    install -D -m 0755 caddy "$pkgdir/usr/bin/caddy"
    install -D -m 0644 caddy-at-your-service-white.svg "$pkgdir/usr/share/caddy/caddy-at-your-service-white.svg"
    install -D -m 0644 index.html "$pkgdir/usr/share/caddy/index.html"
    install -D -m 0644 caddy.service "$pkgdir/usr/lib/systemd/system/caddy.service"
    install -D -m 0644 caddy.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/caddy.conf"
    install -D -m 0644 caddy.conf "$pkgdir/etc/caddy/caddy.conf"
    install -d -m 0755 "$pkgdir/etc/caddy/conf.d"
}
