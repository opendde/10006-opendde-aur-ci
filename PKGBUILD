# Maintainer: Zach Callear <zach@callear.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Anders Bergh <anders1@gmail.com>
# Contributor: Chris <alostengineer at narmos dot org>
pkgname=pam_ssh_agent_auth
pkgver=0.10.4
pkgrel=1
pkgdesc="PAM module which permits authentication via the keyring in a forwarded ssh-agent."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jbeverly/pam_ssh_agent_auth"
license=('custom:OpenSSL')
source=(git://github.com/jbeverly/pam_ssh_agent_auth.git#tag=$pkgname-$pkgver
        git://github.com/floodyberry/ed25519-donna#commit=8757bd4cd209cb032853ece0ce413f122eef212c)
md5sums=('SKIP'
         'SKIP')
makedepends=('git')
depends=('openssl')
optdepends=('openssh: standard ssh-agent'
            'gnupg: gpg ssh-agent')

prepare() {
  cd "$srcdir/$pkgname/ed25519-donna"
  git submodule init
  git config submodule.ed25519-donna.url $srcdir/ed25519-donna
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --with-mantype=man --libexecdir=/usr/lib/security --without-openssl-header-check
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE.OpenSSL "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
