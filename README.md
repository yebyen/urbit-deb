urbit-deb
=========

urbit debs now for armhf on Stretch!

Welcome maintainers for other platforms and architectures.

This repo exists to help show how to build your own debs

You may be able to build them for yourself on your own system.  The armhf debs
were built on a Samsung Chromebook 303C with Debian Stretch (testing) Crouton.

Please report any issues with the packaged debs here.  I would be happy to make
any changes for any architecture if it's going to help someone.

The build scripts I use for the debs are in debs-{ARCH} for {amd64,i386,armhf}
You may find the patches included that I have applied for each architecture to
be helpful as well.

From a freshly installed (tested on Jessie) Debian or Ubuntu, copying this mess
into your terminal should get you set up with a packaged installation of urbit:

    ARCH=`arch`
    REPO=https://github.com/yebyen/urbit-deb.git
    sudo apt-get install git-core
    git clone --recursive --depth 1 $REPO urbit
    pushd urbit; pushd urbit
    patch -p1 < ../urbit-${ARCH}.diff
    popd
    sudo apt-get install -y debhelper libssl-dev \
      libncurses5-dev libgmp-dev libsigsegv-dev \
      ragel libtool autoconf cmake re2c
    make clean distclean
    make builddeb
    sudo dpkg -i urbit_*.deb
    popd
    echo "Package installed!"
    echo "Next, you should run:  urbit -c pier"
