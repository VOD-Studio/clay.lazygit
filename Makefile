LUA ?= lua
CLAY_PALETTE ?= ../clay.nvim/lua/clay/palette.lua

.PHONY: build

build:
	$(LUA) scripts/build.lua $(CLAY_PALETTE) > themes/clay.yml
