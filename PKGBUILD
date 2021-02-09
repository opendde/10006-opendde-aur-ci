# Maintainer: Curve <curve.platin at gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Michael Hansen <zrax0111 gmail com>
# Contributor: Francisco Magalhães <franmagneto gmail com>
# Contributor: Curve <curve.platin at gmail.com>

pkgname=vscode-transparent-git
_pkgname=code
pkgdesc='The Open Source build of Visual Studio Code (vscode) editor - with transparency enabled - latest git'
# Important: Remember to check https://github.com/microsoft/vscode/wiki/How-to-Contribute#prerequisites for target node version
# NodeJS versioning cheatsheet:
#   - carbon: 8
#   - dubnium: 10
#   - ?: 11 (not in repos)
#   - erbium: 12
# Important: Remember to check https://github.com/microsoft/vscode/blob/master/.yarnrc (choose correct tag) for target electron version
_electron=electron9
pkgver=r76589.64db71fed86
pkgrel=1
arch=('x86_64')
url='https://github.com/microsoft/vscode'
license=('MIT')
depends=($_electron 'libsecret' 'libx11' 'libxkbfile' 'ripgrep')
optdepends=('bash-completion: Bash completions'
            'zsh-completions: ZSH completitons'
            'x11-ssh-askpass: SSH authentication')
makedepends=('git' 'gulp' 'npm' 'python2' 'yarn' 'nodejs-lts-erbium')
conflicts=('code')
provides=('code')
install='code-transparent.install'
source=("$_pkgname::git+$url.git"
        'code.js'
        'code.sh'
        'transparent.diff'
        'fix-first-window-not-transparent.diff'
        'product_json.diff')
sha512sums=('SKIP'
            '814c9554427183cd893a33cd2cbe91f6e0ea71921ef0717c86217b1d3058d265f9ff7a9ace3e7b76f122e60b7686475cf4d999e581a1845face3033afb9f745f'
            '0e75ee88274cbaf48c59ef6f363f6b8ac2ea83f8b17a61155008db773b709a1f0233754fa63a136ec0417313ba90a7eb17db000ec22a38ca8840d8ba6c47cab1'
            'ae7fc5d2d1851bf9353c3f531a4de05cc5b41496468e908776b7a17cf85e889c601b94499bd6165efb902578af1ebf37443a03881f98d8c6120cb4f8667d8fe7'
            'e662f0bf3f55a82ce9bce98f22c6be80ee83c1e2241d2eca596326478887ec6b73c7d0041903e17f35a424578ccc22674354931166dc7c7d7e76bb97135e009e'
            '108f97f6a1cc5f12e23525ee288c375f961c4aaf1ef598d20618349386e9b6b5514143066876de1eff279235faecaaf5a8f8a54cfe46ea98d5e4e667b584193c')

# Even though we don't officially support other archs, let's
# allow the user to use this PKGBUILD to compile the package
# for his architecture
case "$CARCH" in
  i686)
    _vscode_arch=ia32
    ;;
  x86_64)
    _vscode_arch=x64
    ;;
  armv7h)
    _vscode_arch=arm
    ;;
  *)
    # Needed for mksrcinfo
    _vscode_arch=DUMMY
    ;;
esac

pkgver() {
  cd "${srcdir}/code"
  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname

  # Change electron binary name to the target electron
  sed -i "s|exec electron |exec $_electron |" ../code.sh

  # This patch no longer contains proprietary modifications.
  # See https://github.com/Microsoft/vscode/issues/31168 for details.
  patch -p0 < ../product_json.diff

  # enable window transparency
  patch -p1 <../transparent.diff

  # fixes sometimes the first code window is not transparent
  # https://aur.archlinux.org/packages/code-transparent/#comment-775691
  # https://github.com/electron/electron/issues/16809
  patch -p1 <../fix-first-window-not-transparent.diff

  # Set the commit and build date
  local _commit=$(git rev-parse HEAD)
  local _datestamp=$(date -u -Is | sed 's/\+00:00/Z/')
  sed -e "s/@COMMIT@/$_commit/" -e "s/@DATE@/$_datestamp/" -i product.json

  # Build native modules for system electron
  local _target=$(</usr/lib/$_electron/version)
  sed -i "s/^target .*/target \"${_target//v/}\"/" .yarnrc

  # Patch appdata and desktop file
  sed -i 's|/usr/share/@@NAME@@/@@NAME@@|@@NAME@@|g
          s|@@NAME_SHORT@@|Code|g
          s|@@NAME_LONG@@|Code - OSS|g
          s|@@NAME@@|code-oss|g
          s|@@ICON@@|com.visualstudio.code.oss|g
          s|@@EXEC@@|/usr/bin/code-oss|g
          s|@@LICENSE@@|MIT|g
          s|@@URLPROTOCOL@@|vscode|g
          s|inode/directory;||' resources/linux/code{.appdata.xml,.desktop,-url-handler.desktop}

  sed -i 's|MimeType=.*|MimeType=x-scheme-handler/code-oss;|' resources/linux/code-url-handler.desktop

  # Add completitions for code-oss
  cp resources/completions/bash/code resources/completions/bash/code-oss
  cp resources/completions/zsh/_code resources/completions/zsh/_code-oss

  # Patch completitions with correct names
  sed -i 's|@@APPNAME@@|code|g' resources/completions/{bash/code,zsh/_code}
  sed -i 's|@@APPNAME@@|code-oss|g' resources/completions/{bash/code-oss,zsh/_code-oss}

  # Fix bin path
  sed -i "s|return path.join(path.dirname(execPath), 'bin', \`\${product.applicationName}\`);|return '/usr/bin/code';|g
          s|return path.join(appRoot, 'scripts', 'code-cli.sh');|return '/usr/bin/code';|g" \
          src/vs/platform/environment/node/environmentService.ts
}

build() {
  # https://github.com/mapbox/node-sqlite3/issues/1044
  mkdir -p path
  ln -sf /usr/bin/python2 path/python
  export PATH="$PWD/path:$PATH"

  cd $_pkgname

  yarn install --arch=$_vscode_arch

  # The default memory limit may be too low for current versions of node
  # to successfully build vscode. Change it if this number still doesn't
  # work for your system.
  mem_limit="--max_old_space_size=8192"

  if ! /usr/bin/node $mem_limit /usr/bin/gulp vscode-linux-$_vscode_arch-min
  then
      echo
      echo "*** NOTE: If the build failed due to running out of file handles (EMFILE),"
      echo "*** you will need to raise your max open file limit."
      echo "*** You can check this for more information on how to increase this limit:"
      echo "***    https://ro-che.info/articles/2017-03-26-increase-open-files-limit"
      exit 1
  fi
}

package() {
  # Install resource files
  install -dm 755 "$pkgdir"/usr/lib/$_pkgname
  cp -r --no-preserve=ownership --preserve=mode VSCode-linux-$_vscode_arch/resources/app/* "$pkgdir"/usr/lib/$_pkgname/

  # Replace statically included binary with system copy
  ln -sf /usr/bin/rg "$pkgdir"/usr/lib/code/node_modules.asar.unpacked/vscode-ripgrep/bin/rg

  # Install binary
  install -Dm 755 code.sh "$pkgdir"/usr/bin/code-oss
  install -Dm 755 code.js "$pkgdir"/usr/lib/$_pkgname/code.js
  ln -sf /usr/bin/code-oss "$pkgdir"/usr/bin/code

  # Install appdata and desktop file
  install -Dm 644 $_pkgname/resources/linux/code.appdata.xml "$pkgdir"/usr/share/metainfo/code-oss.appdata.xml
  install -Dm 644 $_pkgname/resources/linux/code.desktop "$pkgdir"/usr/share/applications/code-oss.desktop
  install -Dm 644 $_pkgname/resources/linux/code-url-handler.desktop "$pkgdir"/usr/share/applications/code-oss-url-handler.desktop
  install -Dm 644 VSCode-linux-$_vscode_arch/resources/app/resources/linux/code.png "$pkgdir"/usr/share/pixmaps/com.visualstudio.code.oss.png

  # Install bash and zsh completions
  install -Dm 644 $_pkgname/resources/completions/bash/code "$pkgdir"/usr/share/bash-completion/completions/code
  install -Dm 644 $_pkgname/resources/completions/bash/code-oss "$pkgdir"/usr/share/bash-completion/completions/code-oss
  install -Dm 644 $_pkgname/resources/completions/zsh/_code "$pkgdir"/usr/share/zsh/site-functions/_code
  install -Dm 644 $_pkgname/resources/completions/zsh/_code-oss "$pkgdir"/usr/share/zsh/site-functions/_code-oss

  # Install license files
  install -Dm 644 VSCode-linux-$_vscode_arch/resources/app/LICENSE.txt "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm 644 VSCode-linux-$_vscode_arch/resources/app/ThirdPartyNotices.txt "$pkgdir"/usr/share/licenses/$_pkgname/ThirdPartyNotices.txt
}
