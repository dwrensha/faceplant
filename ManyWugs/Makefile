include ./paths
SRC = *.as
MAIN = HelloWorld.as
SWF = Game.swf
 
$(SWF) : $(SRC)
	$(MXMLC) -static-link-runtime-shared-libraries -sp $(FLIXEL) -o $(SWF) -- $(MAIN)