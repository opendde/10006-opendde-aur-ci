# Maintainer: tleydxdy <shironeko(at)waifu(dot)club>

pkgname=dracut-sb
pkgver=1.0.0
pkgrel=1
pkgdesc='dracut secure boot setup using efistub'
arch=('any')
depends=('dracut' 'efitools' 'efibootmgr' 'sbsigntools')
backup=('etc/pacman.d/hooks/efi-key.conf')
source=('55-efi-key.hook'
'60-dracut-remove.hook'
'90-dracut-install.hook'
'99-secureboot.conf'
'dracut-install'
'dracut-remove'
'efi-key'
'efi-key.conf'
'linuxx64.efi.stub')
sha256sums=('SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP')

package() {
    install -Dm644 "${srcdir}"/55-efi-key.hook "${pkgdir}"/etc/pacman.d/hooks/55-efi-key.hook
    install -Dm644 "${srcdir}"/60-dracut-remove.hook "${pkgdir}"/etc/pacman.d/hooks/60-dracut-remove.hook
    install -Dm644 "${srcdir}"/90-dracut-install.hook "${pkgdir}"/etc/pacman.d/hooks/90-dracut-install.hook

    install -Dm644 "${srcdir}"/99-secureboot.conf "${pkgdir}"/etc/dracut.conf.d/99-secureboot.conf

    install -Dm755 "${srcdir}"/dracut-install "${pkgdir}"/usr/local/share/libalpm/scripts/dracut-install
    install -Dm755 "${srcdir}"/dracut-remove "${pkgdir}"/usr/local/share/libalpm/scripts/dracut-remove

    install -Dm755 "${srcdir}"/efi-key "${pkgdir}"/usr/local/share/libalpm/scripts/efi-key
    install -Dm644 "${srcdir}"/efi-key.conf "${pkgdir}"/etc/pacman.d/hooks/efi-key.conf

    install -Dm755 "${srcdir}"/linuxx64.efi.stub "${pkgdir}"/usr/bin/gummiboot/linuxx64.efi.stub
}
