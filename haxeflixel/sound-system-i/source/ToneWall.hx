package;

import box2D.collision.shapes.B2CircleShape;
import box2D.collision.shapes.B2MassData;
import box2D.collision.shapes.B2PolygonShape;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2FixtureDef;
import box2D.dynamics.B2World;
import flixel.FlxSprite;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;

class ToneWall extends PhysicsSprite
{
	public var sound:FlxSound;

	public function new(X:Float, Y:Float, W:Float, H:Float, Sound:String):Void
	{
		super(Std.int(X), Std.int(Y), "", false, false, 1, 0, 1, Std.int(W), Std.int(H));

		this.sound = new FlxSound();
		this.sound.loadEmbedded(Sound, false);

		this.antialiasing = true;
		this.kind = WALL;
	}

	override public function update(elapsed:Float):Void
	{
		x = Physics.worldToScreen(body.getWorldCenter().x) - width / 2;
		y = Physics.worldToScreen(body.getWorldCenter().y) - height / 2;

		super.update(elapsed);
	}

	override private function handleImpact(Impact:Int, OtherSprite:PhysicsSprite):Void
	{
		super.handleImpact(Impact, OtherSprite);

		cast(OtherSprite, Circle).pulse();

		sound.play(true);
		sound.fadeIn(0.1, 0, 0.7);
		new FlxTimer().start(0.2, fadeInCompleted);
	}

	private function fadeInCompleted(t:FlxTimer):Void
	{
		sound.fadeOut(0.1);
	}
}
