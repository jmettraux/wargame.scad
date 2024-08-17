
#
# Makefile


SCAD = bases/warhammer_fantasy.scad

b20:
	openscad $(SCAD) -D length=20 -D width=20 -o whf_base_20x20.stl
b25:
	openscad $(SCAD) -D length=25 -D width=25 -o whf_base_25x25.stl
b2550:
	openscad $(SCAD) -D length=25 -D width=50 -o whf_base_25x50.stl
b40:
	openscad $(SCAD) -D length=40 -D width=40 -o whf_base_40x40.stl

bases: b20 b25 b2550 b40
	ls -alh whf_base_*.stl


.PHONY: bases

