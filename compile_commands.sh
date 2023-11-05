#!/bin/bash
echo Building the ARM Linux Hello World...
arm-linux-gnueabi-as -alh -o hw.o hw.S > hw.lst
arm-linux-gnueabi-ld --strip-all -o hw hw.o
