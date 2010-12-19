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


                    FlxState.bgColor = 0xff305040;
                     
                    var bg: FlxSprite;
                    bg = new FlxSprite();
                    bg.loadGraphic(ImgBackground);
                    bg.scale = new FlxPoint(6,6);
                    bg.solid = false;
                    bg.fixed = true;
                    add(bg);

                    FlxG.playMusic(SndSpooky);
                    FlxG.play(SndDoor);

		    var tiles:FlxTilemap = new FlxTilemap();
		    tiles.auto = FlxTilemap.AUTO;
		    tiles.loadMap(FlxTilemap.imageToCSV(ImgMap,false,2),ImgTiles);
		    tiles.follow();
		    add(tiles);


		    var ssf:FlxPoint = new FlxPoint(0,0);
		    _score = new FlxText(0,0,FlxG.width);
		    _score.color = 0xddddee;
		    _score.size = 16;
		    _score.alignment = "left";
		    _score.scrollFactor = ssf;
		    add(_score);


                    var t:FlxText;
    
		    t = new FlxText(20,20,200,"YOU ARE STILL PLAYING");
		    t.alignment = "center";
		    add(t);
                    

                    _exit = new Door(76 * 16 + 8, 58 * 16);
                    add(_exit);

                    _entrance = new Door(4 * 16 , 5 * 16);
                    add(_entrance);


                    _key = new Key(16 * 16, 5 * 16 + 8);
                    add(_key);

                    _lock = new Lock(72 * 16, 58 * 16 );
                    add(_lock);

                    _student  = new Student(4 * 16, 5 * 16);
                    add(_student);


                    var cat : Cat;
                    cat = new Cat(49*16, 35*16 + 8);
                    add(cat);

                    populate();

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
                    
                    _score.text = FlxG.score.toString();
                   
                    return;
		}

                private function populate():void
                {
                    var b : BakedGoods;
                    b = new BakedGoods(4*16, 24 * 16 + 8);
                    add(b);

                    var d : Dollars;

                    d = new Dollars(62*16, 31 * 16 + 8);
                    add(d);




                }




	}
}