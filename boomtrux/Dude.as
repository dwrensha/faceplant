package 
{
    import org.flixel.*;

    import Box2D.Dynamics.*;
    import Box2D.Collision.*;
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.Math.*;
    
    public class Dude extends B2FlxSprite
    {
	[Embed(source="assets/dude.png")] private var ImgDude:Class;
	
        protected var _width:Number = 16;
        protected var _height:Number = 16;


       	
	public function Dude(X:int,Y:int, w:b2World)
	{
	    super(X,Y, width, height, w);
	    loadGraphic(ImgDude,true,true,width,height);
            
            width = 16;
            height = 16;

            createBody();

            _obj.SetAngularDamping(0.1);

	}


	override public function update():void
	{
            super.update();


            var pos:b2Vec2 = _obj.GetPosition();
//            FlxG.log(pos.x + ", " + pos.y);



            var omega : Number = 0.0;
            var v : b2Vec2 = _obj.GetLinearVelocity();
            var theta : Number = _obj.GetAngle() - Math.PI / 2.0;

	    if(FlxG.keys.LEFT)
	    {
                _obj.SetAwake(true);
                omega = -1.5;

	    }
	    else if(FlxG.keys.RIGHT)
	    {
                _obj.SetAwake(true);
                omega = 1.5;
	    }
	    if(FlxG.keys.justPressed("SPACE"))
	    {
                
                var xf: Number = Math.cos(theta) ;
                var yf: Number = Math.sin(theta);

                FlxG.log(xf + ", "  + yf);
                _obj.ApplyImpulse(new b2Vec2(xf, yf  ),  _obj.GetPosition())

	    }



            _obj.SetAngularVelocity(omega);



	}

    
    }
}