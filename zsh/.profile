export MOZ_ENABLE_WAYLAND=1
export SDL_VIDEODRIVER=wayland
export XDG_SESSION_TYPE=wayland
# does not play nicely with KeepassXC
# export QT_QPA_PLATFORM=wayland-egl
# might need this for IntelliJ if you experience issues
# export _JAVA_AWT_WM_NONREPARENTING=1

export PATH=~/.local/bin/scripts:$PATH

# do not send telemetry about dotnet core usage to Microsoft
export DOTNET_CLI_TELEMETRY_OPTOUT=1

