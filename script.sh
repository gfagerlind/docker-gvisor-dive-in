(
  set -e
  ARCH=$(uname -m)
  URL=https://storage.googleapis.com/gvisor/releases/release/latest/${ARCH}
  # wget ${URL}/runsc ${URL}/runsc.sha512 \
  #   ${URL}/containerd-shim-runsc-v1 ${URL}/containerd-shim-runsc-v1.sha512
  curl --remote-name-all ${URL}/runsc ${URL}/runsc.sha512 \
    ${URL}/containerd-shim-runsc-v1 ${URL}/containerd-shim-runsc-v1.sha512
  sha512sum -c runsc.sha512 \
    -c containerd-shim-runsc-v1.sha512
  rm -f *.sha512
  chmod a+rx runsc containerd-shim-runsc-v1
  #sudo mv runsc containerd-shim-runsc-v1 /usr/local/bin
)
# then add to /etc/docker/daemon.json (update here)
	# "runtimes": {
	# 	"gvisor": {
	# 		"path": "<here>/docker-gvisor-dive-in/runsc"
	# 	}
	# }
# then run
docker run --rm --runtime=gvisor -it busybox
