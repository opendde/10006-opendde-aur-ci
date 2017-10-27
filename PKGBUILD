# Maintainer: Papajoker <papajoke [at] webstratege [dot] fr>
# Based on PKGBUILDs:
#   `firefox-developer-de` by Leo Schwarz (evotopid) <mail@leoschwarz.com>
# Pour ajouter la clé : Mozilla Software
# $ gpg --keyserver pgp.mit.edu --recv-keys 14F26682D0916CDD81E37B6D61B7B526D98F0353

_name=firefox
_channel=developer
_lang=fr

pkgname="${_name}-${_channel}-${_lang}"
pkgdesc="Standalone (${_lang}) web browser from mozilla.org, developer build - French Francais"
url='https://www.mozilla.org/fr/firefox/developer/'
pkgver=57.0b12
pkgrel=1
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
source=("https://ftp.mozilla.org/pub/devedition/releases/$pkgver/linux-x86_64/$_lang/firefox-$pkgver.tar.bz2"
        "SHA512SUMS-$pkgver::https://ftp.mozilla.org/pub/devedition/releases/$pkgver/SHA512SUMS"
        "SHA512SUMS-$pkgver.asc::https://ftp.mozilla.org/pub/devedition/releases/$pkgver/SHA512SUMS.asc"
        "firefox-$_channel.desktop"
        "vendor.js")
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')
optdepends=(
	'pulseaudio: audio/video playback'
	'ffmpeg: h.264 video'
	'hunspell: spell checking'
	'hyphen: hyphenation'
)

provides=(firefox-developer)
conflicts=(firefox-developer)

validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')

_verify_checksum() {
    # Check if hash of the source archive matches the one provided by Mozilla (which was signed with GPG).
    _checksum=$(grep "linux-x86_64/$_lang/firefox-$pkgver.tar.bz2" "$srcdir/SHA512SUMS-$pkgver" | cut -f1 -d " ")
    _actual=$(sha512sum "$srcdir/firefox-$pkgver.tar.bz2" | cut -f1 -d " ")

    msg2 "test de l'intégrité de firefox-$pkgver.tar.bz2"

    if [[ $_checksum == $_actual ]];
    then
        msg2 "Checksum vérification ok."
    else
        msg2 "Checksum vérification erreur!"
        exit 1
    fi
}

package() {
    _verify_checksum

    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox $pkgdir/opt/firefox-$_channel

    ln -s /opt/firefox-$_channel/firefox $pkgdir/usr/bin/firefox-$_channel
    install -m644 $srcdir/firefox-$_channel.desktop $pkgdir/usr/share/applications/
    install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/firefox-${_channel}-icon.png
    install -Dm644 $srcdir/vendor.js $pkgdir/opt/firefox-$_channel/browser/defaults/preferences/vendor.js
}

sha512sums=('8d1c00c0ade64677a2266cd86375713697c8c09f02fc77fddd0b045f7b7403079fc6cd994befd308e2217a8ea0e067537b1cfbac87db05076ba9a2131958c1b6'
            '4f7d397c28d848634d7badf0c1b212b42f81a3b9fe704576c792a9e97e3d4adba4e316e7531574fa4435559adc297fda46ddd6ecea5244e080aeda01dc6f7bad'
            'SKIP'
            '59eb730388f7d2601f40bc3c42ae203e3b65820435adfdfb18cef5d530119304762779b2e493acfdf7bcadb60e2eac3d23304dcf379a1d583d677399ba654456'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
