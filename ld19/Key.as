package 
{
    import org.flixel.*;
    
    public class Key extends FlxSprite
    {
	[Embed(source="assets/key.png")] private var ImgKey:Class;

	
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
		
	override public function hitSide(Contact:FlxObject,Velocity:Number):void { collect(); }
	override public function hitBottom(Contact:FlxObject,Velocity:Number):void { collect(); }
	override public function hitTop(Contact:FlxObject,Velocity:Number):void { collect(); }

    
        public function collect() : void
        {
            exists = false;
        }

    }
}