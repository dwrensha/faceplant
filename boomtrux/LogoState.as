package 
{
	import org.flixel.*;

	public class LogoState extends FlxState
	{
		[Embed(source="assets/dwarf.png")] private var ImgDwarf:Class;
		[Embed(source="assets/cursor.png")] private var ImgCursor:Class;
//		[Embed(source="assets/logo.mp3")] private var SndDwarf:Class;

                private var _s:FlxSprite;
		


		override public function create():void
		{

                        _s = new FlxSprite(100,0);
			_s.loadGraphic(ImgDwarf);
                        add(_s);

  //                      FlxG.play(SndDwarf);
                        
			FlxG.mouse.show(ImgCursor);

                        return;

		}

		override public function update():void
		{
                    super.update();

                    if(FlxG.mouse.justPressed() ){
                        FlxG.state = new PlayState();
                    }

                    return;
		}
	}
}
