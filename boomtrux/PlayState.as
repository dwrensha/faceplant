package 
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
                    
		protected var _objects:FlxGroup;
		protected var _dude:Dude;


		override public function create():void
		{


                    FlxState.bgColor = 0xffaabbdd;
/*                     
                    var bg: FlxSprite;
                    bg = new FlxSprite();
                    bg.loadGraphic(ImgBackground);
                    bg.scale = new FlxPoint(6,6);
                    bg.solid = false;
                    bg.fixed = true;
                    add(bg);
                    
*/


                    var t:FlxText;
    
		    t = new FlxText(20,20,100,"YOU ARE NOW PLAYING");
		    t.alignment = "center";
		    add(t);
                    

                    _dude  = new Dude(4 * 16, 5 * 16);
                    add(_dude);


                    // scrolling?
		    FlxG.follow(_dude,2.5);
		    FlxG.followAdjust(0.5,0.0);
		    FlxG.followBounds(0,0,640*2,480*2);

		    _objects = new FlxGroup();
                    _objects.add(_dude);


                    
                    return;

		}


		override public function update():void
		{

                    super.update();

	            collide();
                }


	}
}