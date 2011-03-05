package 
{
    import org.flixel.*;
    
    public class Dude extends FlxSprite
    {
	[Embed(source="assets/dude.png")] private var ImgDude:Class;
	


       	
	public function Dude(X:int,Y:int)
	{
	    super(X,Y);
	    loadGraphic(ImgDude,true,true,16,16);
            
            width = 16;
            height = 16;

	}
		
	override public function update():void
	{

	    acceleration.x = 0;
	    if(FlxG.keys.LEFT)
	    {
		facing = LEFT;
	    }
	    else if(FlxG.keys.RIGHT)
	    {
		facing = RIGHT;
	    }
	    if(FlxG.keys.justPressed("SPACE"))
	    {

	    }




            super.update();
	}

    
    }
}