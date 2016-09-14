# Maintainer: Aaron Brodersen <aaron at abrodersen dot com>
pkgname=dotnet-cli
pkgver="1.0.0_preview2_003131"
pkgrel=1
pkgdesc="A command line utility for building, testing, packaging and running .NET Core applications and libraries"
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
groups=()
depends=('lldb' 'libunwind' 'icu' 'lttng-ust' 'openssl' 'curl')
makedepends=('cmake' 'make' 'clang' 'llvm' 'gettext')
provides=('dotnet')
conflicts=()
replaces=()
backup=()
options=(staticlibs)
install=

_coreclrver="1.0.4"
_corefxver="1.0.0"
_runtimever="1.0.1"
_sdkver=${pkgver//_/-}

_coreclr="coreclr-${_coreclrver}"
_corefx="corefx-${_corefxver}"

source=(
  "${_coreclr}.tar.gz::https://github.com/dotnet/coreclr/archive/v${_coreclrver}.tar.gz"
  "${_corefx}.tar.gz::https://github.com/dotnet/corefx/archive/v${_corefxver}.tar.gz"
  "${pkgname}-${pkgver}.tar.gz::https://dotnetcli.blob.core.windows.net/dotnet/preview/Binaries/${_sdkver}/dotnet-dev-fedora.23-x64.${_sdkver}.tar.gz"
  'gcc6-github-pull-5304.patch'
  'unused-attr-coreclr.patch'
  'unused-attr-corefx.patch'
  'glibc-readdir-corefx.patch')
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('b49ba545fe632dfd5426669ca3300009a5ffd1ccf3c1cf82303dcf44044db33d'
            '98f9475ea42e5d55ad9402424e342a6c0ea7351f3fb5805a602132969b44b774'
            '8cd233fdf2d12eca47d558e70e90000aee34a75c718fc9f22d8680e6cb688047'
            '0905f9f8e6e33a7a6e5f4acf9ec54ec3796400dce28f0d71c1d1d8bcd9b7e068'
            '8a33c449312f90660d431177f7ee0a36894b75749f79ecf8995c64d82197af90'
            '9ecdd0ca615b988b67cc4c6a9f5035fb3fb70b16d9281d07c17a28a784a6d4ab'
            '210cc1c802f2fd284ebfa6bbf7f7997c616adb5959725b25028a2ca63a568f51')

prepare() {
  cd "${srcdir}/${_coreclr}"
  patch -p1 < "${srcdir}/gcc6-github-pull-5304.patch"
  patch -p1 < "${srcdir}/unused-attr-coreclr.patch"

  cd "${srcdir}/${_corefx}"
  patch -p1 < "${srcdir}/unused-attr-corefx.patch"
  patch -p1 < "${srcdir}/glibc-readdir-corefx.patch"
}

build() {
  cd "${srcdir}/${_coreclr}"
  ./build.sh x64 release

  cd "${srcdir}/${_corefx}"
  ./build.sh native x64 release

}

_coreclr_files=(
  'libclrjit.so'
  'libcoreclr.so'
  'libcoreclrtraceptprovider.so'
  'libdbgshim.so'
  'libmscordaccore.so'
  'libmscordbi.so'
  'libsos.so'
  'libsosplugin.so'
  'System.Globalization.Native.so'
)

_corefx_files=(
  'System.IO.Compression.Native.so'
  'System.Native.a'
  'System.Native.so'
  'System.Net.Http.Native.so'
  'System.Net.Security.Native.so'
  'System.Security.Cryptography.Native.so'
)

_copy_file() {
  cp --force --preserve=mode $1 "$2/shared/Microsoft.NETCore.App/${_runtimever}/"
}

package() {
  local _outdir="${pkgdir}/opt/dotnet"
  mkdir -p "${_outdir}"

  tar -C "${_outdir}" -xzf "${srcdir}/${pkgname}-${pkgver}.tar.gz"

  local _clrdir="${srcdir}/${_coreclr}"

  for file in "${_coreclr_files[@]}"; do
      _copy_file "${_clrdir}/bin/Product/Linux.x64.Release/${file}" "${_outdir}"
  done

  local _fxdir="${srcdir}/${_corefx}"

  for file in "${_corefx_files[@]}"; do
      _copy_file "${_fxdir}/bin/Linux.x64.Release/Native/${file}" "${_outdir}"
  done

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/dotnet/dotnet" "${pkgdir}/usr/bin/dotnet"
  chown -R 0:0 "${_outdir}"
}

# vim:set ts=2 sw=2 et:
