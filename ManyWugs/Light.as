package 
{
	import org.flixel.*;
 
	public class Light extends FlxSprite 
{
	[Embed(source="data/light.png")] private var LightImageClass:Class;
	[Embed(source = "data/darkness.png")] private var DarknessImage:Class;
 	private var darkness:FlxSprite;
 
	public function Light(x:Number, y:Number, darkness:FlxSprite):void 
	{
	super(x, y, LightImageClass);
 
	this.darkness = darkness;
	this.blend = "screen";
	}
 
	override public function render():void 
	{
	var screenXY:FlxPoint = getScreenXY();
	darkness.fill(0xff000000);
 	darkness.draw(this, screenXY.x, screenXY.y);
	}

	override public function update():void
	{
	this.x = FlxG.mouse.x - this.width/2;
	this.y = FlxG.mouse.y - this.height/2;
	super.update();
	}
}
}
