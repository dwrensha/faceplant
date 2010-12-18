package 
{
    import org.flixel.*;
    
    public class Door extends FlxSprite
    {
	[Embed(source="assets/door.png")] private var ImgDoor:Class;

	
	public function Door(X:int,Y:int)
	{
	    super(X,Y);
	    loadGraphic(ImgDoor,true,true,8,16);
            
            width = 8;
            height = 16;

            solid = false;

	}
		
	override public function update():void
	{
    
            super.update();
	}
		
    
    }
}