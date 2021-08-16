# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=concordium-desktop-wallet-testnet-bin
pkgver=1.1.6
pkgrel=1
pkgdesc='Desktop wallet for Concordium blockchain in testnet'
arch=('x86_64')
url='https://developer.concordium.software/en/testnet/net/index.html'
license=('unknown')
depends=('gtk3' 'libnotify' 'libsecret' 'libxss' 'nss' 'xdg-utils')
optional=('libappindicator-gtk3')
source=("https://distribution.testnet.concordium.com/tools/linux/concordium-desktop-wallet-testnet-$pkgver.deb")
sha512sums=('e67e58931c56a4625db2c7de88139502284133c87f7b498a84b94d22e3c45473c98a6e39b9824796aefa0c70f545b6c5ba436fbe19c8c77f9984803080140967')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    cp -r opt usr "$pkgdir"
    install -d "$pkgdir/usr/bin"
    ln -s '/opt/Concordium Wallet testnet/concordium-desktop-wallet-testnet' "$pkgdir/usr/bin"
}
