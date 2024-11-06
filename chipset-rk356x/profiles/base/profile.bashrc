filter_unsupported_gcc_flags() {
        local var flag flags=()
        for var in CFLAGS CXXFLAGS LDFLAGS; do
                for flag in ${!var}; do
                        if [[ ${flag} != "-Xcompiler" && \
                              ${flag} != "-Wl,--icf=all" && \
															${flag} != "-mfpu=crypto-neon-fp-armv8" && \
															${flag} != "-mfloat-abi=hard" && \
                              ${flag} != "--unwindlib=libunwind" ]]; then
                                flags+=("${flag}")
                        fi
                done
                export ${var}="${flags[*]}"
                flags=()
        done
}

chipset_rk356x_stack_bashrc() {
  local cfg cfgd

  cfgd="/mnt/host/source/src/overlays/chipset-rk356x/${CATEGORY}/${PN}"
  for cfg in ${PN} ${P} ${PF} ; do
    cfg="${cfgd}/${cfg}.bashrc"
    [[ -f ${cfg} ]] && . "${cfg}"
  done

  export CHIPSET_RK356x_BASHRC_FILESDIR="${cfgd}/files"
}

chipset_rk356x_stack_bashrc
