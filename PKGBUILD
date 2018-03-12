# Maintainer : blubbblubb <lampadada[removeme][at]googlemail[dot]com>

pkgname=nzb-monkey
_pkgname=nzbmonkey
pkgver=v0.2.1
pkgrel=1
pkgdesc="A Reference implementation of how to handle a NZBLNK-URI, with support for SABnzbd, NZBGet and Synology Download Station"
url="http://nzblnk.tech/nzb-monkey/"
arch=("any")
license=("MIT")
depends=("python" "python-pyperclip" "python-requests" "python-configobj"
        "python-colorama" "python-cryptography" "xdg-utils")
install="${pkgname}.install"
source=("https://github.com/nzblnk/${pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.tbz2")
sha256sums=('5095a3d1f6bbe1ce18950851481d36e5fccdf01acd36f9fef27410abf7b9edc9')

prepare() {
  # change to global folder instead of homepath
  sed -i "s+op.join(home, '.local/share/applications/')+'/usr/share/applications/'+g" "${srcdir}/${_pkgname}-${pkgver}-linux/nzblnkconfig.py"
  sed -i "s+op.normpath(op.dirname(__file__))+'/opt/${pkgname}'+g" "${srcdir}/${_pkgname}-${pkgver}-linux/nzblnkconfig.py"

  # dont open cfg file automatically
  sed -i "s+Popen(\['xdg-open', cfg.filename\])+pass+g" "${srcdir}/${_pkgname}-${pkgver}-linux/nzblnkconfig.py"
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  touch "${pkgdir}/opt/${pkgname}/${pkgname}.cfg"
  cp -r "${srcdir}/${_pkgname}-${pkgver}-linux/"* "${pkgdir}/opt/${pkgname}"
}
