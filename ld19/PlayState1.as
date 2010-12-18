package 
{
	import org.flixel.*;

	public class PlayState1 extends FlxState
	{
		[Embed(source="assets/verdant_tiles.png")] private var ImgVerdant:Class;
		[Embed(source="assets/autotiles1.png")] private var ImgTiles:Class;
		[Embed(source="assets/map1.png")] private var ImgMap:Class;
		[Embed(source="assets/background1.png")] private var ImgBackground:Class;
		[Embed(source="assets/spooky.mp3")] private var SndSpooky:Class;



		protected var _objects:FlxGroup;
		protected var _student:Student;
                protected var _exit:Door;

		override public function create():void
		{

                    FlxState.bgColor = 0xff305040;
                     
                    var bg: FlxSprite;
                    bg = new FlxSprite();
                    bg.loadGraphic(ImgBackground);
                    bg.scale = new FlxPoint(6,6);
                    add(bg);

                    FlxG.playMusic(SndSpooky);

		    var tiles:FlxTilemap = new FlxTilemap();
		    tiles.auto = FlxTilemap.AUTO;
		    tiles.loadMap(FlxTilemap.imageToCSV(ImgMap,false,2),ImgTiles);
		    tiles.follow();
		    add(tiles);

                    var t:FlxText;
    
		    t = new FlxText(20,20,200,"YOU ARE STILL PLAYING");
		    t.alignment = "center";
		    add(t);
                    

                    _exit = new Door(76 * 16 + 8, 58 * 16);
                    add(_exit);

                    _student  = new Student(4 * 16, 5 * 16);
                    add(_student);



                    // scrolling?
		    FlxG.follow(_student,2.5);
		    FlxG.followAdjust(0.5,0.0);
		    FlxG.followBounds(0,0,640*2,480*2);

		    _objects = new FlxGroup();
                    _objects.add(_student);
                    
                    return;

		}


		override public function update():void
		{

                    super.update();

	            collide();

                    
                   if(FlxG.keys.justPressed("UP")){
                        if(_student.overlaps(_exit)){
                            FlxG.state = new VictoryState();
                        }
                    }
                    
                    
                    return;
		}
	}
}