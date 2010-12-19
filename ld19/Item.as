package 
{
    import org.flixel.*;


    
    public class Item extends FlxSprite
    {

        [Embed(source="assets/itempickup.mp3")] private var SndPickup:Class;

	public var value : int;

	public function Item(X:int,Y:int, v: int)
	{
	    super(X,Y);

            value = v;
            solid = true;

	}
		
	override public function update():void
	{
            super.update();
	}
		

        public function pickup():void
        {
            FlxG.play(SndPickup);
            exists = false;
        }

    
    }
}