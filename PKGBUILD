# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de>
# Previous Maintainer: Will Adams <info at clementlumber dot com>
# Previous Maintainer: T. Jameson Little <t.jameson.little at gmail dot com>
# Previous Maintainer: Stephen Michael <ihateseptictanks at gmail dot com>
# Previous Maintainer: Simon Tunnat <simon+aur@tunn.at>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=firefox-esr-bin
_pkgname=${pkgname/-bin/}
pkgver=52.2.1
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - Extended Support Release'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('i686' 'x86_64')
depends=(gtk3 gtk2 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib ffmpeg
         libvpx libevent nss hunspell sqlite ttf-font icu)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'upower: Battery API'
            'speech-dispatcher: Text-to-Speech')
provides=('firefox=52')
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install
sha512sums=('e74be03c4a397afd06096e37a72a1ba4ecd99ed8ec0598964c77f8f2c9b5f231b8da3812a49b6e5c37644cdd873e6fabc6023ad0d5c87aee13641b79947fc444'
            '2c2c70cb48202d47e7d3b376b8181e7398b23bb83f5da7724f6290709fe1ff3dca9d9c5666310982569beeeba39ec2d55a4372819f9914c79c6583de7eec06ba'
            '8942b11a7cb3761de1185491397185743adf49daa27a2806d14a328a2be8e2cb566c71dc6449016549cb3bd0d328cfe15944490be749a4add213194f6153c3d0')
[[ "$CARCH" == "i686" ]] && 
sha512sums[0]='d9b34886542fd7a836b49f9116039c9c2eef67afe5a6d4b09112c0635489dd421eca8630c472b3a461b4877c068a438d5b481e263c6a377a5f08ff44b7d8557b'
# if [[ -n "$FIREFOX_ESR_BIN_PREFER_OLDER" ]]; then
    # pkgver=38.8.0
    # provides=('firefox=38')
    # sha512sums[0]='644dec9233a30b8929e8eb38aecab6f78be234c08c62fa038f7c8f5b8bdfed50ba053a402f92747e730147107d6e3408a21641de93792d35dc87967017065c90'
    # [[ "$CARCH" == "i686" ]] && sha512sums[0]='25bd1f1be5c62b3b5acfae25bfefdb87ea20594730f1dec43ddec4af3d56b1b5b586c78f28595cda9c15904eb8d0b4806c312337d48d872361769a4fc81e3df3'
# fi
source=(http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}esr/linux-$CARCH/en-US/firefox-${pkgver}esr.tar.bz2
        $_pkgname.desktop 
        $_pkgname-safe.desktop)

package() {
    cd $srcdir
    
    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox/ $pkgdir/opt/$_pkgname

    ln -s /opt/$_pkgname/firefox $pkgdir/usr/bin/$_pkgname
    install -m644 $srcdir/{$_pkgname.desktop,$_pkgname-safe.desktop} $pkgdir/usr/share/applications/
    install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
}
