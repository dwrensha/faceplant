package 
{
//    import fl.controls.TextArea;
import flash.text.*;

    import org.flixel.*;
    
    import Box2D.Dynamics.*;
    import Box2D.Collision.*;
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.Math.*;

	public class PlayState extends FlxState
	{
                    
		[Embed(source="assets/background1.png")] private var ImgBackground:Class;


		protected var _dude:Dude;

                
                protected var _world : b2World;

		override public function create():void
		{

                    var gravity:b2Vec2 = new b2Vec2(0, 0);
                    _world = new b2World(gravity, true);


                    FlxState.bgColor = 0xffaabbaa;

                    var bg: FlxSprite;
                    bg = new FlxSprite();
                    bg.loadGraphic(ImgBackground);
                    bg.scale = new FlxPoint(6,6);
                    bg.solid = false;
                    bg.fixed = true;
                    add(bg);
                    


                    var t:FlxText;
    
		    t = new FlxText(10,20,300,"YOU ARE NOW BREATHING MANUALLY");
		    t.alignment = "center";
		    add(t);
                    

                    _dude  = new Dude(4 * 16, 5 * 16, _world);
                    add(_dude);


                    // scrolling
		    FlxG.follow(_dude,2.5);
		    FlxG.followAdjust(0.5,0.0);
		    //FlxG.followBounds(0,0,640*2,480*2);


                    var tf: TextField = new TextField();
                    tf.appendText("thing");
                    tf.x = 5;
                    tf.y = 10;

                    var bt : B2FlxText = new B2FlxText(100,100,"WHAT", _world);
                    add(bt);

                    bt  = new B2FlxText(100,100,"THE", _world);
                    add(bt);
                    


                    addChild(tf)
                    
                    return;

		}


		override public function update():void
		{

                    _world.Step(FlxG.elapsed,10,10);

                    super.update();

                    


                }


	}
}