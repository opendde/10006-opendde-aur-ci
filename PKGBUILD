# Maintainer: Márcio Sousa Rocha <marciosr10@gmail.com>
# Baseado no PKGBUILD feito por Lara Maia <lara@craft.net.br>
 
pkgname=irpf
pkgver=2016.0.0
pkgrel=1
license=('custom')
 
arch=(any)
pkgdesc='Programa Oficial da Receita para elaboração do IRPF'
url='http://www.receita.fazenda.gov.br'
 

source=(http://downloadirpf.receita.fazenda.gov.br/irpf/2016/IRPF2016-1.0.zip

        Copyright
        $pkgname.png
        $pkgname.desktop
        $pkgname.install
		$pkgname)
 

md5sums=('cd2f77c0537070d167bd565671800c77'
         '8433a90404188a62cf93172ac6085813'
         '43d8c9617118578f03b2c4eeb1c72c57'
         '5c3f364ed6e30e8aac69ad4394deabba'
         '268c8018f98be22e77d8ca711140292a'
		 '1393bb1d170a8aeaccfe0c2ee2c818cf')
 
depends=('java-runtime-common>=6' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('receitanet: Para envio do IRPF')
install=$pkgname.install
 
 
package() {
        cd "$srcdir"/IRPF2016
        rm -f IRPF2016.exe
		rm -f exec.sh
        mkdir -p "$pkgdir"/usr/share/{icons/hicolor/128x128/apps,applications,licenses/irpf,irpf}
		mkdir "$pkgdir"/usr/bin
       
        cp -rf tutorial "$pkgdir"/usr/share/irpf/
        cp -rf lib "$pkgdir"/usr/share/irpf/
		cp -rf help "$pkgdir"/usr/share/irpf/
       
        install -Dm644 irpf.jar "$pkgdir"/usr/share/irpf/
        install -Dm644 IRPF2016.ini "$pkgdir"/usr/share/irpf/
        install -Dm644 IRPF2016.acb "$pkgdir"/usr/share/irpf/
        install -Dm755 "$srcdir"/irpf "$pkgdir"/usr/bin/
       
        install -Dm644 "$srcdir"/Copyright "$pkgdir"/usr/share/licenses/irpf/
       
        install -Dm644 "$srcdir"/irpf.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/
        install -Dm644 "$srcdir"/irpf.desktop "$pkgdir"/usr/share/applications/
}
