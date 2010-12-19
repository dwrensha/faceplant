package 
{
    import org.flixel.*;
    
    public class Elevator extends FlxSprite
    {
	[Embed(source="assets/elevator.png")] private var ImgElevator:Class;

	
        protected var _goingUp : Boolean;
        protected var _stopY : int;

	public function Elevator(X:int,Y:int, stopY: int)
	{
	    super(X,Y);
	    loadGraphic(ImgElevator,true,true,48,8);
            

            width = 48;
            height = 8;

            solid = true;

            _goingUp = false;
            _stopY = stopY;

	}
		
	override public function update():void
	{
            if(y < _stopY){_goingUp = false; velocity.y = 0; fixed = true;}
            if(_goingUp){velocity.y = -130;    }
            super.update();
	}
		

	override public function hitTop(Contact:FlxObject,Velocity:Number):void 
        {     
            if(y > _stopY){_goingUp = true;  }


            return super.hitTop(Contact,Velocity);
        }

    
    }
}