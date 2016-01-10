

GPRBUILD=`which gprbuild`
GPRCLEAN=`which gprclean`
EXECUTABLE=build/pipeline

all: $(EXECUTABLE)
clean:
	$(GPRCLEAN)

check: all
	./$(EXECUTABLE) & node0=\$! && sleep 1
	./a.out node1 ipc:///tmp/pipeline.ipc "Hello, World" || true

generated:  build/generated/nanomsg_nn_h.ads

build/pipeline:  generated
	$(GPRBUILD)


build/generated/nanomsg_nn_h.ads:
	(cd build/generated && gcc -fdump-ada-spec /usr/include/nanomsg/nn.h)

.PHONY: all check generated clean
