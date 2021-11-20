#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=powerpill
pkgver=2021.11
pkgrel=1
pkgdesc='Pacman wrapper for faster downloads.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/powerpill"
depends=(aria2 'pm2ml>2012.12.12' pyalpm python3 python3-xcgf python3-xcpf)
optdepends=('python3-threaded_servers: internal Pacserve support' 'reflector: Reflector and Rsync support' 'rsync: Rsync download support')
backup=(etc/powerpill/powerpill.json)
source=(
  https://xyne.dev/projects/powerpill/src/powerpill-2021.11.tar.xz
  https://xyne.dev/projects/powerpill/src/powerpill-2021.11.tar.xz.sig
)
sha512sums=(
  a4a1067a020056bd258d8a00c60a3fcd8ea3aa745c52a6f5e29f76f7a6d5e93d4a4c612139a8b746aa5ebbd9307c977edd95ca882e9054537757142ea550bf5c
  68948534846746b2b26d3b6cdcc58d38903a5a0e66c20dfd8c489985f462cafff74c2f04f222727228f4c335b9f1e4864bf05b4d93090c6538cc3b9782e0b71b
)
md5sums=(
  e54ef66cf3d6ef1a2c00e2e98014e1f9
  d70ecabc6e87d4b5879a5477ed3fa5f6
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 'powerpill.json' "$pkgdir/etc/powerpill/powerpill.json"
  install -Dm644 'man/powerpill.json.1.gz' "$pkgdir/usr/share/man/man1/powerpill.json.1.gz"
  install -Dm644 'powerpill-bash-completion.sh' "$pkgdir/usr/share/bash-completion/completions/powerpill"
  install -Dm644 '_powerpill.zsh' "$pkgdir/usr/share/zsh/site-functions/_powerpill"
}

# vim: set ts=2 sw=2 et:
