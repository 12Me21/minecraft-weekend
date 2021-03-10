CFLAGS = -std=c11 -O3 -g -Wall -Wextra -Wstrict-aliasing
CFLAGS += -Wno-pointer-arith -Wno-newline-eof -Wno-unused-parameter -Wno-gnu-statement-expression
CFLAGS += -Wno-gnu-compound-literal-initializer -Wno-gnu-zero-variadic-macro-arguments
#-fbracket-depth=1024

includes:= lib/cglm/include lib/glad/include lib/glfw/include lib/stb lib/noise
libfiles:= lib/glad/src/glad.o lib/cglm/libcglm.a lib/glfw/src/libglfw3.a lib/noise/libnoise.a
libs:= dl pthread m

srcs := $(patsubst %.c,%,$(shell find src/ -name '*.c'))
output := game

all: $(output) lib/cglm/.git lib/glfw/.git

include .Nice.mk

lib/glad/src/glad.o:
	cd lib/glad && gcc -o src/glad.o -Iinclude -c src/glad.c
lib/cglm/libcglm.a: lib/cglm/.git
	cd lib/cglm && cmake . -DCGLM_STATIC=ON && make
lib/glfw/src/libglfw3.a: lib/glfw/.git
	cd lib/glfw && cmake . && make glfw
lib/noise/libnoise.a:
	cd lib/noise && make

lib/%/include:
	git submodule update --init --depth=1 $(dir $@)

lib/%/.git:
	git submodule update --init --depth=1 $(dir $@)
