#CROSS_COMPILER_PREFIX := armeb-eabi-

CC 	:= $(CROSS_COMPILER_PREFIX)gcc
CXX := $(CROSS_COMPILER_PREFIX)g++
AS 	:= $(CROSS_COMPILER_PREFIX)as
AR 	:= $(CROSS_COMPILER_PREFIX)ar
LD 	:= $(CROSS_COMPILER_PREFIX)ld
NM  := $(CROSS_COMPILER_PREFIX)nm

cpu_core := corex-M0

ifeq ($(cpu_core), "cortex-M0")
CFLAGS := -march= -mcpu=cortex-M0 -mthumb 
endif

ifeq ($(cpu_core), "cortex-M3")
CFLAGS := -march= -mcpu=cortex-M3 -mthumb
endif