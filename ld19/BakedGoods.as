package 
{
    import org.flixel.*;
    
    public class BakedGoods extends Item
    {
	[Embed(source="assets/bakedgoods.png")] private var ImgFood:Class;


        protected var _kind : int;
	
	public function BakedGoods(X:int,Y:int)
	{
	    super(X,Y, 5);
	    loadGraphic(ImgFood,true,true,8,8);
            
            width = 8;
            height = 8;

	    addAnimation("donut", [0]);
	    addAnimation("cake", [1]);
	    addAnimation("cupcake", [2]);
	    addAnimation("cookie", [3]);
	    addAnimation("brownie", [4]);
	    addAnimation("bagel", [5]);

            _kind = Math.floor(FlxU.random() *  6);
            if(_kind == 0){
                play("donut")
            } else if(_kind == 1){
                play("cake")
            } else if(_kind == 2){
                play("cupcake")
            } else if(_kind == 3){
                play("cookie")
            } else if(_kind == 4){
                play("brownie")
            } else if(_kind == 5){
                play("bagel")
            } 

	}
		
	override public function update():void
	{
            
            super.update();
	}
		
/*
        public function enter():void
        {
            FlxG.play(SndDoor);
        }
*/
    
    }
}