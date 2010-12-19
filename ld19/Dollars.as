package 
{
    import org.flixel.*;
    
    public class Dollars extends Item
    {
	[Embed(source="assets/dollars.png")] private var ImgDollars:Class;

	
	public function Dollars(X:int,Y:int)
	{
	    super(X,Y, 100);
	    loadGraphic(ImgDollars,true,true,8,8);
            
            width = 8;
            height = 8;


	}
		
	override public function update():void
	{
    
            super.update();
	}
		
/*
        public function enter():void
        {
            FlxG.play(SndDoor);
        }
*/
    
    }
}