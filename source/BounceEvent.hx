import flash.events.Event;

class BounceEvent extends Event
{
	public var strength:Float;
	public var other:PhysicsSprite;

	public function new(label:String, strength:Float, other:PhysicsSprite, bubbles:Bool = false, cancelable:Bool = false ) 
	{
		super(label,bubbles,cancelable);
		this.strength = strength;
		this.other = other;
	}
}