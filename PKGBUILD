# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=('drill-search-cli' 'drill-search-gtk')
pkgbase=drill-search
pkgver=1.258
pkgrel=1
arch=('x86_64')
url="https://www.drill.santamorena.me"
license=('GPL2')
makedepends=('git' 'dmd' 'dub')
_dubv=("1.0.3" #datefmt
	"3.9.0" #gtkd
	)
install="$pkgbase.install"
source=("$pkgbase-$pkgver.tar.gz::https://github.com/yatima1460/Drill/archive/$pkgver.tar.gz"
	"$pkgbase"
	"$pkgbase-gtk.desktop"
	"$pkgbase-gtk.svg"
	"datefmt::git+https://github.com/dhasenan/datefmt.git#tag=v${_dubv[0]}"
	"gtkd::git+https://github.com/gtkd-developers/GtkD.git#tag=v${_dubv[1]}")
sha256sums=('09fad3a9e2db20be67ab60ea6990a5a50ba41044f164364cf5ec4d06aa521bbf'
            'b875f928546aee7855cb1db9afc8ab3f1a8a34d43de5bbd62f7076d7ba9f3917'
            '5bafb37baf608a3168abba2ab9ea174a1d0f0472f52d3222ea0a05957c997c50'
            'cbfbcebb2957223eaa9c915780a5d0ac47c1fac70b7944f49e8ffcfe740edc53'
            'SKIP'
            'SKIP')
            
prepare() {
	cd "Drill-$pkgver"
	sed -i "s/0.0.0/$pkgver/g" DRILL_VERSION
}

build() {
    # add local dependencies to search path
    dub add-local datefmt
    dub add-local gtkd
    
    cd "Drill-$pkgver/Source/Frontend/CLI"
    dub build \
    	--cache=local `# ensure dub stays outside the users home directory`\
    	--parallel `# runs multiple compiler instances in parallel, if possible`\
    	--force `# Forces a recompilation even if the target is up to date`\
    	--build=release

	cd .. && cd GTK
    dub build \
    	--cache=local `# ensure dub stays outside the users home directory`\
    	--parallel `# Runs multiple compiler instances in parallel, if possible`\
    	--force `# Forces a recompilation even if the target is up to date:`\
    	--build=release

    # remove local dependencies from search path so dub won't find them
    # again later
    dub remove-local "$srcdir/datefmt"
    dub remove-local "$srcdir/gtkd"

    # removes any cached metadata like the list of available packages
    # and their latest version
    dub clean-caches
}

package_drill-search-cli() {
	pkgdesc="Search files without indexing, but clever crawling (CLI version)"

	cd "Drill-$pkgver/Source/Frontend/CLI"
	install -d $pkgdir/{opt/$pkgname,usr/bin}
	cp -r Build/Drill-CLI-linux-$arch-release/Assets \
		$pkgdir/opt/$pkgname
	install -Dm755 Build/Drill-CLI-linux-$arch-release/$pkgname \
		$pkgdir/opt/$pkgname/$pkgname
	install -Dm755 $srcdir/$pkgbase $pkgdir/usr/bin/$pkgname
	echo "/opt/$pkgname/$pkgname" "\$@" >> $pkgdir/usr/bin/$pkgname
}

package_drill-search-gtk() {
	pkgdesc="Search files without indexing, but clever crawling (GTK version)"
	depends=('gtk3' 'xdg-utils')

	cd "Drill-$pkgver/Source/Frontend/GTK"
	install -d $pkgdir/{opt/$pkgname,usr/bin}
	cp -r Build/Drill-GTK-linux-$arch-release/Assets \
		$pkgdir/opt/$pkgname
	install -Dm644 $srcdir/$pkgname.desktop \
		$pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 $srcdir/$pkgname.svg \
		$pkgdir/usr/share/pixmaps/$pkgname.svg
	install -Dm755 Build/Drill-GTK-linux-$arch-release/$pkgname \
		$pkgdir/opt/$pkgname/$pkgname
	install -Dm755 $srcdir/$pkgbase $pkgdir/usr/bin/$pkgname
	echo "/opt/$pkgname/$pkgname" "\$@" >> $pkgdir/usr/bin/$pkgname
}
