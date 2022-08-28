helloworld=0
sendfile=0
testconfig=0
upstream=0
subrequest=0
testfilter=0

MODULE_PATH=
ADD_MODULE_ARGS=
NGX_PATH=$(PWD)/nginx-1.22.0
PREFIX_ROOT=
# 自定义configure参数
CONFIGS=

debug=1
prefix=

ifeq ($(helloworld), 1)
	MODULE_PATH=$(PWD)/chapter3/helloworld
else ifeq ($(sendfile), 1)
	MODULE_PATH=$(PWD)/chapter3/sendfile
else ifeq ($(testconfig), 1)
	MODULE_PATH=$(PWD)/chapter4/
else ifeq ($(upstream), 1)
	MODULE_PATH=$(PWD)/chapter5/upstream
else ifeq ($(subrequest), 1)
	MODULE_PATH=$(PWD)/chapter5/subrequest
else ifeq ($(testfilter), 1)
	MODULE_PATH=$(PWD)/chapter6/
else
	MODULE_PATH=
endif

ifneq ($(MODULE_PATH),)
	ADD_MODULE_ARGS=--add-module=$(MODULE_PATH)
endif

ifeq ($(debug),1)
	DEBUB_LOG=--with-debug 
endif

ifneq ($(prefix),)
	PREFIX_ROOT="--prefix=$(prefix)"
endif


all:	build install

.PHONY:	all build install

build:
	cd $(NGX_PATH) && \
		./configure $(ADD_MODULE_ARGS) $(DEBUB_LOG) $(PREFIX_ROOT) $(CONFIGS)
	$(MAKE) -j4 -C $(NGX_PATH)

install:
	$(MAKE) -C $(NGX_PATH) install

clean:
	$(MAKE) -C $(NGX_PATH) clean

# 热部署更新
upgrade:
	$(MAKE) -C $(NGX_PATH) upgrade

.PHONY: clean uninstall
