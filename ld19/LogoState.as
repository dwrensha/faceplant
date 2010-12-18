package 
{
	import org.flixel.*;

	public class LogoState extends FlxState
	{
		[Embed(source="assets/dwarf.png")] private var ImgDwarf:Class;
		[Embed(source="assets/logo.mp3")] private var SndDwarf:Class;

                private var _s:FlxSprite;
		private var _t2:FlxText;
		private var _ok:Boolean;
		
		override public function create():void
		{

                    
                        _s = new FlxSprite(100,0);
			_s.loadGraphic(ImgDwarf);
                        add(_s)

		}

		override public function update():void
		{
                    return;
		}
	}
}
