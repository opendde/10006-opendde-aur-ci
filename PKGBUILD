# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# Contributor: Jon <jonathan.stott@gmail.com>
# Contributor: <dev@chimeracoder.net>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: Sairon Istyar <saironiq@gmail.com>
# Contributor: Andreas B. Wagner <andreasbwagner@pointfree.net>
# Contributor: Samuel Tardieu <sam@rfc1149.net>
#
# Any suggestions welcome; please submit paches via Github:
# https://github.com/alerque/aur/tree/master/git-annex-bin
#
# Warning: some builds not up-to-date: x86_64: 5.20150825, i686: 5.20150824, armv6h: 5.20150812


pkgname=git-annex-bin
pkgver=5.20150825
pkgrel=1
pkgdesc='Standalone precompiled version of git-annex with no Haskell dependencies, batteries included.'
arch=('i686' 'x86_64' 'armv6h' 'arm')
url='http://git-annex.branchable.com/'
license=('GPL3')
provides=('git-annex')
conflicts=('git-annex', 'git-annex-git')
replaces=('git-annex-standalone')
source=('git-annex' 'runshell.patch')
sha256sums=('c7d12ba3f3a00736d0d22e18e76721314d461561adcf48cbd102413e5e75be92'
            '173b3f0dc5a314559574113a2cc1242b61ff7caebbd3be52d3090b7a91e1268f')
validpgpkeys=('40055C6AFD2D526B2961E78F5EE1DBA789C809CB')

# binaries to remove from resulting standalone package
_rmbin=('cp' 'curl' 'git' 'gpg' 'lsof' 'rsync' 'sh' 'sha1sum' 'sha224sum' \
        'sha256sum' 'sha384sum' 'sha512sum' 'ssh' 'wget' 'xargs' \
        'ssh-keygen' 'tar' 'git-shell' 'git-upload-pack' 'git-receive-pack' 'gunzip' )

# all of these can be left out if not deleting $_rmbin binaries
depends=('coreutils' 'curl' 'git' 'gnupg' 'lsof' 'rsync' 'bash' 'openssh' 'wget' 'findutils' 'dnsutils' 'aria2')

_file_x86_64="git-annex-standalone-amd64-${pkgver}.tar.gz"
_url_x86_64="https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz"
source_x86_64=("${_file_x86_64}::${_url_x86_64}"
               "${_file_x86_64}.sig::${_url_x86_64}.sig")
sha256sums_x86_64=('05ad5813b82464e81e748a6a658e2a2642a657a783ca1a0ab39e65ba66ac8541'
                   'SKIP')

_file_i686="git-annex-standalone-i386-${pkgver}.tar.gz"
_url_i686="https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-i386.tar.gz"
source_i686=("${_file_i686}::${_url_i686}"
             "${_file_i686}.sig::${_url_i686}.sig")
sha256sums_i686=('0b26ac3502bd4d8d52459dda7f8c068a395ad8419a402dd4ee5471f202bbc7d0'
                 'SKIP')

_file_armv6h="git-annex-standalone-armel-${pkgver}.tar.gz"
_url_armv6h="https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-armel.tar.gz"
source_armv6h=("${_file_armv6h}::${_url_armv6h}"
               "${_file_armv6h}.sig::${_url_armv6h}.sig")
sha256sums_armv6h=('64696230e4cefe4de73c40e7508eed1244a83f7cc55dc868b7d89d0ee5b9c172'
                   'SKIP')

source_arm=(${source_armv6h[@]})
sha256sums_arm=(${sha256sums_armv6h[@]})

package() {
    mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"

    cp -a "$srcdir/git-annex.linux" "$pkgdir/opt/"

    patch "$pkgdir/opt/git-annex.linux/runshell" "$srcdir/runshell.patch"

    for file in ${_rmbin[@]} ; do
        msg "  Removing $file from executables..."
        find "$pkgdir/opt/git-annex.linux/bin/" -name "$file" -executable -delete
        find "$pkgdir/opt/git-annex.linux/shimmed/" -name "$file" -delete
    done

    msg "  Removing git-core componets from executables..."
    find "$pkgdir/opt/git-annex.linux/git-core/" -executable \
        -execdir test -e ../shimmed/{} \; \
        -execdir rm -r ../shimmed/{} \;
    rm -r "$pkgdir"/opt/git-annex.linux/git-core

    msg "  Removing runshell componets from executables..."
    rm "$pkgdir"/opt/git-annex.linux/git{,-receive-pack,-upload-pack,-shell}

    # move the man pages over to the system directory
    mv "$pkgdir/opt/git-annex.linux/usr/share" "$pkgdir/usr/"
    gzip -9 "$pkgdir/usr/share/man/man1/git-annex.1"
    gzip -9 "$pkgdir/usr/share/man/man1/git-annex-shell.1"

    cp "$srcdir/git-annex" "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/git-annex"
    ln -s git-annex "$pkgdir/usr/bin/git-annex-webapp"
    ln -s git-annex "$pkgdir/usr/bin/git-annex-shell"
}
