package 
{
	import org.flixel.*;

	public class VictoryState extends FlxState
	{

		[Embed(source="assets/victory.mp3")] private var SndVictory:Class;
                [Embed(source="assets/victorytiles.png")] private var ImgTiles:Class;
		[Embed(source="assets/victorymap.png")] private var ImgMap:Class;


                protected var _objects:FlxGroup;
		protected var _student:Student;
                protected var _entrance: Door;

		override public function create():void
		{

                    FlxState.bgColor = 0xff708090;


		    var tiles:FlxTilemap = new FlxTilemap();
		    tiles.auto = FlxTilemap.AUTO;
		    tiles.loadMap(FlxTilemap.imageToCSV(ImgMap,false,2),ImgTiles);
		    tiles.follow();
		    add(tiles);
                     
                    var t:FlxText;
    
		    t = new FlxText(100,20,200,"YOU ARE VICTORIOUS");
		    t.alignment = "center";
		    add(t);
                    

                    _entrance = new Door(17 * 16 , 117 * 16);
                    add(_entrance);

                    var e : Elevator;
                    e = new Elevator(1 * 16, 117 * 16 + 8, 48);
                    add(e);


                    _student  = new Student(17 * 16, 117 * 16);
                    add(_student);

                    // scrolling?
		    FlxG.follow(_student,2.5);
		    FlxG.followAdjust(0.5,0.0);
		    FlxG.followBounds(0,0,20*16, 120*16);

		    _objects = new FlxGroup();
                    _objects.add(_student);

                    FlxG.playMusic(SndVictory);
                    return;


		}

		override public function update():void
		{

                    super.update();

	            collide();


                    if(FlxG.keys.justPressed("R")){
                        FlxG.state = new PlayState();
                    }
                   
                    return;
		}
	}
}
