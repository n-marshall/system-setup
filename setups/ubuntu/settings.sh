
appendIfMissing $REPO/configs/ubuntu/onboot.service /lib/systemd/system/onboot.service
sudo chmod 644 /lib/systemd/system/onboot.service
sudo systemctl daemon-reload
sudo systemctl enable onboot.service

appendIfMissing 