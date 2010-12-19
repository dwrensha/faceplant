package 
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source="assets/verdant_tiles.png")] private var ImgVerdant:Class;
		[Embed(source="assets/autotiles.png")] private var ImgTiles:Class;
		[Embed(source="assets/map.png")] private var ImgMap:Class;
		[Embed(source="assets/background.png")] private var ImgBackground:Class;


		protected var _objects:FlxGroup;
		protected var _student:Student;
                protected var _exit:Door;


		override public function create():void
		{

                    FlxState.bgColor = 0xffaabbdd;
                     
                    var bg: FlxSprite;
                    bg = new FlxSprite();
                    bg.loadGraphic(ImgBackground);
                    bg.scale = new FlxPoint(6,6);
                    add(bg);
                    

		    var tiles:FlxTilemap = new FlxTilemap();
		    tiles.auto = FlxTilemap.AUTO;
		    tiles.loadMap(FlxTilemap.imageToCSV(ImgMap,false,2),ImgTiles);
		    tiles.follow();
		    add(tiles);

                    var t:FlxText;
    
		    t = new FlxText(20,20,100,"YOU ARE NOW PLAYING");
		    t.alignment = "center";
		    add(t);
                    

                    _exit = new Door(77 * 16, 58 * 16);
                    add(_exit);

                    var k: Key;
                    k = new Key(9 * 16, 5 * 16 + 8);
                    add(k);

                    var lock: Lock;
                    lock = new Lock(72 * 16, 58 * 16 );
                    add(lock);

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
                            FlxG.state = new PlayState1();
                        }
                    }
                    

                    
                    
                    return;
		}
	}
}