package 
{
    import org.flixel.*;
    
    public class Pipe extends FlxSprite
    {
	[Embed(source="assets/pipe.png")] private var ImgPipe:Class;
	[Embed(source="assets/drop.png")] private var ImgDrop:Class;
        //	[Embed(source="assets/coin.mp3")] private var SndKey:Class;
	
        private var _fe : FlxEmitter;

	public function Pipe(X:int,Y:int)
	{
	    super(X,Y);
	    loadGraphic(ImgPipe,true,true,8,4);
            
            width = 8;
            height = 4;

            fixed = true;

            
	    _fe = new FlxEmitter(X,Y+2)
            _fe.setSize(2,2);
            _fe.setYSpeed(0,0);
            _fe.setXSpeed(-1,1);
//	    _fe.setRotation(-1,1);
	    _fe.gravity = 200;
	    _fe.createSprites(ImgDrop,400,32);
            _fe.delay = 3;
            _fe.start( false);
	    FlxG.state.add(_fe);


	}
		
	override public function update():void
	{


            super.update();    


        }


		
    }
}