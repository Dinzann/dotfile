修改 LinuxQQ 的启动脚本 /usr/bin/linuxqq，在 exec 行前添加：

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
exec /opt/QQ/qq ${QQ_USER_FLAGS[@]} --ozone-platform-hint=auto --enable-wayland-ime "$@"
