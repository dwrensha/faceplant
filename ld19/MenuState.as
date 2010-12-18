package 
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{
//		[Embed(source="assets/dwarf.png")] private var ImgDwarf:Class;
//		[Embed(source="assets/logo.mp3")] private var SndDwarf:Class;



		override public function create():void
		{

                     
                    var t:FlxText;
    
		    t = new FlxText(20,200,50,"click to continue");
		    t.alignment = "center";
		    add(t);
                    
                    return;

		}

		override public function update():void
		{
                    return;
		}
	}
}
