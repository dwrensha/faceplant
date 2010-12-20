package 
{
    import org.flixel.*;
    
    public class Wires extends FlxSprite
    {
	[Embed(source="assets/wires.png")] private var ImgWires:Class;
	[Embed(source="assets/sparks.png")] private var ImgSparks:Class;

	
        private var _fe : FlxEmitter;

	public function Wires(X:int,Y:int)
	{
	    super(X,Y);
	    loadGraphic(ImgWires,true,true,8,8);
            
            width = 8;
            height = 8;

            fixed = true;

            
	    _fe = new FlxEmitter(X+4,Y+4)
            _fe.setSize(3,2);
            _fe.setYSpeed(-5,5);
            _fe.setXSpeed(-5,5);
//	    _fe.setRotation(-1,1);
	    _fe.gravity = 20;
	    _fe.createSprites(ImgSparks,400,32);
            _fe.delay = 2;
            _fe.start( false);
	    FlxG.state.add(_fe);


	}
		
	override public function update():void
	{


            super.update();    


        }


		
    }
}