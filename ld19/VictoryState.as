package 
{
	import org.flixel.*;

	public class VictoryState extends FlxState
	{

		[Embed(source="assets/victory.mp3")] private var SndVictory:Class;
                [Embed(source="assets/victorytiles.png")] private var ImgTiles:Class;
		[Embed(source="assets/victorymap.png")] private var ImgMap:Class;
	        [Embed(source="assets/door.mp3")] private var SndDoor:Class;

                protected var _objects:FlxGroup;
		protected var _student:Student;
                protected var _entrance: Door;
                protected var _exit: Door;
                protected var _score: FlxText;


		override public function create():void
		{


                    FlxState.bgColor = 0xff708090;


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
    
		    t = new FlxText(100,20,200,"YOU ARE VICTORIOUS");
		    t.alignment = "center";
		    add(t);
                    

                    _entrance = new Door(17 * 16 , 117 * 16);
                    add(_entrance);

                    _exit = new Door(18 * 16 , 2 * 16);
                    add(_exit);

                    var e : Elevator;
                    e = new Elevator(1 * 16, 117 * 16 + 8, 48);
                    add(e);


                    _student  = new Student(17 * 16, 117 * 16);
                    add(_student);


                    var cat : Cat;
                    cat = new Cat(6*16, 96*16 + 8);
                    add(cat);

                    cat = new Cat(9*16, 96*16 + 8);
                    add(cat);

                    populate();

                    // scrolling?
		    FlxG.follow(_student,2.5);
		    FlxG.followAdjust(0.5,0.5);
		    FlxG.followBounds(0,0,20*16, 120*16);

		    _objects = new FlxGroup();
                    _objects.add(_student);

                    FlxG.playMusic(SndVictory);
                    FlxG.play(SndDoor);
                    return;


		}

		override public function update():void
		{

                    super.update();

	            collide();

                   if(FlxG.keys.justPressed("UP")){
                        if(_student.overlaps(_exit)){
                            FlxG.state = new MenuState();
                        }
 
                   }

		   _score.text = FlxG.score.toString();
                   
                    return;
		}


                private function populate():void
                {
                    var b : BakedGoods;
                    b = new BakedGoods(6*16, 52 * 16 + 8);
                    add(b);
                    b = new BakedGoods(6*16 +8 , 52 * 16 + 8);
                    add(b);
                    b = new BakedGoods(7*16 , 52 * 16 + 8);
                    add(b);
                    b = new BakedGoods(7*16 + 8 , 52 * 16 + 8);
                    add(b);
                    b = new BakedGoods(8*16 , 52 * 16 + 8);
                    add(b);
                    b = new BakedGoods(8*16 + 8 , 52 * 16 + 8);
                    add(b);

                    var d : Dollars;

                    d = new Dollars(5*16, 74 * 16 + 8);
                    add(d);

                    d = new Dollars(5*16 + 8, 74 * 16 + 8);
                    add(d);

                    d = new Dollars(6*16 , 74 * 16 + 8);
                    add(d);


                    d = new Dollars(6*16, 74 * 16 + 8);
                    add(d);



                }

	}
}
