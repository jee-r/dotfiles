# Proxy
#proxy_socks () {
#    /usr/sbin/autossh -M 0 -f -N -D "$proxy_localport" -p "$proxy_sshport" "$proxy_user"@"$proxy_IP"
#}
#
#proxy2 () {
#    /usr/sbin/autossh -M 0 -f -N -D "$proxy2_localport" -p "$proxy2_sshport" "$proxy2_user"@"$proxy2_IP"
#}


## Irssi with proxy
#irssi_proxy () {
#    /usr/sbin/autossh -f -M 0 -N -L 34567:127.0.0.1:34567 user@host
#    /usr/sbin/irssi
#}
#proxy_irc () {
#    /usr/sbin/autossh -M 0 -f -N -D 34567 user@host
#}


# Misc
event_tester() {
  xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}

# reload Gtk theme on Gnome

reload_gtk_theme() {
  theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
  gsettings set org.gnome.desktop.interface gtk-theme ''
  sleep 1
  gsettings set org.gnome.desktop.interface gtk-theme $theme
}
