# Maintainer: Andreas Linz <alinz@klingt.net>
# Based on `caddy=all-features` by Eric Engestrom: https://aur.archlinux.org/packages/caddy-all-features/
# Enable Cross Origin Resource Sharing

_features=('awslambda' 'cors' 'filemanager' 'git' 'hugo' 'ipfilter' 'jwt' 'locale' 'mailout' 'minify' 'multipass' 'prometheus' 'ratelimit' 'realip' 'search' 'upload' 'cloudflare' 'digitalocean' 'dnsimple' 'dyn' 'gandi' 'googlecloud' 'namecheap' 'rfc2136' 'route53' 'vultr')

# https://caddyserver.com/download/build?os=linux&arch=amd64&features=filemanager%2Cgit%2Chugo%2Cipfilter%2Cjwt%2Clocale%2Cmailout%2Cminify%2Cprometheus%2Crealip%2Csearch%2Ccloudflare%2Cdigitalocean%2Cdnsimple%2Cdyn%2Cgandi%2Cgooglecloud%2Cnamecheap%2Crfc2136%2Croute53%2Cvultr

pkgname=caddy-full-bin
_realname=caddy
pkgver=0.9.3
<<<<<<< HEAD
pkgrel=4
=======
pkgrel=2
>>>>>>> Patch caddy's systemd service file to reenable capabilities
pkgdesc="A configurable, general-purpose HTTP/2 web server for any platform (All features enabled)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://caddyserver.com"
license=('Apache')
provides=('caddy')
conflicts=('caddy' 'caddy-git' 'caddy-all-features')
depends=('systemd>=229' 'patch')
md5sums_i686=('SKIP'
              '61c39378589e5c59314e7a157fbf9a53')
md5sums_x86_64=('SKIP'
                '61c39378589e5c59314e7a157fbf9a53')
md5sums_armv7h=('SKIP'
                '61c39378589e5c59314e7a157fbf9a53')
md5sums_aarch64=('SKIP'
                 '61c39378589e5c59314e7a157fbf9a53')
install='caddy-full-bin.install'

# expand the feature array
printf -v _features '%s,' "${_features[@]}"
# remove subsequent ,
_features=${_features%,}
_url_prefix="https://caddyserver.com/download/build?os=linux&features=${_features}"

<<<<<<< HEAD
source_i686=("caddy.tar.gz::http://bit.ly/2djygqB" "caddy-systemd-service.patch")
source_x86_64=("caddy.tar.gz::http://bit.ly/2daBvir" "caddy-systemd-service.patch")
source_armv7h=("caddy.tar.gz::http://bit.ly/2d99iES" "caddy-systemd-service.patch")
source_aarch64=("caddy.tar.gz::http://bit.ly/2cMNaAA" "caddy-systemd-service.patch")
=======
source_i686=("caddy.tar.gz::${_url_prefix}&arch=386" "caddy-systemd-service.patch")
source_x86_64=("caddy.tar.gz::${_url_prefix}&arch=amd64" "caddy-systemd-service.patch")
source_armv7h=("caddy.tar.gz::${_url_prefix}&arch=arm" "caddy-systemd-service.patch")
source_aarch64=("caddy.tar.gz::${_url_prefix}&arch=arm64" "caddy-systemd-service.patch")
>>>>>>> Patch caddy's systemd service file to reenable capabilities

prepare() {
  patch -p0 -i caddy-systemd-service.patch
}

package() {
  echo "Migration guide for caddy <0.9: https://github.com/klingtnet/caddy-AUR/blob/master/README.md"
  install -Dm755 "${srcdir}/caddy" "${pkgdir}/usr/bin/caddy"
  install -Dm644 "${srcdir}/init/linux-systemd/caddy.service" "${pkgdir}/usr/lib/systemd/system/caddy.service"
  install -Dm644 "${srcdir}/init/linux-systemd/README.md" "${pkgdir}/usr/share/doc/${_realname}/service.txt"
  install -Dm644 "${srcdir}/LICENSES.txt" "${pkgdir}/usr/share/licenses/${_realname}/LICENSE"
  install -Dm644 "${srcdir}/README.txt" "${pkgdir}/usr/share/doc/${_realgname}/README.md"
}
