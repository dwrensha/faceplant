package 
{
    import org.flixel.*;
    
    public class Student extends FlxSprite
    {
	[Embed(source="assets/student.png")] private var ImgStudent:Class;
	[Embed(source="assets/jump.mp3")] private var SndJump:Class;
	[Embed(source="assets/land.mp3")] private var SndLand:Class;
	[Embed(source="assets/headhit.mp3")] private var SndHead:Class;
	[Embed(source="assets/unlock.mp3")] private var SndUnlock:Class;
	[Embed(source="assets/coin.mp3")] private var SndKey:Class;
	

        private var _onFloor: Boolean;
        private var _jumpPower: int;
        private var _hasKey : Boolean;


        private var _cheatCount : int;
        
	
	public function Student(X:int,Y:int)
	{
	    super(X,Y);
	    loadGraphic(ImgStudent,true,true,8,16);
            
            width = 8;
            height = 16;

            _hasKey = false;

	    //basic player physics
	    var runSpeed:uint = 80;
	    drag.x = runSpeed * 3;
	    acceleration.y = 300;
	    _jumpPower = 200;
	    maxVelocity.x = runSpeed;
	    maxVelocity.y = _jumpPower;


            _onFloor = true;

	    addAnimation("stand", [0]);
	    addAnimation("walk", [1,2], 5);
	    addAnimation("jump", [3,4,5,4], 4);
        

            _cheatCount = 0;

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


            // for cheaters
            if(    (_cheatCount == 0 && FlxG.keys.justPressed("C"))
                || (_cheatCount == 1 && FlxG.keys.justPressed("H"))
                || (_cheatCount == 2 && FlxG.keys.justPressed("E"))
                || (_cheatCount == 3 && FlxG.keys.justPressed("A"))
                || (_cheatCount == 4 && FlxG.keys.justPressed("T")) ){
                _cheatCount = _cheatCount + 1;

                if (_cheatCount == 5){
                    pickupKey()

                }
            }            


            super.update();
	}
		
	override public function hitBottom(Contact:FlxObject,Velocity:Number):void
	{
            pickupIfKey(Contact);
            if(velocity.y > 50)
	    FlxG.play(SndLand);
	    _onFloor = true;
	    return super.hitBottom(Contact,Velocity);
	}
	
	override public function hitSide(Contact:FlxObject,Velocity:Number):void {         
            pickupIfKey(Contact);
            if((Contact is Lock) && _hasKey){
                FlxG.play(SndUnlock);
                _hasKey = false;
                Contact.exists = false;
            }
            return super.hitSide(Contact,Velocity);
        }

	override public function hitTop(Contact:FlxObject,Velocity:Number):void 
        {     

	    FlxG.play(SndHead);
            pickupIfKey(Contact); 
            return super.hitTop(Contact,Velocity);
        }

	
        public function pickupIfKey(Contact:FlxObject):void
        {
            if(Contact is Key){
                pickupKey()
            }
        }

        public function pickupKey():void
        {

            FlxG.play(SndKey);
            _hasKey = true;
        }

    
    }
}