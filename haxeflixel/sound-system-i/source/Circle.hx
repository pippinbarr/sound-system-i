package;

import box2D.collision.shapes.B2CircleShape;
import box2D.collision.shapes.B2MassData;
import box2D.collision.shapes.B2PolygonShape;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2FixtureDef;
import box2D.dynamics.B2World;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;

enum PulseState
{
	NONE;
	PULSE_IN;
	PULSE_OUT;
}

class Circle extends PhysicsSprite
{
	private var sound:FlxSound;

	private var impact:Bool;
	private var location:Bool;
	private var constant:Bool;
	private var playing:Int = -1;

	public var startX:Float;
	public var startY:Float;
	public var originX:Float;
	public var originY:Float;

	private var lastX:Float = -1;
	private var lastY:Float = -1;

	public var tones:Array<FlxSound>;

	private var pulseState:PulseState = NONE;

	public function new(OriginX:Float, OriginY:Float, X:Float, Y:Float, C:Int, Sprite:String, Sounds:Array<String> = null, Impact:Bool = true,
			Location:Bool = false, Constant:Bool = false):Void
	{
		super(Std.int(X), Std.int(Y), Sprite, true, true);

		this.origin.x = this.width / 2;
		this.origin.y = this.height / 2;

		startX = X - this.width / 2;
		startY = Y - this.height / 2;

		originX = OriginX;
		originY = OriginY;

		this.impact = Impact;
		this.location = Location;
		this.constant = Constant;

		tones = new Array();
		if (Sounds != null && !impact)
		{
			for (soundPath in Sounds)
			{
				tones.push(new FlxSound().loadEmbedded(soundPath, false));
			}
		}
		else if (Sounds != null)
		{
			this.sound = new FlxSound().loadEmbedded(Sounds[0], false);
		}

		this.antialiasing = true;
		this.kind = CIRCLE;

		lastX = X;
		lastY = Y;

		this.moveTo(startX, startY);
	}

	override public function update(elapsed:Float):Void
	{
		color = 0xFFFFFFFF;

		lastX = x;
		lastY = y;

		x = Physics.worldToScreen(body.getWorldCenter().x);
		y = Physics.worldToScreen(body.getWorldCenter().y);

		super.update(elapsed);

		if (location && constant)
		{
			playLocationBasedSound();
		}
		else if (location && !constant && markerPassed())
		{
			playTimeBasedSound();
		}

		switch (pulseState)
		{
			case NONE:

			case PULSE_IN:
				if (scale.x > 0.95)
				{
					scale.x -= 0.05;
					scale.y -= 0.05;
				}
				else
				{
					scale.x = 0.95;
					scale.y = 0.95;
					pulseState = PULSE_OUT;
				}

			case PULSE_OUT:
				if (scale.x < 1)
				{
					scale.x += 0.025;
					scale.y += 0.025;
				}
				else
				{
					scale.x = 1;
					scale.y = 1;
					pulseState = NONE;
				}
		}
	}

	private function markerPassed():Bool
	{
		var markerCenter:Float = (ProtoState.marker == 0) ? (FlxG.width - ProtoState.MARKER_SPEED / 2) : ProtoState.marker - ProtoState.MARKER_SPEED / 2;
		var circleCenter:Float = (x + width / 2) - (x - lastX) / 2;

		return (Math.abs(markerCenter - circleCenter) < Math.max(ProtoState.MARKER_SPEED, Math.abs(x - lastX)));
	}

	private function playLocationBasedSound():Void
	{
		if (playing != -1)
			return;

		var tone:Int = Std.int(((this.x - originX) / FlxG.width) * 9);

		// trace("Trying to play tone " + tone + " which is " + tones[tone]);
		if (tones[tone] != null)
		{
			// tones[tone].play();
			tones[tone].play(true);
		}
		pulse();

		new FlxTimer().start(0.2 + ((this.y - originY + this.height / 2) / FlxG.height) * 4, soundFinished);
		playing = tone;
	}

	private function soundFinished(t:FlxTimer):Void
	{
		tones[playing].stop();
		playing = -1;
	}

	private function playTimeBasedSound():Void
	{
		if (playing != -1 && tones[playing].playing)
			return;

		var index:Int = Math.floor(((this.x - originX) / FlxG.width) * tones.length);

		trace(index);

		tones[index].play(true);
		pulse();

		playing = index;
	}

	override public function handleImpact(Impact:Int, OtherSprite:PhysicsSprite):Void
	{
		if (this.sound != null && this.impact)
		{
			// this.sound.play();
			this.sound.play(true);
			pulse();
		}
	}

	public function pulse():Void
	{
		if (ProtoState.currentFocus != null && ProtoState.currentFocus.x == originX + FlxG.width / 2)
		{
			pulseState = PULSE_IN;
		}
		else
		{
			color = 0xFF999999;
		}
	}
}
