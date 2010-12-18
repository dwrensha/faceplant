package 
{
    import org.flixel.*;
    
    public class Student extends FlxSprite
    {
	[Embed(source="assets/student.png")] private var ImgStudent:Class;
	[Embed(source="assets/jump.mp3")] private var SndJump:Class;
	[Embed(source="assets/land.mp3")] private var SndLand:Class;
	

        private var _onFloor: Boolean;
        private var _jumpPower: int;


	
	public function Student(X:int,Y:int)
	{
	    super(X,Y);
	    loadGraphic(ImgStudent,true,true,8,16);
            
            width = 8;
            height = 16;


            

	    //basic player physics
	    var runSpeed:uint = 80;
	    drag.x = runSpeed * 3;
	    acceleration.y = 200;
	    _jumpPower = 200;
	    maxVelocity.x = runSpeed;
	    maxVelocity.y = _jumpPower;


            _onFloor = true;

	    addAnimation("stand", [0]);
	    addAnimation("walk", [1,2], 5);
	    addAnimation("jump", [3,4,5,4], 4);
            

	}
		
	override public function update():void
	{
    
            if(_onFloor){
                if(velocity.x == 0){
                    play("stand");
                }
                else {
                    play("walk");
                
                }
            }else {
                play("jump");
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
	    if(FlxG.keys.justPressed("SPACE") && _onFloor)
	    {
		velocity.y = -_jumpPower;
		FlxG.play(SndJump);

	    }

            if (velocity.y != 0) {
                _onFloor = false;
            }

            super.update();
	}
		
	override public function hitBottom(Contact:FlxObject,Velocity:Number):void
	{
            if(velocity.y > 50)
	    FlxG.play(SndLand);
	    _onFloor = true;
	    return super.hitBottom(Contact,Velocity);
	}
		
    
    }
}