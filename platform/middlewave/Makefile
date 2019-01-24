SUBDIRS += app 
SOURCES_DIR = 

mkfile_path := $(abspath $(lastword) $(MAKEFILE_LIST)))
export PROJECT_PATH := $(patsubst %/,%,$(dir $(mkfile_path)))
export MAKE_INCLUDE=$(PROJECT_PATH)/scripts/rule.mk
include $(MAKE_INCLUDE)