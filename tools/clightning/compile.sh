[ ! -d lightning ] && git clone https://github.com/elementsproject/lightning.git

# out of source tree builds not supported
#mkdir -p build;
#(cd build; CC=aarch64-linux-gnu-gcc CONFIGURATOR_CC=gcc ../lightning/configure)
(cd lightning; \
	CC=aarch64-linux-gnu-gcc CONFIGURATOR_WRAPPER=qemu-aarch64-static ./configure && \
	MAKE_HOST=aarch64-linux-gnu BUILD=x86_64-linux-gnu make -j$(nproc))

# Need to wipe the directory before we can attempt building for armhf
(cd lightning; git clean -fdx -e external)

(cd lightning; \
	CC=arm-linux-gnueabihf-gcc CONFIGURATOR_WRAPPER=qemu-arm-static ./configure && \
	MAKE_HOST=arm-linux-gnueabihf BUILD=x86_64-linux-gnu make -j$(nproc))
