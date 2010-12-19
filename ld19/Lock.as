package 
{
    import org.flixel.*;
    
    public class Lock extends FlxSprite
    {
	[Embed(source="assets/lock.png")] private var ImgLock:Class;

	
	public function Lock(X:int,Y:int)
	{
	    super(X,Y);
	    loadGraphic(ImgLock,true,true,16,16);
            
            width = 16;
            height = 16;

            solid = true;
            fixed = true;

	}
		
	override public function update():void
	{
    
            super.update();
	}
		
    
    }
}