#
# Makefile for ssdv
#

PRJ := ssdv

CC  ?= gcc
CXX ?= g++


OPTLVL ?= 3
DBGLVL ?= 
CSTD   ?= gnu11
CXXSTD ?= gnu++14

DEFINES :=


CFLAGS  := -g$(DBGLVL) -O$(OPTLVL) -std=$(CSTD) -Wall $(DEFINES)
LDFLAGS := -g$(DBGLVL)


OBJS := main.o ssdv.o rs8.o
HDRS := ssdv.h rs8.h


all: $(PRJ)

ssdv: $(OBJS) $(HDRS)
	$(CC) $(LDFLAGS) $(OBJS) -o $(PRJ)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

install: all
	mkdir -p ${DESTDIR}/usr/bin
	install -m 755 $(PRJ) ${DESTDIR}/usr/bin

clean:
	rm -f *.o
	rm -f $(PRJ)

