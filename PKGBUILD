# Maintainer: kpcyrd <git@rxv.cc>

pkgname=recon-ng
pkgver=5.1.1
pkgrel=1
pkgdesc='A full-featured Web Reconnaissance framework written in Python'
url="https://github.com/lanmaster53/recon-ng"
license=('GPL3')
arch=('any')
depends=('python' 'python-pyaml' 'python-dnspython' 'python-lxml' 'python-mechanize'
         'python-requests' 'python-flask' 'python-flask-restful' 'python-flasgger'
         'python-dicttoxml' 'python-xlsxwriter' 'python-unicodecsv' 'python-rq')
source=("https://github.com/lanmaster53/${pkgname}/archive/v${pkgver}/recon-ng-${pkgver}.tar.gz"
        opt-in-analytics.patch)
sha256sums=('470e293e931c23a0dc76e6915098e04db7f2e254a0639bb2c0383e0758c4fbc2'
            '72d1e10a2b4bdbacb85bc8d3b430e406fc0ec5b7bf5cad85476cd29281053385')

prepare() {
  cd "${pkgname}-${pkgver}"
  # change analytics from opt-out to opt-in
  patch -Np1 -i ../opt-in-analytics.patch
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d "${pkgdir}/opt/${pkgname}"
  cp -ra --no-preserve=owner . "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  for bin in recon-ng recon-cli recon-rpc recon-web; do
    cat > "${pkgdir}/usr/bin/${bin}" << EOF
#!/bin/sh
cd /opt/recon-ng
exec python ${bin} "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/${bin}"
  done

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
