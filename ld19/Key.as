package 
{
    import org.flixel.*;
    
    public class Key extends FlxSprite
    {
	[Embed(source="assets/key.png")] private var ImgKey:Class;
	[Embed(source="assets/coin.mp3")] private var SndKey:Class;

	
	public function Key(X:int,Y:int)
	{
	    super(X,Y);
	    loadGraphic(ImgKey,true,true,8,8);
            
            width = 8;
            height = 8;

            solid = true;

	}
		
	override public function update():void
	{
    
            super.update();
	}
		
    
    }
}