include ./paths
SRC = ./*.as ./assets/*
MAIN = Game.as
SWF = Game.swf
BOX2D = ./box2d/Source/ 
FLIXEL = ./flixel/

$(SWF) : $(SRC)
	$(MXMLC) -static-link-runtime-shared-libraries -sp $(FLIXEL) $(BOX2D) -o $(SWF) -- $(MAIN)