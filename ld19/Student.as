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
            
	    addAnimation("walk", [0,1], 12);
            
            play("walk");
	}
		
	override public function update():void
	{
                    
	}
		
	override public function hitBottom(Contact:FlxObject,Velocity:Number):void
	{
	    return super.hitBottom(Contact,Velocity);
	}
		
    
    }
}