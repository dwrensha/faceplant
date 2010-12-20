package 
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{

		[Embed(source="assets/title.mp3")] private var SndTitle:Class;
                [Embed(source="assets/victorytiles.png")] private var ImgTiles:Class;
		[Embed(source="assets/menumap.png")] private var ImgMap:Class;

		[Embed(source="assets/starrysky.png")] private var ImgBackground:Class;
	        [Embed(source="assets/drop.png")] private var ImgDrop:Class;

                protected var _objects:FlxGroup;
		protected var _student:Student;
                protected var _exit: Door;
                protected var _score : FlxText;



		override public function create():void
		{

                    FlxState.bgColor = 0xff102010;

                    FlxG.score = 0;
                     
                    var bg: FlxSprite;
                    bg = new FlxSprite();
                    bg.loadGraphic(ImgBackground);
                    bg.scale = new FlxPoint(1,1);
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
		    _score.color = 0xbbbbee;
		    _score.size = 16;
		    _score.alignment = "left";
		    _score.scrollFactor = ssf;
		    add(_score);


                    var t:FlxText;
    		    t = new FlxText(50,40,200,"Or Perish");
		    t.alignment = "center";
                    t.scale = new FlxPoint(5,5);
                    t.color = 0xffff0000;
		    add(t);
                    

                    var t1:FlxText;
                    t1 = new FlxText(60,140,200, "by David Renshaw");
                    t1.alignment = "center";
                    t1.color = 0xffff0000;
		    add(t1);

                    _exit = new Door(19 * 16 + 8, 13 * 16);
                    add(_exit);

                    _student  = new Student(5 * 16, 13 * 16);
                    add(_student);

                    var cat : Cat;
                    cat = new Cat(2*16, 13*16 + 8);
                    add(cat);

                    var b : BakedGoods;
                    b = new BakedGoods(1 * 16, 13 * 16 + 8);
                    add(b);



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
		   _score.text = FlxG.score.toString();

                     return;
		}
	}
}
