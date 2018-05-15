#!/usr/bin/env bash

# Create/append to: ~/.bash_profile

# termux-wake-lock

if ! pgrep -f "proot" >/dev/null ; then 
    # echo "[Starting chroot...]" && termux-chroot; else echo "[chroot is running]"; fi
    termux-chroot
# else 
#     echo "[chroot is running]" 
fi

if ! pgrep "sshd" >/dev/null ; then 
    # echo "[Starting sshd...]" && sshd && echo "[OK]"
    sshd
# else 
#     echo "[ssh is running]"; 
fi

exit 0
