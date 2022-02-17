# Maintainer: Todd E Johnson <todd@toddejohnson.net>
# Maintainer: Erik Westrup <erik.westrup@gmail.com>

pkgname=restic-systemd-automatic-backup
pkgver=5.1.0
pkgrel=1
pkgdesc="Automatic backups using restic + systemd timers with Backblaze B2 storage backend."
arch=('any')
url="https://github.com/erikw/$pkgname"
license=('BSD' 'custom')
depends=('restic' 'bash' 'systemd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/erikw/$pkgname/archive/v$pkgver.tar.gz")
install="restic-systemd-automatic-backup.install"
sha256sums=('5f52884a6bfa98af35d3fa7ad1cebb3d4c47ab3e57ae87b5d19d4f75e1383544')
backup=('etc/restic/backup_exclude.txt' 'etc/restic/default.env.sh' 'etc/restic/_global.env.sh' 'etc/restic/pw.txt')
# Backup <5.0.0 conf files for whose who upgrade.
backup+=('etc/restic/default.env' 'etc/restic/_global.env')
# Backup <3.0.0 conf files for whose who upgrade.
backup+=('etc/restic/b2_env.sh' 'etc/restic/b2_pw.txt' 'etc/restic/backup_exclude')

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir" INSTALL_PREFIX= install-systemd

  # We're not allowed to install to /bin, so let's move to /usr/bin
  mv $pkgdir/bin $pkgdir/usr
  sed -e "s|$pkgdir/bin/|$pkgdir/usr/bin/|g" -i $pkgdir/etc/restic/* $pkgdir/usr/bin/* $pkgdir/usr/lib/systemd/system/*

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
