pkgname=tresorit
pkgver=3.0.483.730
pkgrel=2
pkgdesc='Encrypted cloud storage for your confidential files. Using Tresorit, files are encrypted before being uploaded to the cloud. Start encrypting files for free.'
arch=('i686' 'x86_64')
url="http://www.tresorit.com/"
install=tresorit.install
license=('custom:tresorit')
makedepends=('xxd')
source=("tresorit_installer_${pkgver}.run::https://installerstorage.blob.core.windows.net/public/install/tresorit_installer.run"
        "tresorit.service")

sha1sums=('13c36ac9496795a0c86ef62104613bc3cc61f3e4'
          '2f6c3f0c4f3da3e13c71896a2f73299b2968ecf8')

prepare() {
  # Validate signature
  head -c1044 tresorit_installer_${pkgver}.run | tail -c+20 | xxd -r -p > tresorit_installer_${pkgver}.run.signature
  VERIFICATION_RESULT=`tail -c+1046 tresorit_installer_${pkgver}.run | openssl sha512 -verify ../tresorit_installer.run.pubkey -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 -signature tresorit_installer_${pkgver}.run.signature`
  if [ "$VERIFICATION_RESULT" != "Verified OK" ]; then
    echo "    ! Binary signature verification failed"
    exit 1
  fi

  SKIP=`head tresorit_installer_${pkgver}.run | grep "^SKIP" | sed 's/SKIP=//'`
  mkdir -p tresorit
  tail -n+$SKIP tresorit_installer_${pkgver}.run | tar xz -C tresorit
}

package() {
  mkdir -p "$pkgdir/opt/tresorit"
  install -Dm755 ../archlinux_user_install "$pkgdir/opt/tresorit/archlinux_user_install"
  install -Dm755 ../systemd_runner "$pkgdir/opt/tresorit/systemd_runner"
  install -Dm644 "$srcdir"/tresorit.service "$pkgdir"/usr/lib/systemd/user/tresorit.service

  if [ $CARCH == "x86_64" ]; then
      cp -r ./tresorit/tresorit_x64/* "$pkgdir/opt/tresorit"
  else
      cp -r ./tresorit/tresorit_x86/* "$pkgdir/opt/tresorit"
  fi

  echo "Exec=\$HOME/.local/share/tresorit/tresorit --hidden" >> "${pkgdir}"/opt/tresorit/tresorit.desktop
  echo "Icon=/opt/tresorit/tresorit.png" >> "${pkgdir}"/opt/tresorit/tresorit.desktop

  mkdir -p "${pkgdir}"/usr/share/licenses/tresorit
  ln -s /opt/tresorit/LICENSES.txt \
        "${pkgdir}"/usr/share/licenses/tresorit/LICENSE
}
