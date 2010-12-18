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
            
	    addAnimation("stand", [0]);
	    addAnimation("walkright", [1,2], 12);
	    addAnimation("walkleft", [3,4], 12);
            
            play("stand");
	}
		
	override public function update():void
	{
    

            if(FlxG.keys.justPressed("RIGHT")){
                x = x + 1;
                play("walkright");
            }

            if(FlxG.keys.justPressed("LEFT")){
                x = x - 1;
                play("walkleft");
            }
                
	}
		
	override public function hitBottom(Contact:FlxObject,Velocity:Number):void
	{
	    return super.hitBottom(Contact,Velocity);
	}
		
    
    }
}