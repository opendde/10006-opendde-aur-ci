# Maintainer: Christophe LAVIE <christophe.lavie@laposte.net>
# Contributor: Christophe LAVIE <christophe.lavie@laposte.net> 28/04/2019


pkgname=devolo-dlan-cockpit
pkgver=5.0.2
pkgrel=1
install=${pkgname}.install
pkgdesc="Display and configure settings of your devolo device"
arch=('i686' 'x86_64')
url="https://www.devolo.com/support/downloads/download/devolo-cockpit.html"
license=('nonfree')
depends=( 'adobe-air-sdk>=2.6' 'libgnome-keyring')

if [ "${CARCH}" = "x86_64" ]; then
  _arch="amd64"
else
  _arch="i386"
fi 

source=("https://www.devolo.fr/fileadmin/Web-Content/DE/Contentseiten/Downloads/Cockpit/devolo-cockpit-v${pkgver//./-}-linux.run"
  'devolonetsvc.service')


build() {
  cd $srcdir
  skip=$(grep -a -m1 -n "HERE_BE_DRAG[O]NS" "devolo-cockpit-v${pkgver//./-}-linux.run" | cut -d: -f1)
  tail "devolo-cockpit-v${pkgver//./-}-linux.run" -n +$((skip+1)) | tar -x -C .
  ar x "devolo-dlan-cockpit_${pkgver}-0_${_arch}.deb"
  find . -name "adobeair*${_arch}.deb" -print | xargs ar x
  tar xJf data.tar.xz
  sed -i 's/\.appdata\//~\/\.appdata\//g' "${srcdir}/opt/devolo/dlancockpit/bin/dlancockpit-run.sh"
  echo "StartupWMClass=dlancockpit" >> "${srcdir}/usr/share/applications/devolo-dlan-cockpit.desktop"
}

package() {
    cp -r "${srcdir}/opt" "${srcdir}/usr" "${pkgdir}/"
    ln -s "/opt/adobe-air-sdk/runtimes/air/linux/Adobe AIR/" "${pkgdir}/opt/Adobe AIR"
	mkdir -p "${pkgdir}/var/lib/devolonetsvc"
	printf "<?xml version="1.0" encoding="utf-8"?>\n<data_collection><allowed>2</allowed></data_collection>" > "${srcdir}/config.xml"
  	install -Dm644 "${srcdir}/config.xml" "${pkgdir}/var/lib/devolonetsvc/config.xml"  	
  	install -Dm644 "${srcdir}/devolonetsvc.service" "${pkgdir}/usr/lib/systemd/system/devolonetsvc.service"
 }
 
 
sha256sums=('0065a7b17a598499d49e4da2d8fd0b42b8182446a48dd0c3c75073e2b86331fb'
         '6f187ca5c7a599b5394ea09cd68885168dbd19b5bd72df5ce083e721e2f0a12c')
