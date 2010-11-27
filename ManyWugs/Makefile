MXMLC = /Applications/Flixel/flex_sdk_4.1.0.16076/bin/mxmlc
FLIXEL = /Applications/Flixel/AdamAtomic-flixel-b9fe564/
SRC = *.as
MAIN = HelloWorld.as
SWF = Game.swf
 
$(SWF) : $(SRC)
	$(MXMLC) -static-link-runtime-shared-libraries -sp $(FLIXEL) -o $(SWF) -- $(MAIN)