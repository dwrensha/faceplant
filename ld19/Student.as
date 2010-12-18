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

	    addAnimation("stand", [0]);
	    addAnimation("walk", [1,2], 5);
            
//            play("stand");
	}
		
	override public function update():void
	{
    
            if(velocity.x == 0){
                play("stand");
            }
            else {
                play("walk");
            }

            if(FlxG.keys.justPressed("RIGHT")){
                velocity.x = velocity.x + 3;
                facing = RIGHT;
            }

            if(FlxG.keys.justPressed("LEFT")){
                velocity.x = velocity.x - 3;
                facing = LEFT;
            }


            super.update();
	}
		
	override public function hitBottom(Contact:FlxObject,Velocity:Number):void
	{
	    return super.hitBottom(Contact,Velocity);
	}
		
    
    }
}