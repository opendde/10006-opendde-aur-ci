# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2018.10.2
pkgrel=1
pkgdesc="An Argo Tunnel client which proxies any local webserver through the Cloudflare network"
arch=("x86_64" "arm")
url="https://developers.cloudflare.com/argo-tunnel/"
license=("custom")
depends=("glibc")
provides=("cloudflared")
conflicts=("cloudflared")
source=("https://raw.githubusercontent.com/cloudflare/cloudflared/master/LICENSE"
        "cloudflared.yml"
        "cloudflared@.service")
source_x86_64=("https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz")
source_arm=("https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-arm.tgz")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            '4e06eb54143d872f73707ed2bba2ba2198649d3066df741bd0cfda5d1a5f334d'
            'a2d6beef87b531ec43837ce1c2ebd7411058466a11bd6a899a8659582b25e3c2')
sha256sums_x86_64=('6796631fa08e95373402f761f9a6cb8cc909322eea04675ff8ac2f3bedaa4dee')
sha256sums_arm=('2492f78b7c49020232230150e574a628e47a0f96fedb795626dcb257fa3c915c')

package() {
    # Install License
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    # Install Binary
    install -Dm755 cloudflared ${pkgdir}/usr/bin/cloudflared

    # Configuration File
    install -Dm644 cloudflared.yml ${pkgdir}/etc/cloudflared/cloudflared.yml.example
    install -Dm644 cloudflared@.service ${pkgdir}/usr/lib/systemd/system/cloudflared@.service
}

# vim: ts=2 sw=2 et:
