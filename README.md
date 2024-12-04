Dive into [gvisor](https://gvisor.dev/)

My take is that its like an emulated kernel, somewhat similar to wine,
that is - it does not expose anything from the host kernel out of the box,
nor is it a vm, as in directly interacting with the hardware without going via
the host kernel (linux).

