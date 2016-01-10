

GPRBUILD=`which gprbuild`
GPRCLEAN=`which gprclean`
EXECUTABLE=build/pipeline

all: $(EXECUTABLE)
clean:
	$(GPRCLEAN) -Ppipeline

check: all build/c_pipeline
	./t/bin/bats ./t/*.bats

generated:  build/generated/nanomsg_nn_h.ads

build/pipeline:  generated
	$(GPRBUILD) -Ppipeline

build/c_pipeline: contrib/pipeline.c
	$(CC) -lnanomsg -o build/c_pipeline contrib/pipeline.c

build/generated/nanomsg_nn_h.ads:
	(cd build/generated && gcc -fdump-ada-spec /usr/include/nanomsg/nn.h)

.PHONY: all check generated clean
