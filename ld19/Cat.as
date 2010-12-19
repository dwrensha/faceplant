package 
{
    import org.flixel.*;
    
    public class Cat extends FlxSprite
    {
	[Embed(source="assets/cat.png")] private var ImgCat:Class;
//	[Embed(source="assets/coin.mp3")] private var SndKey:Class;
	

        private var _onFloor: Boolean;
        private var _jumpPower: int;
        
        public var decisionCounter:Number;
        public var decisionGoal:Number;
        public var decision:Number;

	
	public function Cat(X:int,Y:int)
	{
	    super(X,Y);
	    loadGraphic(ImgCat,true,true,16,8);
            
            width = 16;
            height = 8;


	    //basic player physics
	    var runSpeed:uint = 80;
	    drag.x = 0;
	    acceleration.y = 300;
	    _jumpPower = 200;
	    maxVelocity.x = runSpeed;
	    maxVelocity.y = _jumpPower;


            _onFloor = true;

	    addAnimation("stand", [0,1],2);
	    addAnimation("walk", [2,3], 5);
//	    addAnimation("jump", [3,4,5,4], 4);
        

            decisionCounter = 0;
            decisionGoal = 5;


	}
		
	override public function update():void
	{


            if(_onFloor){
                decisionCounter += FlxG.elapsed * 3;
                if (decisionCounter >= decisionGoal)
                {
                    makeDecision();
                    decisionCounter = 0;
                }
                if (velocity.x > 0)
                {
                    facing = RIGHT;
                    play("walk");
                }
                else if (velocity.x < 0)
                {
                    facing = LEFT
                    play("walk");
                }
                else
                {
                    play("stand");
                }
            }
            super.update();    


        }

        public function makeDecision():void
        {
            decision = Math.random();
            if (decision<= .2)
            {
                velocity.x = 0;
            }
            else if (decision <= .6 && decision > .2)
            {
                velocity.x = -30;
            }
            else if (decision > .6)
            {
                velocity.x = 30;
            }
        }



		
    }
}