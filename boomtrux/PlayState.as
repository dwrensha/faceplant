package 
{
	import org.flixel.*;

        import Box2D.Dynamics.*;
        import Box2D.Collision.*;
        import Box2D.Collision.Shapes.*;
        import Box2D.Common.Math.*;

	public class PlayState extends FlxState
	{
                    
		protected var _objects:FlxGroup;
		protected var _dude:Dude;

                
                protected var _world : b2World;

		override public function create():void
		{

                    var gravity:b2Vec2 = new b2Vec2(0, 0.0);
                    _world = new b2World(gravity, true);

                    FlxState.bgColor = 0xffaabbaa;


                    var t:FlxText;
    
		    t = new FlxText(20,20,100,"YOU ARE NOW PLAYING");
		    t.alignment = "center";
		    add(t);
                    

                    _dude  = new Dude(4 * 16, 5 * 16, _world);
                    add(_dude);


                    // scrolling?
		    FlxG.follow(_dude,2.5);
		    FlxG.followAdjust(0.5,0.0);
		    FlxG.followBounds(0,0,640*2,480*2);

		    _objects = new FlxGroup();
                    _objects.add(_dude);


                    
                    return;

		}


		override public function update():void
		{

                    _world.Step(FlxG.elapsed,10,10);

                    super.update();

                    


                }


	}
}