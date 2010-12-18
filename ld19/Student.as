package 
{
    import org.flixel.*;
    
    public class Student extends FlxSprite
    {
	[Embed(source="assets/student.png")] private var ImgStudent:Class;
	
	private var _up:Boolean;
	private var _down:Boolean;
        


	
	public function Student(X:int,Y:int)
	{
	    super(X,Y);
	    loadGraphic(ImgStudent,true,true,8,16);
            
            width = 8;
            height = 16;



	    //basic player physics
	    var runSpeed:uint = 80;
	    drag.x = runSpeed * 3;
//	    acceleration.y = 420;
	  //  _jumpPower = 200;
	    maxVelocity.x = runSpeed;
	//    maxVelocity.y = _jumpPower;


	    addAnimation("stand", [0]);
	    addAnimation("walk", [1,2], 5);
            

	}
		
	override public function update():void
	{
    
            if(velocity.x == 0){
                play("stand");
            }
            else {
                play("walk");
            }


	    acceleration.x = 0;
	    if(FlxG.keys.LEFT)
	    {
		facing = LEFT;
		acceleration.x -= drag.x;
	    }
	    else if(FlxG.keys.RIGHT)
	    {
		facing = RIGHT;
		acceleration.x += drag.x;
	    }
/*	    if(FlxG.keys.justPressed("X") && !velocity.y)
	    {
		velocity.y = -_jumpPower;
		FlxG.play(SndJump);
	    }
*/
            super.update();
	}
		
	override public function hitBottom(Contact:FlxObject,Velocity:Number):void
	{
	    return super.hitBottom(Contact,Velocity);
	}
		
    
    }
}