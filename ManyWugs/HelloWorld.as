package 
{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	[SWF(width="576", height="448", backgroundColor="#000000")] 
 
	public class HelloWorld extends FlxGame
	{
	[Embed(source="data/Nitz.ttf", fontFamily="Nitz", embedAsCFF="false")] 	public var Nitz:String;
		public function HelloWorld()
		{
			super(144,112,MenuState,4); //Create a new FlxGame object at 320x240 with 4x pixels, then load PlayState
		}
	}
}