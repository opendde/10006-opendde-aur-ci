# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Emil Vanherp <emil dot vanherp at hotmail dot com>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Xavier D. <magicrhesus at ouranos dot be>
# Contributor: Valere Monseur <valere dot monseur at ymail dot com>

pkgname=eid-mw
pkgver=4.3.3
pkgrel=1

pkgdesc='The middleware, viewer and Firefox extension for the Belgian electronic identity card (Belgian eID)'
arch=('i686' 'x86_64')
url='http://eid.belgium.be/'
license=('LGPL3')

depends=('gtk3' 'libproxy' 'curl')
optdepends=(
    'firefox: extension for Belgian eid'
    'acsccid: ACS CCID smart card readers'
    'ccid: A generic USB Chip/Smart Card Interface Devices driver'
    'pcsc-tools: PC/SC smartcard tools')
conflicts=('eid-viewer')
replaces=('eid-viewer')

# It has been decided upstream not to sign sources using the GPG key as this
# was confusing users who are not used to use .asc signature files.  So while
# the binaries proposed on this page
# https://eid.belgium.be/en/using_your_eid/installing_the_eid_software/linux
# are signed, the sources are not.  For security-conscious users, it is asked
# to use the dist server instead.
#
# On Wed, Mar 29, 2017 at 11:08:34AM +0200, William Gathoye wrote:
# > On 03/29/2017 10:54 AM, Wouter Verhelst wrote:
# >> It is not meant for the security-conscious. If you want to be 100%
# >> certain, then https://dist.eid.belgium.be/continuous/sources/ is signed
# >> by a GPG key.
# >
# > Ok. I'm gonna switch to that channel again then (for Arch).
#
# Good, I was hoping you'd say that 
#
# > But then why do you have specified on the eid.belgium.be page that the
# > binaries could be checked using the GPG key
# > B37D9040098C3DEEE00F6D08A35743EA6773D225 as we cannot check it as the
# > .asc file is not present.?
#
# The precompiled binaries in the repositories that can be found on
# files.eid.belgium.be (and for which the "eid-archive" packages on that page add
# configuration to supported distributions) *are* signed with that key. The
# sources aren't, for reasons as explained above.
#
# >> Yes, I know, I set that up (by request of the then-current arch
# >> maintainer, as it happens)
# >
# > Yes, indeed. wget is me. I'm AM the Arch Linux. Thanks for taking this up 
#
# I know, but it was your predecessor ("Alad") who asked for that, and by
# whose request I set that up.
#
# [...]
source=(
    "https://dist.eid.belgium.be/continuous/sources/$pkgname-$pkgver-v$pkgver.tar.gz"{,.asc}
)
sha512sums=(
    aa213003a7c8201f5df1d3cf8238fa17741eaddaa0f9a232f1e4003428893ecd970ca6defc8f5da21b2935c27622969884b2bb463fb636a79b9b9707d447cc8e
    94aa14d8c940798fb495d1a830af249ad47670a885639983dad11801ecbe7884b04f7c5b455699f57f8b798f0f1e88486434470d930a9be138d8833e83003d76
)

# asc file not present yet, waiting for the bug report I filled to be solved.
validpgpkeys=(
    # Belgian eID Automatic Signing Key (continuous builds)
    # If you trust it, you can import it with
    # gpg --recv-keys D95426E309C0492990D8E8E2824A5E0010A04D46
    D95426E309C0492990D8E8E2824A5E0010A04D46
)

build() {
    cd "$pkgname-$pkgver-v$pkgver"
    ./configure --prefix=/usr --libexecdir=/usr/bin
    make
}

package() {
    cd "$pkgname-$pkgver-v$pkgver"
    make install DESTDIR="$pkgdir"
}
