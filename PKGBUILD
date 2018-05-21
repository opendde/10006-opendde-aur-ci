# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname="concord232"
pkgdesc='GE Concord 4 RS232 Automation Module Interface Library and Server'
pkgver=0.15
pkgrel=2
url="https://github.com/JasonCarter80/concord232"
license=('APACHE')
arch=('any')
depends=('python'
         'python-requests>=2.18.4'
         'python-stevedore>=1.28.0'
         'python-prettytable>=0.7.2'
         'python-pyserial>=3.4'
         'python-flask>=1.0.2')
source=("https://github.com/JasonCarter80/concord232/archive/v${pkgver}.tar.gz"
        "concord232.service"
        "concord232.sysusers"
        "concord232.conf.d")
sha512sums=('62a379a458a5395cb91ec88f35707ae762270a8f2b1e4da06ee3930ba251bbf4f89764f6dbc4d63e0378f69e6e0fa625fcb9fe8e422f235b4475f759a3d2747c'
            '7c4d543e49b8be0e9ae75ec45e5e8d2c621bce85fb3b14ef74eff416396990ebd840fe1bc50f28467908347ca957776d0abfb6e2ff160710c209e1b9cd662498'
            'd677859a31ac3a2cee756a8f214ee532d06290b052c330822ac4400ff9084068556682ee0325cf2fb0c68a96b1f6586b7aff54da5ed858d2f4b494eb79c45c5a'
            'fd1f7298e9b26ba97a91e3b474e35dab35ae110442e3d39c8d917ff8ff7e83d7926af10ec518e3a04c5ac7f29608bbc19cefb739e40be9d9c6bbaa445a6cc6af')

package() {
  install -Dm644 "${srcdir}/concord232.service" "${pkgdir}/usr/lib/systemd/system/concord232.service"
  install -Dm644 "${srcdir}/concord232.sysusers" "${pkgdir}/usr/lib/sysusers.d/concord232.conf"
  install -Dm644 "${srcdir}/concord232.conf.d" "${pkgdir}/etc/conf.d/concord232"

  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
}
