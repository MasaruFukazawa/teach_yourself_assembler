# Use an Ubuntu base image with QEMU support
FROM multiarch/qemu-user-static as qemu
FROM i386/ubuntu

# Copy QEMU executable
COPY --from=qemu /usr/bin/qemu-i386-static /usr/bin

# Install necessary tools
RUN apt-get update && apt-get install -y gcc binutils file