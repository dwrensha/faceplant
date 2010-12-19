package 
{
    import org.flixel.*;
    
    public class Publication extends Item
    {
	[Embed(source="assets/publication.png")] private var ImgPaper:Class;


	
	public function Publication(X:int,Y:int)
	{
	    super(X,Y, 700);
	    loadGraphic(ImgPaper,true,true,8,8);
            
            width = 8;
            height = 8;

	}
		
	override public function update():void
	{
            
            super.update();
	}
		
    }
}