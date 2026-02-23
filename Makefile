CC = 		lcc -Wa-l -Wl-m -Wl-j -Wl-y 

BIN = 		vampkiller.gb

all:		$(BIN)

clean:		
		rm -rf obj/* bin/*

romusage:	
		romusage bin/vampkiller.gb -sRe -sRp

fonttiles.o:	gfx/tilesets/fonttiles-127-58.c
		$(CC) -c -o obj/fonttiles.o gfx/tilesets/fonttiles-127-58.c

tsprites.o:	gfx/spriteset/tsprites-1-3.c
		$(CC) -c -o obj/tsprites.o gfx/spriteset/tsprites-1-3.c

title.o:	gfx/others/title.c
		$(CC) -c -o obj/title.o gfx/others/title.c

gameborder.o:	gfx/design/gameborder.c
		$(CC) -c -o obj/gameborder.o gfx/design/gameborder.c

textborder.o:	gfx/design/textborder.c
		$(CC) -c -o obj/textborder.o gfx/design/textborder.c

texte.o:	gfx/txt/texte.c
		$(CC) -c -o obj/texte.o gfx/txt/texte.c

rooms.o:        gfx/lvl/rooms.c
		$(CC) -c -o obj/rooms.o gfx/lvl/rooms.c

globals.o:	globals.c
		$(CC) -c -o obj/globals.o globals.c

cdesign.o:	cdesign.c
		$(CC) -c -o obj/cdesign.o cdesign.c

init.o:		init.c
		$(CC) -c -o obj/init.o init.c

engine.o:	engine.c
		$(CC) -c -o obj/engine.o engine.c

player.o:	player.c
		$(CC) -c -o obj/player.o player.c

gegner.o:	gegner.c 
		$(CC) -c -o obj/gegner.o gegner.c

text.o:		text.c
		$(CC) -c -o obj/text.o text.c

level.o:	level.c
		$(CC) -c -o obj/level.o level.c

umgebung.o:	umgebung.c
		$(CC) -c -o obj/umgebung.o umgebung.c

aktionen.o:	aktionen.c
		$(CC) -c -o obj/aktionen.o aktionen.c

vampkiller.o:	vampkiller.c
		$(CC) -c -o obj/vampkiller.o vampkiller.c

vampkiller.gb:	fonttiles.o tsprites.o title.o gameborder.o textborder.o texte.o rooms.o globals.o cdesign.o init.o engine.o player.o gegner.o text.o level.o umgebung.o aktionen.o vampkiller.o

		$(CC) -Wl-ya1B -Wm-yn"VAMPKILLER" -Wl-yt0x019  -o bin/vampkiller.gb obj/fonttiles.o obj/tsprites.o obj/title.o obj/gameborder.o obj/texte.o obj/textborder.o obj/rooms.o obj/globals.o obj/cdesign.o obj/init.o obj/engine.o obj/player.o obj/gegner.o obj/text.o obj/level.o obj/umgebung.o obj/aktionen.o obj/vampkiller.o
