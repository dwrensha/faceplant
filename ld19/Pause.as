package 
{
	import org.flixel.*;



	/**
	 * This is the default flixel pause screen.
	 * It can be overridden with your own <code>FlxLayer</code> object.
	 */
	public class Pause extends FlxGroup
	{
            [Embed(source="./assets/COOLVETI.TTF", fontName = "coolvetica")] private var FontClass:Class;
            [Embed(source="./assets/Nitz.ttf", fontName = "nitz")] private var FontClassNitz:Class;

		/**
		 * Constructor.
		 */
		public function Pause()
		{
			super();
			scrollFactor.x = 0;
			scrollFactor.y = 0;


                        var t : FlxText;
			t =  new FlxText(0,0,80,"PAUSED");
                        t.font = "nitz";
                        t.size = 12;

			t.alignment = "center";
                        add(t,true);
			

		}
	}
}