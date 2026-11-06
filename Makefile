LUA ?= lua
CLAY_PALETTE ?= ../clay.nvim/lua/clay/palette.lua

.PHONY: build check

build:
	$(LUA) scripts/build.lua $(CLAY_PALETTE) > themes/clay.yml

# Fails when themes/clay.yml is stale against the palette or a rule is broken.
check:
	$(LUA) scripts/build.lua $(CLAY_PALETTE) | diff -u themes/clay.yml -
