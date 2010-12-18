package 
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source="assets/verdant_tiles.png")] private var ImgVerdant:Class;
		[Embed(source="assets/autotiles.png")] private var ImgTiles:Class;
		[Embed(source="assets/map.png")] private var ImgMap:Class;


		protected var _objects:FlxGroup;
		protected var _student:Student;

		override public function create():void
		{

                    FlxState.bgColor = 0xffaabbdd;
                     

		    var tiles:FlxTilemap = new FlxTilemap();
		    tiles.auto = FlxTilemap.AUTO;
		    tiles.loadMap(FlxTilemap.imageToCSV(ImgMap,false,2),ImgTiles);
		    tiles.follow();
		    add(tiles);

                    var t:FlxText;
    
		    t = new FlxText(20,20,100,"YOU ARE NOW PLAYING");
		    t.alignment = "center";
		    add(t);
                    

                    _student  = new Student(100,480 - 32);
                    add(_student);

                    // scrolling?
		    FlxG.follow(_student,2.5);
		    FlxG.followAdjust(0.5,0.0);
		    FlxG.followBounds(0,0,640,480);

		    _objects = new FlxGroup();
                    _objects.add(_student);
                    
                    return;

		}


		override public function update():void
		{

                    super.update();

//			FlxU.collide(_objects,_objects);

                    if(FlxG.keys.justPressed("SPACE")){
                        FlxG.state = new VictoryState();
                    }
                    

                    
                    
                    return;
		}
	}
}