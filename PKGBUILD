pkgname="ffmt-bin"
fullpkgname="FFXIV_Modding_Tool"
pkgver="0.9.3.1"
pkgrel="1"
pkgdesc="FFXIV_Modding_Tool (FFMT for short) is a crossplatform commandline interface for Final Fantasy XIV Modding."
arch=('i686' 'x86_64')
url="https://ffmt.pwd.cat/docs/"
license=("GNU General Public License v3.0")
depends=("dotnet-runtime")
source=("https://github.com/fosspill/FFXIV_Modding_Tool/releases/download/v${pkgver}/FFXIV_Modding_Tool.zip")
sha256sums=("d0b6621243aeb7e094656c26917ebefe373e97c85cb7d65bcca498bad7fff66f")

package() {
    cd $srcdir
    install -dm755 ${fullpkgname}/ffmt "${pkgdir}/opt/ffmt"
    cp -r ${fullpkgname}/ffmt/* "${pkgdir}/opt/ffmt/"
    install -Dm755 ${fullpkgname}/ffmt.sh "${pkgdir}/usr/bin/ffmt"
}
