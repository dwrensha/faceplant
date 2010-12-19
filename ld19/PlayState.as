package 
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source="assets/verdant_tiles.png")] private var ImgVerdant:Class;
		[Embed(source="assets/autotiles.png")] private var ImgTiles:Class;
		[Embed(source="assets/map.png")] private var ImgMap:Class;
		[Embed(source="assets/background.png")] private var ImgBackground:Class;

	        [Embed(source="assets/door.mp3")] private var SndDoor:Class;
                    
		protected var _objects:FlxGroup;
		protected var _student:Student;
                protected var _exit:Door;
                protected var _entrance:Door;
                protected var _key: Key;
                protected var _lock: Lock;

                protected var _score: FlxText;


		override public function create():void
		{


                    FlxState.bgColor = 0xffaabbdd;
                     
                    var bg: FlxSprite;
                    bg = new FlxSprite();
                    bg.loadGraphic(ImgBackground);
                    bg.scale = new FlxPoint(6,6);
                    bg.solid = false;
                    bg.fixed = true;
                    add(bg);
                    

		    var tiles:FlxTilemap = new FlxTilemap();
		    tiles.auto = FlxTilemap.AUTO;
		    tiles.loadMap(FlxTilemap.imageToCSV(ImgMap,false,2),ImgTiles);
		    tiles.follow();
		    add(tiles);

		    var ssf:FlxPoint = new FlxPoint(0,0);
		    _score = new FlxText(0,0,FlxG.width);
		    _score.color = 0xff000000;
		    _score.size = 16;
		    _score.alignment = "left";
		    _score.scrollFactor = ssf;
		    add(_score);



                    var t:FlxText;
    
		    t = new FlxText(20,20,100,"YOU ARE NOW PLAYING");
		    t.alignment = "center";
		    add(t);
                    

                    _exit = new Door(77 * 16, 58 * 16);
                    add(_exit);

                    _entrance = new Door(4 * 16 , 5 * 16);
                    add(_entrance);

                    _key = new Key(9 * 16, 5 * 16 + 8);
//                    _key = new Key(5 * 16, 5 * 16 + 8);
                    add(_key);

                    

                    _lock = new Lock(72 * 16, 58 * 16 );
                    add(_lock);

                    _student  = new Student(4 * 16, 5 * 16);
                    add(_student);

                    populate();

                    // scrolling?
		    FlxG.follow(_student,2.5);
		    FlxG.followAdjust(0.5,0.0);
		    FlxG.followBounds(0,0,640*2,480*2);

		    _objects = new FlxGroup();
                    _objects.add(_student);


                    FlxG.play(SndDoor);
                    
                    return;

		}


		override public function update():void
		{

                    super.update();

	            collide();

                    if(FlxG.keys.justPressed("UP")){
                        if(_student.overlaps(_exit)){
//                            _exit.enter();
                            FlxG.state = new PlayState1();
                        }
 

                   }
		   _score.text = FlxG.score.toString();
                    
                    
                    return;
		}



                private function populate():void
                {
                    var b : BakedGoods;
                    b = new BakedGoods(5*16, 11 * 16 + 8);
                    add(b);

                    var d : Dollars;

                    d = new Dollars(5*16, 43 * 16 + 8);
                    add(d);

                    d = new Dollars(5*16 + 8, 43 * 16 + 8);
                    add(d);

                    d = new Dollars(6*16 , 43 * 16 + 8);
                    add(d);


                    d = new Dollars(52*16, 46 * 16 + 8);
                    add(d);

                    d = new Dollars(52*16 + 8, 46 * 16 + 8);
                    add(d);


                }
	}
}