SUBDIRS := elasticsearch postgres proxy

all: docker

docker: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ docker

.PHONY: $(SUBDIRS)
