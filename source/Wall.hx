package;

class Wall extends PhysicsSprite
{
	public function new(X:Float,Y:Float,W:Float,H:Float):Void
	{
		super(Std.int(X),Std.int(Y),"",false,false,1,0,1,Std.int(W),Std.int(H));
		this.kind = WALL;
	}


	override public function update():Void
	{
		super.update();
	}
}