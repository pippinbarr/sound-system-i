package;

import flixel.FlxSprite;
import flixel.group.FlxGroup;

import box2D.dynamics.B2World;
import box2D.dynamics.B2DebugDraw;
import box2D.dynamics.B2Body;
import box2D.collision.shapes.B2PolygonShape;
import box2D.collision.shapes.B2CircleShape;
import box2D.collision.shapes.B2MassData;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2FixtureDef;
import box2D.dynamics.B2ContactImpulse;


import flash.events.EventDispatcher;

enum Kind {
	CIRCLE;
	WALL;
}

class PhysicsSprite extends FlxSprite
{
	public var body:B2Body;
	public var isDynamic:Bool;
	public var dispatcher:flash.events.EventDispatcher;
	public var kind:Kind;

	public function new (
		X:Float = 0,
		Y:Float = 0,
		Sprite:String,
		IsCircle:Bool,
		IsDynamic:Bool = false,
		Mass:Float = 1,
		Friction:Float = 0,
		Restitution:Float = 1,
		Width:Int = 0,
		Height:Int = 0)
	{
		super(Std.int(X),Std.int(Y));

		isDynamic = IsDynamic;
		dispatcher = new EventDispatcher();

		if (Sprite != "")
		{
			this.loadGraphic(Sprite,false,0,0,false);
		}
		else
		{
			this.makeGraphic(Width,Height,0xFFFF0000);
		}

		this.origin.x = this.origin.y = 0;	
		
		var bodyDefinition = new B2BodyDef();
		var hitX:Float = X + width/2;
		var hitY:Float = Y + height/2;

		bodyDefinition.position.set(Physics.screenToWorld(hitX), Physics.screenToWorld(hitY));
		
		if (isDynamic) bodyDefinition.type = B2Body.b2_dynamicBody;
		else bodyDefinition.type = B2Body.b2_staticBody;

		var fixtureDefinition = new B2FixtureDef();

		if (IsCircle)
		{
			var hitShape:B2CircleShape = new B2CircleShape();
			hitShape.setRadius(Physics.screenToWorld(height / 2));
			fixtureDefinition.shape = hitShape;
		}
		else
		{
			var hitShape:B2PolygonShape = new B2PolygonShape();
			hitShape.setAsBox(Physics.screenToWorld(width / 2),Physics.screenToWorld(height / 2));
			fixtureDefinition.shape = hitShape;
		}


		fixtureDefinition.restitution = 1;
		fixtureDefinition.friction = 0;
		fixtureDefinition.density = 0;

		body = Physics.WORLD.createBody(bodyDefinition);
		body.createFixture(fixtureDefinition);
		body.setUserData(this);

		updatePosition();
	}


	override public function destroy():Void
	{
		super.destroy();
	}


	override public function update():Void
	{
		if (isDynamic) updatePosition();

		super.update();
	}


	public function updatePosition():Void
	{
		if (body == null) return;

		this.x = Math.round(Physics.worldToScreen(body.getPosition().x) - this.width/2);
		this.y = Math.round(Physics.worldToScreen(body.getPosition().y) - this.height/2);
	}



	public function moveTo(X:Float,Y:Float):Void
	{
		body.setPosition(new B2Vec2(Physics.screenToWorld(X + this.width/2),Physics.screenToWorld(Y + height/2)));
		body.setLinearVelocity(new B2Vec2(0,0));
		updatePosition();
	}


	public function beginContact(Sensor:Int,OtherSensor:Int,Other:PhysicsSprite):Void
	{

	}


	public function endContact(Sensor:Int,OtherSensor:Int,Other:PhysicsSprite):Void
	{

	}


	public function postSolve(OtherSprite:PhysicsSprite, impulse:B2ContactImpulse):Void
	{
		// trace(impulse.normalImpulses[0]);

		var impact:Int = Physics.NONE;
		dispatcher.dispatchEvent(new BounceEvent("ANY",1,OtherSprite));			
		handleImpact(impact,OtherSprite);
	}


	private function handleImpact(Impact:Int,OtherSprite:PhysicsSprite):Void
	{

	}
	

	override public function kill():Void
	{
		body.setActive(false);
		super.kill();
	}
}