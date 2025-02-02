# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#inherit unpacker

DESCRIPTION="Mali drivers, binary only install"
HOMEPAGE=""
#SRC_URI="http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/mali-drivers-valhall-cherry-${PV}.run"

LICENSE="Google-TOS"
SLOT="0"
KEYWORDS="-* arm64 arm"

RESTRICT="arm? ( binchecks )"

RDEPEND="
	>=x11-libs/libdrm-2.4.97
	!media-libs/mali-drivers-valhall
	!media-libs/mesa
    	sys-libs/gcc-libs-bin
"

S=$WORKDIR

src_unpack() {
  unpack ${FILESDIR}/libmali-bifrost-g52-g13p0.tar.gz
}

src_install() {
  einfo "cp -pPR ${S}/$(get_libdir) ${D}/usr/$(get_libdir)"
  mkdir ${D}/usr
	cp -pPR ${S}/$(get_libdir) ${D}/usr/$(get_libdir) || die "Install failed!"
}
