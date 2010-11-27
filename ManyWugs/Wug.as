package
{
	import org.flixel.*;
	public class Wug extends FlxSprite
    {
        [Embed(source = "data/wug.png")] private var PlayerImage:Class;

        public var decisionCounter:Number;
        public var decisionGoal:Number;
        public var decision:Number;

        public function Wug(X:Number = 0, Y:Number = 0):void
        {
            super(X, Y, null);
		loadGraphic(PlayerImage, true, true, 12, 16, false);
            acceleration.y = 100;
            offset.y = 4;
            offset.x = 2;
            height = 9;
            width = 8;
            addAnimation("walking", [1, 2, 3], 10);
            addAnimation("still", [0]);
            decisionCounter = 0;
            decisionGoal = 5;
            facing = LEFT;
        }
        public override function update():void
        {
            super.update();
            decisionCounter += FlxG.elapsed * 3;
            if (decisionCounter >= decisionGoal)
            {
                makeDecision();
                decisionCounter = 0;
            }
            if (velocity.x > 0)
            {
                facing = RIGHT;
                play("walking");
            }
            else if (velocity.x < 0)
            {
                facing = LEFT;
                play("walking");
            }
            else
            {
                play("still");
            }
        }
        public function makeDecision():void
        {
            decision = Math.random();
            if (decision<= .2)
            {
                velocity.x = 0;
            }
            else if (decision <= .6 && decision> .2)
            {
                velocity.x = -30;
            }
            else if (decision<= .6)
            {
                velocity.x = 30;
            }
        }
        public override function hitLeft(Contact:FlxObject, Velocity:Number):void { velocity.x *= -1;}
	public override function hitRight(Contact:FlxObject, Velocity:Number):void { velocity.x *= -1;}
    }
}