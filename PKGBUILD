# Maintainer: Repentinus <aur at repentinus dot eu>

# It is the authors' firm belief this file lacks sufficient originality to
# qualify for copyright protection. In the event they are wrong, the authors
# hereby explictly waive all copyright and related or neighbouring rights to this
# work using the CC0 <https://creativecommons.org/publicdomain/zero/1.0/>.

pkgname='nginx-mod-http-xslt-filter'
pkgver=$(pacman -Si nginx-src | sed -nE 's/^Version *: ([[:alnum:]._]+).*$/\1/p')
pkgrel=$(pacman -Si nginx-src | sed -nE 's/^Version *: [^-]+-(.*)$/\1/p')
pkgdesc="Transform nginx XML responses using XSLT stylesheets"
arch=('x86_64')
url='https://nginx.org/en/docs/http/ngx_http_xslt_module.html'
license=('custom:BSD-2-Clause')
depends=('nginx' 'libxslt')
makedepends=('nginx-src')

prepare() {
  cp -r /usr/src/nginx/ ./
}

build() {
  cd "nginx"
  IFS=$'\n'
  _options=$(nginx -V |&\
             sed -nE 's/^configure arguments: ([^\n]*)$/\1/p' |\
             sed -nE 's/([^'\'' \t\n]+('\''([^'\''\]|\\'\''?)*'\'\
                     '|"([^"\\]|\\"?)*")?) ?/\1\n/gp' |\
             sed -nE -e 's/(--with-ld-opt=).*/\1"$LDFLAGS"/p;'\
                     -e 's/(--with-cc-opt=).*/\1"$CFLAGS $CPPFLAGS"/p')
  ./configure ${_options[@]} --with-http_xslt_module=dynamic
  make modules
}

package() {
  cd "nginx/objs"
  for f in *.so; do install -Dm644 "$f" "$pkgdir/usr/lib/nginx/modules/$f"; done
  install -dm755 "$pkgdir/usr/share/licenses/"
  ln -s /usr/share/licenses/nginx/ "$pkgdir/usr/share/licenses/$pkgname"
}
