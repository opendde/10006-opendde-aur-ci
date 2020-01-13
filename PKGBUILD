# Contributor: Lex Black <autumn-wind@web.de>
# Contributor :	Harry Stern <harry.stern@rutgers.edu> 
# Contributor : kevin <kevin@archlinux.org>
# Contributor : Christian Schmidt <mucknert@gmx.net>
# Contributor : Markus Meissner <markus@meissna.de>
# Contributor : Nick Erdmann <erdmann@date.upb.de>

pkgname=nethack-qt
_pkgname=nethack
pkgver=3.6.4
pkgrel=1
pkgdesc='A single player dungeon exploration game'
arch=('i686' 'x86_64')
url="http://www.nethack.org/index.html"
license=('custom')
depends=('gzip' 'ncurses' 'qt5-base' 'qt5-multimedia' 'libxaw' 'libxt' 'libx11')
# 'libxmu' 'libxext'
source=("https://nethack.org/download/${pkgver}/${_pkgname}-${pkgver//.}-src.tgz")
md5sums=('b3a84ed39818489560c8c0e368490255')


prepare() {
  #cd "$_pkgname-$pkgver/"
  cd NetHack-NetHack-${pkgver}_Released

  sed -e 's|^/\* \(#define LINUX\) \*/|\1|' \
      -e 's|^/\* \(#define TIMED_DELAY\) \*/|\1|' -i include/unixconf.h

  # we are setting up for setgid games, so modify all necessary permissions
  # to allow full access for groups

  sed -e '/^HACKDIR/ s|/games/lib/\$(GAME)dir|/var/games/nethack/|' \
      -e '/^SHELLDIR/ s|/games|/usr/bin|' \
      -e '/^VARDIRPERM/ s|0755|0775|' \
      -e '/^VARFILEPERM/ s|0600|0664|' \
      -e '/^GAMEPERM/ s|0755|02755|' \
      -e 's|\(DSYSCF_FILE=\)\\"[^"]*\\"|\1\\"/var/games/nethack/sysconf\\"|' \
      -e 's|\(DHACKDIR=\)\\"[^"]*\\"|\1\\"/var/games/nethack/\\"|' -i sys/unix/hints/linux

  sed -e 's|^#GAMEUID.*|GAMEUID = root|' \
      -e 's|^#GAMEGRP.*|GAMEGRP = games|' \
      -e '/^FILEPERM\s*=/ s|0644|0664|' \
      -e '/^DIRPERM\s*=/ s|0755|0775|' -i sys/unix/Makefile.top

  sed -e "/^MANDIR\s*=/s|/usr/man/man6|$pkgdir/usr/share/man/man6|" -i sys/unix/Makefile.doc

}

build(){
  #cd "$_pkgname-$pkgver/sys/unix"
  cd NetHack-NetHack-${pkgver}_Released/sys/unix
  sh setup.sh hints/linux-qt5

  #cd "$_pkgname-$pkgver"
  cd "${srcdir}/NetHack-NetHack-${pkgver}_Released"
  make
}
  
package() {
  #cd "$_pkgname-$pkgver/"
  cd NetHack-NetHack-${pkgver}_Released

  install -dm755 "$pkgdir"/usr/share/{man/man6,doc/nethack-qt}
  install -dm775 "$pkgdir"/var/games/
  make PREFIX="$pkgdir" -j1 install manpages # Multi-threaded builds fail.
  sed -e "s|HACKDIR=$pkgdir/|HACKDIR=/|" \
      -e 's|HACK=$HACKDIR|HACK=/usr/lib/nethack-qt|' \
      -i "$pkgdir"/usr/bin/nethack-qt

  install -dm755 "$pkgdir"/usr/lib/nethack-qt
  mv "$pkgdir"/var/games/nethack-qt/{nethack-qt,recover} "$pkgdir"/usr/lib/nethack-qt/

  # FS#43414: /var/games should be owned by root:games.
  chown -R root:games "$pkgdir"/var/games/
  chown root:games "$pkgdir"/usr/lib/nethack/nethack
  #chmod 02755 $pkgdir/usr/lib/nethack/nethack

  install -Dm644 doc/Guidebook.txt "$pkgdir"/usr/share/doc/nethack/Guidebook.txt
  install -Dm644 dat/license "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
