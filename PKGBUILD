pkgbase=stt
pkgname=stt-bin 
_pkgname=STT
pkgver=1.3.0
pkgrel=1
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture - C++ native client + devel files."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/coqui-ai/STT"
license=('MPL2')
depends=('gcc-libs')
makedepends=('wget' 'tar')
provides=('stt')
conflicts=('stt')

# Set all sources.
_src_base_url="https://github.com/coqui-ai/STT/releases/download/v$pkgver"
_raw_base_url="https://raw.githubusercontent.com/coqui-ai/STT/v$pkgver"

# Reused checksums.
_header_sum='16563959019ce823249b1c8772528936f4aa61d89daa5a9a9544b37b95348f0c6fefa5836b7eb7d3b41eb90c1998fb94ccb9e9b02dec4f0df8f693efd706ec4f'
_pc_sum='caf2820f4d6a4fe7a9b9b035eee76700a5b90eb4c25242da6265934024a7bb669d541b05521a16d2792b1373f9ba6d3aa92fb9487c2def0a843d9fb74ce8db17'
_pc_tflite_sum='34bbee9149d2a7545e797c8a5858b267c9c7aed00762e88c6098c9cbb7d6a7eb346a930b6c64a34e191ced1e1bf76f1ea91b357169101058bab0f0adb057f44d'

# amd64
source_x86_64=("$_src_base_url/native_client.tflite.Linux.tar.xz"
               "stt.pc"
               "stt-tflite.pc")
sha512sums_x86_64=('c7903de984f6af069c07a735c1fa0cda2f9f703313a663e18317e1d422a9f28aa9d879c21a428a4d74baaaa1d027b19d46e2abb15982e5262068a14a1d57e824'
                   "$_header_sum"
                   "$_pc_sum"
                   "$_pc_tflite_sum")

# armv7h
source_armv7h=("$_src_base_url/native_client.tflite.linux.armv7.tar.xz"
               "stt.pc")
sha512sums_armv7h=('687fd924716ebcd53cf1f5ddf1efb44b4005f9a83f4af70756a1146c78b76d09c90add978dba40a4a7ba935a91704defbdbea3360426a09d4ac4c7f6f58248d2'
                   "$_header_sum"
                   "$_pc_sum")

# aarch64
source_aarch64=("$_src_base_url/native_client.tflite.linux.aarch64.tar.xz"
                "stt.pc")
sha512sums_aarch64=('041400ee01bf0b863db60001972938aa1add4208df8e61a068bd4f872fe16fe9fccb23aa84c703e1181590ce19ded5453ace61670a57dfddbc18e5ef4b86c106'
                    "$_header_sum"
                    "$_pc_sum")

package() {
  # Create installation directories.
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	mkdir -p "$pkgdir/usr/lib/pkgconfig"

  # Separately get a copy of the TFLite library.
  # Unfortunately, due to files having the same name, this cannot be done with the sources section.
  # Note: At this time, only x86_64 Linux has a prebuilt TFLite library.
  MACHINE_TYPE=`uname -m`
  if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    # Download the TFLite version of STT.
    local nc_tflite_fname="native_client.tflite.Linux.tar.xz"
    wget "$_src_base_url/$nc_tflite_fname" -q -O "$srcdir/$nc_tflite_fname"

    # Make a directory and extract the library.
    local tf_dir="$srcdir/tflite"
    local tf_lib_path="$tf_dir/libstt.so"
    local tf_lib_sum="7887aac4dd8a1e11af8ecaaf03d4d697916fba801db0fb96a3dfee4d3d183979c836b80af05a4cf770ba854cd9d7ee4353fd6dbb68fe707daa3846b0772d94e1"
    mkdir -p "$tf_dir"
    tar -xvf "$srcdir/$nc_tflite_fname" -C "$tf_dir" --wildcards 'libstt.so'

    # Ensure the library's checksum is correct.
    local lib_sum_check=$(sha512sum "$tf_lib_path" | awk '{print $1}')
    if [ ${lib_sum_check} != "$tf_lib_sum" ]; then
      # Bail!
      echo "Verifying the TFLite library's checksum failed!" 1>&2
      exit 1
    fi

    # Copy and rename the TFLite library.
    install -Dm755 "$tf_lib_path" "$pkgdir/usr/lib/libstt-tflite.so.$pkgver"
    ln -s "/usr/lib/libstt-tflite.so.$pkgver" "$pkgdir/usr/lib/libstt-tflite.so"

    # Install the pkgconf file.
    install -Dm644 stt-tflite.pc "$pkgdir/usr/lib/pkgconfig/stt-tflite.pc"
  fi

  # Install files.
  install -Dm755 libstt.so "$pkgdir/usr/lib/libstt.so.$pkgver"
  ln -s "/usr/lib/libstt.so.$pkgver" "$pkgdir/usr/lib/libstt.so"
  install -Dm644 stt.h "$pkgdir/usr/include"
  install -Dm644 stt.pc "$pkgdir/usr/lib/pkgconfig/stt.pc"
}