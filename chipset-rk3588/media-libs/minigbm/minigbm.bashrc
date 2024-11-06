cros_pre_src_prepare_chipset_rk356x_patches() {
  if [ ${PV} != "9999" ]; then
    eapply -p1 ${CHIPSET_RK356x_BASHRC_FILESDIR}/0001-remove-unsupport-modifier.patch
  fi
}
