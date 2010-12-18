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
                    
                    var door : Door;
                    door = new Door(77 * 16, 58 * 16);
                    add(door);

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

                    if(FlxG.keys.justPressed("W")){
                        FlxG.state = new PlayState1();
                    }
                    

                    
                    
                    return;
		}
	}
}