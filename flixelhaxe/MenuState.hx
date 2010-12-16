import org.flixel.*;
	
class MenuState extends FlxState
{
  var n:int;
  
  override public function create():void
  {
    n=0;
    var t:FlxText;
    t = new FlxText(0,30,FlxG.width / 2,"Something is different today.");
    t.size = 16;
    t.alignment = "center";
    add(t);
    t = new FlxText(20,200,50,"click to continue");
    t.alignment = "center";
    add(t);
    
    FlxG.mouse.show();
  }
		
  override public function update():void
  {
    super.update();
    
    if(FlxG.mouse.justPressed() && n == 1)
      {
        FlxG.mouse.hide();
        //FlxG.state = new PlayState();
	
      }
    
    if(FlxG.mouse.justPressed() && n == 0)
      {
        n = n + 1;
        var t:FlxText;
        t = new FlxText(0,70,FlxG.width / 2,"You should go investigate.");
        t.size = 16;
        t.alignment = "center";
        add(t);

				
      }
    

  }
}

