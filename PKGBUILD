# vim:set ts=2 sw=2 et:
# Maintainer: 2GMon <t_2gmon@yahoo.co.jp>
pkgname=mikutter
#pkgver=3.4.0_alpha3
pkgver=3.4.2
pkgrel=3
pkgdesc="a moest twitter client"
arch=('i686' 'x86_64')
url="http://mikutter.hachune.net/"
license=('MIT')
depends=('ruby-gtk2>=2.2.3' 'ruby-moneta' 'ruby-nokogiri' 'ruby-httpclient' 'ruby-mini_portile2' 'ruby-totoridipjp')
optdepends=('libnotify: notify support')
source=(
#http://mikutter.hachune.net/bin/$pkgname.$pkgver.tar.gz
http://mikutter.hachune.net/bin/$pkgname.`echo "$pkgver" | tr "_" '-'`.tar.gz
mikutter.desktop
)

package() {
  mkdir "$pkgdir/opt"
  cp -r "$srcdir/$pkgname" "$pkgdir/opt"

  mkdir -p "$pkgdir/usr/bin"
  cat <<'EOF' > "$pkgdir/usr/bin/mikutter"
#!/bin/sh
ruby /opt/mikutter/mikutter.rb $@
EOF
  chmod a+x "$pkgdir/usr/bin/mikutter"

  mkdir -p $pkgdir/usr/share/applications
  cp "$srcdir/mikutter.desktop" "$pkgdir/usr/share/applications"
  chmod +x $pkgdir/usr/share/applications/mikutter.desktop
}

md5sums=('722bd401b33f8848db4d52e075ee70e0'
         '18e28a76097af88457462b08752382df')
