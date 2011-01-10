package 
{ 
    import org.flixel.FlxPreloader; 
    public class Preloader extends FlxPreloader 
    { 
/*
	[Embed(source="assets/dwarf.png")] private var ImgDwarf:Class;

        private var _s:FlxSprite;
*/
        public function Preloader():void {
	
	    className = "Game";
	    super();
        }
/*
        override public function create() : void {
            _s = new FlxSprite(100,0);
	    _s.loadGraphic(ImgDwarf);
            add(_s);
            
        }
*/
   }

}
