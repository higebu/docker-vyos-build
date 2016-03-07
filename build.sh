#!/bin/bash

cd vyos-build
./configure
make iso
make qemu
make vmware-ovf
