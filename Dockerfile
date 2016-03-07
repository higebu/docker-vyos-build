FROM debian:jessie

RUN apt-get update && apt-get -y install sudo wget make live-build pbuilder devscripts python-pystache \
    qemu-system-x86 qemu-utils zlib1g-dev git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    wget https://releases.hashicorp.com/packer/0.9.0/packer_0.9.0_linux_amd64.zip && \
    unzip packer_0.9.0_linux_amd64.zip && \
    mv packer /usr/local/bin/ && \
    rm packer_0.9.0_linux_amd64.zip && \
    git clone https://github.com/vmware/open-vmdk.git && \
    cd open-vmdk && \
    make && \
    mv build/vmdk/vmdk-convert /usr/local/bin/ && \
    chmod +x /usr/local/bin/vmdk-convert && \
    cd .. && \
    rm -rf open-vmdk

CMD ["/bin/bash"]
