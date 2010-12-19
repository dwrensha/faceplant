package 
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{

		[Embed(source="assets/title.mp3")] private var SndTitle:Class;
                [Embed(source="assets/victorytiles.png")] private var ImgTiles:Class;
		[Embed(source="assets/menumap.png")] private var ImgMap:Class;

                protected var _objects:FlxGroup;
		protected var _student:Student;
                protected var _exit: Door;


		override public function create():void
		{

                    FlxState.bgColor = 0xff102010;
                     

		    var tiles:FlxTilemap = new FlxTilemap();
		    tiles.auto = FlxTilemap.AUTO;
		    tiles.loadMap(FlxTilemap.imageToCSV(ImgMap,false,2),ImgTiles);
		    tiles.follow();
		    add(tiles);


                    var t:FlxText;
    		    t = new FlxText(40,40,200,"Or Perish");
		    t.alignment = "center";
                    t.scale = new FlxPoint(5,5);
                    t.color = 0xffff0000;
		    add(t);
                    

                    var t1:FlxText;
                    t1 = new FlxText(50,140,200, "by David Renshaw");
                    t1.alignment = "center";
                    t1.color = 0xffff0000;
		    add(t1);

                    _exit = new Door(19 * 16 + 8, 13 * 16);
                    add(_exit);

                    _student  = new Student(2 * 16, 13 * 16);
                    add(_student);

                    // scrolling?
		    FlxG.follow(_student,2.5);
		    FlxG.followAdjust(0.5,0.0);
		    FlxG.followBounds(1 * 16,0,21*16, 15*16);

		    _objects = new FlxGroup();
                    _objects.add(_student);



                    FlxG.playMusic(SndTitle);

                    FlxG.mouse.hide();

                    return;

		}

		override public function update():void
		{

                    super.update();

	            collide();

                   if(FlxG.keys.justPressed("UP")){
                        if(_student.overlaps(_exit)){
                            FlxG.state = new PlayState();
                        }
 
                   }

                     return;
		}
	}
}
