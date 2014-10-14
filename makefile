all:	clean builddeb

builddeb:
	tar cvJf urbit_0.2.orig.tar.xz --exclude=.git urbit
	cd urbit && dpkg-buildpackage

breach:	builddeb
	git add urbit_0.2*
	git commit -v -m"breach"
	git push

clean:
	rm -f urbit_0.2-1.debian.tar.xz urbit_0.2-1.dsc urbit_0.2-1_i386.changes urbit_0.2-1_i386.deb urbit_0.2.orig.tar.xz urbit_0.2-1_amd64.changes urbit_0.2-1_amd64.deb urbit_0.2-1.debian.tar.gz urbit_0.2-1_armhf.changes urbit_0.2-1_armhf.deb
	cd urbit && make clean

distclean:
	cd urbit && make distclean && git pull
