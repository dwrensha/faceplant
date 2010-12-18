package {

	import org.flixel.*;
	import LogoState;
	
	[SWF(width="640", height="480", backgroundColor="#000000")]
//	[Frame(factoryClass="Preloader")]

	public class Game extends FlxGame
	{
		public function Game():void
		{
			super(320,240,LogoState);
			FlxState.bgColor = 0xffffffee;
			useDefaultHotKeys = true;
		}
	}
}
