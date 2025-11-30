# Rocky 10 RPi MMC Builder

Builds tiny kernel-rpi-mmc-modules RPM (4-6 MB) with bcm2835_sdhost.ko + mmc_block.ko for vanilla 6.12 kernel.

Works on any aarch64 host (RPi 4/5 itself ok).

Trigger: manual or GitHub Actions on new kernel.

Install: dnf install ./repo/kernel-rpi-mmc-modules-*.rpm ; dracut -f ; reboot
