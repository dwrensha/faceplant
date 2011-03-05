package {

	import org.flixel.*;
	
	[SWF(width="640", height="480", backgroundColor="#000000")]
//	[Frame(factoryClass="FlxPreloader")]

	public class Game extends FlxGame
	{
		public function Game():void
		{
			super(320,240,LogoState);
//                        pause = new Pause();
			FlxState.bgColor = 0xff010100;
			useDefaultHotKeys = true;
		}
	}
}
