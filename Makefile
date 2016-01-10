

GPRBUILD=`which gprbuild`
GPRCLEAN=`which gprclean`

all: build/pipeline build/pubsub
clean:
	$(GPRCLEAN) -Ppipeline
	$(GPRCLEAN) -Ppubsub

check: all build/c_pipeline build/c_pubsub
	./t/bin/bats ./t/*.bats

generated:  build/generated/nanomsg_nn_h.ads

build/pipeline: pipeline.adb
	$(GPRBUILD) -Ppipeline

build/pubsub: pubsub.adb
	$(GPRBUILD) -Ppubsub

build/c_pipeline: contrib/pipeline.c
	$(CC) -lnanomsg -o build/c_pipeline contrib/pipeline.c

build/c_pubsub: contrib/pubsub_client.c
	$(CC) -lnanomsg -o build/c_pubsub contrib/pubsub_client.c

build/generated/nanomsg_nn_h.ads:
	(cd build/generated && gcc -fdump-ada-spec /usr/include/nanomsg/nn.h)

.PHONY: all check generated clean
