sudo tee -a /lib/systemd/system/onboot.service > /dev/null <<'EOF'
[Unit]
Description=Runs on boot
After=multi-user.target

[Service]
Type=idle
ExecStart=sh /etc/onboot

[Install]
WantedBy=multi-user.target
EOF
sudo chmod 644 /lib/systemd/system/onboot.service
sudo systemctl daemon-reload
sudo systemctl enable onboot.service

# source onboot file at startup (obsolete)
# awk '/^exit 0$/{print "source /etc/onboot"}1' /etc/rc.local | sudo tee /etc/rc.local > /dev/null