package;

import box2D.collision.B2AABB;
import box2D.collision.shapes.B2Shape;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.B2FixtureDef;
import box2D.dynamics.B2World;
import box2D.dynamics.joints.B2MouseJoint;
import box2D.dynamics.joints.B2MouseJointDef;
import flash.geom.Point;
import flash.geom.Rectangle;
import flixel.FlxBasic;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

// import flixel.math.FlxPoint;

enum Screen
{
	FADING;
	MENU;
	ONE;
	TWO;
	THREE;
	FOUR;
	NONE;
}

class ProtoState extends FlxState
{
	public static var RESOLUTION:String = "";
	public static var MARKER_SPEED:Int = 10;
	public static var FADE_TIME:Float = 0.5;

	private var menuCamera1:FlxCamera;
	private var menuCamera2:FlxCamera;
	private var menuCamera3:FlxCamera;
	private var menuCamera4:FlxCamera;

	private var menuFocusPoint:FlxPoint;
	private var camera1FocusPoint:FlxPoint;
	private var camera2FocusPoint:FlxPoint;
	private var camera3FocusPoint:FlxPoint;
	private var camera4FocusPoint:FlxPoint;

	public static var marker:Int;
	public static var markerOrigin:Int;

	private var markerSprite:FlxSprite;

	private var oneCircle1:Circle;
	private var twoCircle1:Circle;
	private var twoCircle2:Circle;
	private var threeCircle1:Circle;
	private var threeCircle2:Circle;
	private var threeCircle3:Circle;
	private var fourCircle1:Circle;
	private var fourCircle2:Circle;
	private var fourCircle3:Circle;
	private var fourCircle4:Circle;

	private var oneUIRect:Rectangle;
	private var twoUIRect:Rectangle;
	private var threeUIRect:Rectangle;
	private var fourUIRect:Rectangle;

	private var mouseJoint:B2MouseJoint;

	private var screen:Screen = MENU;
	private var fadeScreen:Screen = NONE;

	public static var currentFocus:FlxPoint = null;

	private var playButtons:FlxGroup;
	private var menuButtons:FlxGroup;

	override public function create():Void
	{
		trace("Here");
		super.create();

		FlxG.camera.bgColor = 0xFF444444;
		FlxG.mouse.useSystemCursor = true;
		// FlxG.stage.mouseChildren = false;

		menuFocusPoint = new FlxPoint(FlxG.width * 4 + FlxG.width / 2, FlxG.height / 2);

		camera1FocusPoint = new FlxPoint(0 + FlxG.width / 2, FlxG.height / 2);
		camera2FocusPoint = new FlxPoint(FlxG.width * 2 + FlxG.width / 2, 0 + FlxG.height / 2);
		camera3FocusPoint = new FlxPoint(0 + FlxG.width / 2, FlxG.height * 2 + FlxG.height / 2);
		camera4FocusPoint = new FlxPoint(FlxG.width * 2 + FlxG.width / 2, FlxG.height * 2 + FlxG.height / 2);

		FlxG.camera.setScrollBoundsRect(0, 0, FlxG.width * 5, FlxG.height * 3);
		FlxG.camera.focusOn(camera2FocusPoint);

		Physics.WORLD = new B2World(new B2Vec2(0, 0), true);
		var contactListener:ContactListener = new ContactListener();
		Physics.WORLD.setContactListener(contactListener);

		playButtons = new FlxGroup();
		menuButtons = new FlxGroup();

		createOne();
		createTwo();
		createThree();
		createFour();

		FlxG.camera.focusOn(menuFocusPoint);

		menuCamera1 = new FlxCamera(0, 0, Std.int(FlxG.width), Std.int(FlxG.height), 0.5);
		menuCamera1.focusOn(camera1FocusPoint);

		menuCamera2 = new FlxCamera(Std.int(FlxG.width / 2), 0, Std.int(FlxG.width), Std.int(FlxG.height), 0.5);
		menuCamera2.focusOn(camera2FocusPoint);

		menuCamera3 = new FlxCamera(0, Std.int(FlxG.height / 2), Std.int(FlxG.width), Std.int(FlxG.height), 0.5);
		menuCamera3.focusOn(camera3FocusPoint);

		menuCamera4 = new FlxCamera(Std.int(FlxG.width / 2), Std.int(FlxG.height / 2), Std.int(FlxG.width), Std.int(FlxG.height), 0.5);
		menuCamera4.focusOn(camera4FocusPoint);

		FlxG.cameras.add(menuCamera2);
		FlxG.cameras.add(menuCamera3);
		FlxG.cameras.add(menuCamera4);
		FlxG.cameras.add(menuCamera1);

		add(menuButtons);

		add(playButtons);
		playButtons.visible = false;
		playButtons.active = false;

		oneUIRect.x = menuFocusPoint.x - FlxG.width / 2;
		oneUIRect.y = menuFocusPoint.y - FlxG.height / 2;
		twoUIRect.x = menuFocusPoint.x;
		twoUIRect.y = menuFocusPoint.y - FlxG.height / 2;
		threeUIRect.x = menuFocusPoint.x - FlxG.width / 2;
		threeUIRect.y = menuFocusPoint.y;
		fourUIRect.x = menuFocusPoint.x;
		fourUIRect.y = menuFocusPoint.y;
	}

	private function createOne():Void
	{
		var ORIGIN_X:Float = camera1FocusPoint.x - FlxG.width / 2;
		var ORIGIN_Y:Float = camera1FocusPoint.y - FlxG.height / 2;

		var bg:FlxSprite = new FlxSprite(ORIGIN_X, ORIGIN_Y, AssetPaths.bg1__jpg);
		// var bg:FlxSprite = new FlxSprite(ORIGIN_X, ORIGIN_Y, "assets/images/bgs/bg1-" + RESOLUTION + ".jpg");

		oneCircle1 = new Circle(ORIGIN_X, ORIGIN_Y, ORIGIN_X + FlxG.width / 2, ORIGIN_Y + FlxG.height / 2, 0, AssetPaths.circle_cyan__png, "", false, false,
			false);

		var leftWall:ToneWall = new ToneWall(ORIGIN_X + -100, ORIGIN_Y + 0, 100, FlxG.height, AssetPaths.ArpAA1short__mp3);
		var rightWall:ToneWall = new ToneWall(ORIGIN_X + FlxG.width, ORIGIN_Y + 0, 100, FlxG.height, AssetPaths.ArpAB1short__mp3);
		var topWall:ToneWall = new ToneWall(ORIGIN_X + -100, ORIGIN_Y + -100, FlxG.width + 200, 100, AssetPaths.ArpAD1short__mp3);
		var bottomWall:ToneWall = new ToneWall(ORIGIN_X + -100, ORIGIN_Y + FlxG.height, FlxG.width + 200, 100, AssetPaths.ArpAE1short__mp3);

		var title:FlxText = new FlxText(ORIGIN_X, ORIGIN_Y + 128, FlxG.width, "I.");
		title.setFormat(null, 64, 0xFF000000, "center");
		// title.updateFrameData();

		add(bg);
		add(title);
		add(oneCircle1);

		oneUIRect = createButtons(ORIGIN_X, ORIGIN_Y, resetOne, stopPlayOne);
	}

	private function resetOne():Void
	{
		oneCircle1.body.setLinearVelocity(new B2Vec2(0, 0));
		oneCircle1.moveTo(oneCircle1.startX, oneCircle1.startY);
	}

	private function stopPlayOne():Void
	{
		oneCircle1.body.setActive(!oneCircle1.body.isActive());
		oneCircle1.active = !oneCircle1.active;
	}

	private function createTwo():Void
	{
		var ORIGIN_X:Float = camera2FocusPoint.x - FlxG.width / 2;
		var ORIGIN_Y:Float = camera2FocusPoint.y - FlxG.height / 2;

		var bg:FlxSprite = new FlxSprite(ORIGIN_X, ORIGIN_Y, AssetPaths.bg2__jpg);

		twoCircle1 = new Circle(ORIGIN_X, ORIGIN_Y, ORIGIN_X + 1 * FlxG.width / 3, ORIGIN_Y + FlxG.height / 2, 0, AssetPaths.circle_cyan__png,
			"assets/sounds/ArpB", false, true, true);
		twoCircle2 = new Circle(ORIGIN_X, ORIGIN_Y, ORIGIN_X + 2 * FlxG.width / 3, ORIGIN_Y + FlxG.height / 2, 0, AssetPaths.circle_magenta__png,
			"assets/sounds/ArpB", false, true, true);

		createWalls(ORIGIN_X, ORIGIN_Y);

		var title:FlxText = new FlxText(ORIGIN_X, ORIGIN_Y + 128, FlxG.width, "II.");
		title.setFormat(null, 64, 0xFF000000, "center");
		// title.updateFrameData();

		add(bg);
		add(title);
		add(twoCircle1);
		add(twoCircle2);

		twoUIRect = createButtons(ORIGIN_X, ORIGIN_Y, resetTwo, stopPlayTwo);
	}

	private function resetTwo():Void
	{
		twoCircle1.body.setLinearVelocity(new B2Vec2(0, 0));
		twoCircle1.moveTo(twoCircle1.startX, twoCircle1.startY);
		twoCircle2.body.setLinearVelocity(new B2Vec2(0, 0));
		twoCircle2.moveTo(twoCircle2.startX, twoCircle2.startY);
	}

	private function stopPlayTwo():Void
	{
		twoCircle1.body.setActive(!twoCircle1.body.isActive());
		twoCircle2.body.setActive(!twoCircle2.body.isActive());

		twoCircle1.active = !twoCircle1.active;
		twoCircle2.active = !twoCircle2.active;
	}

	private function createThree():Void
	{
		var ORIGIN_X:Float = camera3FocusPoint.x - FlxG.width / 2;
		var ORIGIN_Y:Float = camera3FocusPoint.y - FlxG.height / 2;

		var bg:FlxSprite = new FlxSprite(ORIGIN_X, ORIGIN_Y, AssetPaths.bg3__jpg);

		threeCircle1 = new Circle(ORIGIN_X, ORIGIN_Y, ORIGIN_X + FlxG.width / 4, ORIGIN_Y + FlxG.height / 2, 0, AssetPaths.circle_cyan__png,
			AssetPaths.kick1__mp3, true, false, false);
		threeCircle2 = new Circle(ORIGIN_X, ORIGIN_Y, ORIGIN_X + 2 * FlxG.width / 4, ORIGIN_Y + FlxG.height / 2, 0, AssetPaths.circle_magenta__png,
			AssetPaths.kick2__mp3, true, false, false);
		threeCircle3 = new Circle(ORIGIN_X, ORIGIN_Y, ORIGIN_X + 3 * FlxG.width / 4, ORIGIN_Y + FlxG.height / 2, 0, AssetPaths.circle_yellow__png,
			AssetPaths.snare1__mp3, true, false, false);

		createWalls(ORIGIN_X, ORIGIN_Y);

		var title:FlxText = new FlxText(ORIGIN_X, ORIGIN_Y + 128, FlxG.width, "III.");
		title.setFormat(null, 64, 0xFF000000, "center");
		// title.updateFrameData();

		add(bg);
		add(title);
		add(threeCircle1);
		add(threeCircle2);
		add(threeCircle3);

		threeUIRect = createButtons(ORIGIN_X, ORIGIN_Y, resetThree, stopPlayThree);
	}

	private function resetThree():Void
	{
		threeCircle1.body.setLinearVelocity(new B2Vec2(0, 0));
		threeCircle1.moveTo(threeCircle1.startX, threeCircle1.startY);
		threeCircle2.body.setLinearVelocity(new B2Vec2(0, 0));
		threeCircle2.moveTo(threeCircle2.startX, threeCircle2.startY);
		threeCircle3.body.setLinearVelocity(new B2Vec2(0, 0));
		threeCircle3.moveTo(threeCircle3.startX, threeCircle3.startY);
	}

	private function stopPlayThree():Void
	{
		threeCircle1.body.setActive(!threeCircle1.body.isActive());
		threeCircle2.body.setActive(!threeCircle2.body.isActive());
		threeCircle3.body.setActive(!threeCircle3.body.isActive());

		threeCircle1.active = !threeCircle1.active;
		threeCircle2.active = !threeCircle2.active;
		threeCircle3.active = !threeCircle3.active;
	}

	private function createFour():Void
	{
		var ORIGIN_X:Float = camera4FocusPoint.x - FlxG.width / 2;
		var ORIGIN_Y:Float = camera4FocusPoint.y - FlxG.height / 2;

		var bg:FlxSprite = new FlxSprite(ORIGIN_X, ORIGIN_Y, AssetPaths.bg4__jpg);

		fourCircle1 = new Circle(ORIGIN_X, ORIGIN_Y, ORIGIN_X + FlxG.width / 5, ORIGIN_Y + FlxG.height / 2, 0, AssetPaths.circle_cyan__png,
			"assets/sounds/boop", false, true, false);
		fourCircle2 = new Circle(ORIGIN_X, ORIGIN_Y, ORIGIN_X + 2 * FlxG.width / 5, ORIGIN_Y + FlxG.height / 2, 0, AssetPaths.circle_magenta__png,
			"assets/sounds/boop", false, true, false);
		fourCircle3 = new Circle(ORIGIN_X, ORIGIN_Y, ORIGIN_X + 3 * FlxG.width / 5, ORIGIN_Y + FlxG.height / 2, 0, AssetPaths.circle_yellow__png,
			"assets/sounds/boop", false, true, false);
		fourCircle4 = new Circle(ORIGIN_X, ORIGIN_Y, ORIGIN_X + 4 * FlxG.width / 5, ORIGIN_Y + FlxG.height / 2, 0, AssetPaths.circle_black__png,
			"assets/sounds/boop", false, true, false);

		createWalls(ORIGIN_X, ORIGIN_Y);

		var title:FlxText = new FlxText(ORIGIN_X, ORIGIN_Y + 128, FlxG.width, "IIII.");
		title.setFormat(null, 64, 0xFF000000, "center");
		// title.updateFrameData();

		add(bg);
		add(title);
		add(fourCircle1);
		add(fourCircle2);
		add(fourCircle3);
		add(fourCircle4);

		markerOrigin = Std.int(ORIGIN_X);
		marker = markerOrigin;

		markerSprite = new FlxSprite(ORIGIN_X, ORIGIN_Y);
		markerSprite.makeGraphic(1, FlxG.height, 0xFFFF0000);
		// add(markerSprite);

		fourUIRect = createButtons(ORIGIN_X, ORIGIN_Y, resetFour, stopPlayFour);
	}

	private function resetFour():Void
	{
		fourCircle1.body.setLinearVelocity(new B2Vec2(0, 0));
		fourCircle1.moveTo(fourCircle1.startX, fourCircle1.startY);
		fourCircle2.body.setLinearVelocity(new B2Vec2(0, 0));
		fourCircle2.moveTo(fourCircle2.startX, fourCircle2.startY);
		fourCircle3.body.setLinearVelocity(new B2Vec2(0, 0));
		fourCircle3.moveTo(fourCircle3.startX, fourCircle3.startY);
		fourCircle4.body.setLinearVelocity(new B2Vec2(0, 0));
		fourCircle4.moveTo(fourCircle4.startX, fourCircle4.startY);
	}

	private function stopPlayFour():Void
	{
		fourCircle1.body.setActive(!fourCircle1.body.isActive());
		fourCircle2.body.setActive(!fourCircle2.body.isActive());
		fourCircle3.body.setActive(!fourCircle3.body.isActive());
		fourCircle4.body.setActive(!fourCircle4.body.isActive());

		fourCircle1.active = !fourCircle1.active;
		fourCircle2.active = !fourCircle2.active;
		fourCircle3.active = !fourCircle3.active;
		fourCircle4.active = !fourCircle4.active;
	}

	private function createButtons(OriginX:Float, OriginY:Float, ResetMethod:Dynamic, StopPlayMethod:Dynamic):Rectangle
	{
		var backButton:FlxButton = new FlxButton(OriginX, OriginY, "", returnToMenu);
		backButton.loadGraphic(AssetPaths.back_button_small__png, true, 50, 50);
		var resetButton:FlxButton = new FlxButton(backButton.x + backButton.width + 10, backButton.y, "", ResetMethod);
		resetButton.loadGraphic(AssetPaths.reset_button_small__png, true, 50, 50);
		var stopPlayButton:FlxButton = new FlxButton(resetButton.x + resetButton.width + 10, resetButton.y, "", StopPlayMethod);
		stopPlayButton.loadGraphic(AssetPaths.pause_button_small__png, true, 50, 50);

		var menuResetButton:FlxButton = new FlxButton(OriginX, OriginY, "", ResetMethod);
		menuResetButton.loadGraphic(AssetPaths.reset_button__png, true, 100, 100);
		var menuStopPlayButton:FlxButton = new FlxButton(menuResetButton.x + menuResetButton.width + 10, menuResetButton.y, "", StopPlayMethod);
		menuStopPlayButton.loadGraphic(AssetPaths.pause_button__png, true, 100, 100);

		stopPlayButton.onUp.callback = stopPauseUp.bind(stopPlayButton, menuStopPlayButton, StopPlayMethod);
		menuStopPlayButton.onUp.callback = stopPauseUp.bind(stopPlayButton, menuStopPlayButton, StopPlayMethod);

		backButton.scrollFactor.x = 1;
		backButton.scrollFactor.y = 1;
		resetButton.scrollFactor.x = 1;
		resetButton.scrollFactor.y = 1;
		stopPlayButton.scrollFactor.x = 1;
		stopPlayButton.scrollFactor.y = 1;
		menuStopPlayButton.scrollFactor.x = 1;
		menuStopPlayButton.scrollFactor.y = 1;
		menuResetButton.scrollFactor.x = 1;
		menuResetButton.scrollFactor.y = 1;

		playButtons.add(backButton);
		playButtons.add(resetButton);
		playButtons.add(stopPlayButton);

		menuButtons.add(menuStopPlayButton);
		menuButtons.add(menuResetButton);

		// menuButtons.setAll("alpha", 0.5);

		menuButtons.forEach(function(o:FlxBasic)
		{
			cast(o, FlxSprite).alpha = 0.5;
		});
		playButtons.forEach(function(o:FlxBasic)
		{
			cast(o, FlxSprite).alpha = 0.5;
		});
		// playButtons.setAll("alpha", 0.5);

		// return new Rectangle(backButton.x - OriginX + menuFocusPoint.x - FlxG.width/2,backButton.y - OriginY + menuFocusPoint.y - FlxG.height/2,stopPlayButton.x + stopPlayButton.width - OriginX + menuFocusPoint.x - FlxG.width/2,stopPlayButton.y + stopPlayButton.height - OriginY + menuFocusPoint.y - FlxG.height/2);
		// return new Rectangle(menuResetButton.x,menuResetButton.y,menuStopPlayButton.x + menuStopPlayButton.width,menuStopPlayButton.y + menuStopPlayButton.height);
		return new Rectangle(menuResetButton.x, menuResetButton.y, (menuStopPlayButton.x + menuStopPlayButton.width) - OriginX,
			(menuStopPlayButton.y + (menuStopPlayButton.height)) - OriginY);
	}

	private function stopPauseUp(pb:FlxButton, mb:FlxButton, m:Dynamic):Void
	{
		Reflect.callMethod(this, m, null);
		pb.loadGraphic(AssetPaths.play_button_small__png, true, 50, 50);
		pb.onUp.callback = stopPlayUp.bind(pb, mb, m);
		mb.loadGraphic(AssetPaths.play_button__png, true, 100, 100);
		mb.onUp.callback = stopPlayUp.bind(pb, mb, m);
	}

	private function stopPlayUp(pb:FlxButton, mb:FlxButton, m:Dynamic):Void
	{
		Reflect.callMethod(this, m, null);
		pb.loadGraphic(AssetPaths.pause_button_small__png, true, 50, 50);
		pb.onUp.callback = stopPauseUp.bind(pb, mb, m);
		mb.loadGraphic(AssetPaths.pause_button__png, true, 100, 100);
		mb.onUp.callback = stopPauseUp.bind(pb, mb, m);
	}

	private function createWalls(OriginX:Float, OriginY:Float):Void
	{
		var leftWall:Wall = new Wall(OriginX + -100, OriginY + 0, 100, FlxG.height);
		var rightWall:Wall = new Wall(OriginX + FlxG.width, OriginY + 0, 100, FlxG.height);
		var topWall:Wall = new Wall(OriginX + -100, OriginY + -100, FlxG.width + 200, 100);
		var bottomWall:Wall = new Wall(OriginX + -100, OriginY + FlxG.height, FlxG.width + 200, 100);
	}

	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		marker = (marker + MARKER_SPEED < markerOrigin + FlxG.width) ? marker + MARKER_SPEED : markerOrigin;
		markerSprite.x = marker;

		handleMouse();

		Physics.WORLD.step(1 / 30, 10, 10);
	}

	private function handleMouse():Void
	{
		switch (screen)
		{
			case FADING:

			case MENU:
				handleMenuMouse();

			case ONE, TWO, THREE, FOUR:
				handlePlayMouse();

			case NONE:
		}
	}

	private function handleMenuMouse():Void
	{
		if (FlxG.mouse.justReleased)
		{
			// trace("oneUIRect: " + oneUIRect.x + "," + oneUIRect.y + " " + oneUIRect.width + "x" + oneUIRect.height);
			// trace("twoUIRect: " + twoUIRect.x + "," + twoUIRect.y + " " + twoUIRect.width + "x" + twoUIRect.height);
			// trace("threeUIRect: " + threeUIRect.x + "," + threeUIRect.y + " " + threeUIRect.width + "x" + threeUIRect.height);
			// trace("fourUIRect: " + fourUIRect.x + "," + fourUIRect.y + " " + fourUIRect.width + "x" + fourUIRect.height);
			// trace("Mouse: " + FlxG.mouse.x + "," + FlxG.mouse.y);

			if (oneUIRect.containsPoint(new Point(FlxG.mouse.x, FlxG.mouse.y)))
				return;
			if (twoUIRect.containsPoint(new Point(FlxG.mouse.x, FlxG.mouse.y)))
				return;
			if (threeUIRect.containsPoint(new Point(FlxG.mouse.x, FlxG.mouse.y)))
				return;
			if (fourUIRect.containsPoint(new Point(FlxG.mouse.x, FlxG.mouse.y)))
				return;

			if (FlxG.mouse.x < menuFocusPoint.x && FlxG.mouse.y < menuFocusPoint.y)
			{
				screen = FADING;
				fadeScreen = ONE;
				currentFocus = camera1FocusPoint;
				menuFadeOutCameras();
			}
			else if (FlxG.mouse.x > menuFocusPoint.x && FlxG.mouse.y < menuFocusPoint.y)
			{
				screen = FADING;
				fadeScreen = TWO;
				currentFocus = camera2FocusPoint;
				menuFadeOutCameras();
			}
			else if (FlxG.mouse.x < menuFocusPoint.x && FlxG.mouse.y > menuFocusPoint.y)
			{
				screen = FADING;
				fadeScreen = THREE;
				currentFocus = camera3FocusPoint;
				menuFadeOutCameras();
			}
			else if (FlxG.mouse.x > menuFocusPoint.x && FlxG.mouse.y > menuFocusPoint.y)
			{
				screen = FADING;
				fadeScreen = FOUR;
				currentFocus = camera4FocusPoint;
				menuFadeOutCameras();
			}
		}
	}

	private function menuFadeOutCameras():Void
	{
		FlxG.camera.fade(0xFF444444, FADE_TIME, false, menuFadeOutFinished);
		menuCamera1.fade(0xFF444444, FADE_TIME, false);
		menuCamera2.fade(0xFF444444, FADE_TIME, false);
		menuCamera3.fade(0xFF444444, FADE_TIME, false);
		menuCamera4.fade(0xFF444444, FADE_TIME, false);
	}

	private function menuFadeOutFinished():Void
	{
		FlxG.camera.stopFX();

		menuCamera1.stopFX();
		menuCamera1.visible = false;
		menuCamera2.stopFX();
		menuCamera2.visible = false;
		menuCamera3.stopFX();
		menuCamera3.visible = false;
		menuCamera4.stopFX();
		menuCamera4.visible = false;

		FlxG.camera.focusOn(currentFocus);
		screen = fadeScreen;

		menuButtons.visible = false;
		menuButtons.active = false;

		playButtons.visible = true;
		playButtons.active = true;

		FlxG.camera.fade(0xFF444444, FADE_TIME, true, playFadeInFinished);
	}

	private function playFadeInFinished():Void
	{
		FlxG.camera.stopFX();
	}

	private function returnToMenu():Void
	{
		screen = FADING;
		FlxG.camera.fade(0xFF444444, FADE_TIME, false, playFadeOutFinished);
	}

	private function playFadeOutFinished():Void
	{
		FlxG.camera.stopFX();

		menuCamera1.stopFX();
		menuCamera1.visible = true;
		menuCamera2.stopFX();
		menuCamera2.visible = true;
		menuCamera3.stopFX();
		menuCamera3.visible = true;
		menuCamera4.stopFX();
		menuCamera4.visible = true;

		currentFocus = menuFocusPoint;
		FlxG.camera.focusOn(currentFocus);

		menuButtons.visible = true;
		menuButtons.active = true;

		playButtons.visible = false;
		playButtons.active = false;

		FlxG.camera.fade(0xFF444444, FADE_TIME, true, menuFadeInFinished);
		menuCamera1.fade(0xFF444444, FADE_TIME, true);
		menuCamera2.fade(0xFF444444, FADE_TIME, true);
		menuCamera3.fade(0xFF444444, FADE_TIME, true);
		menuCamera4.fade(0xFF444444, FADE_TIME, true);
	}

	private function menuFadeInFinished():Void
	{
		FlxG.camera.stopFX();
		menuCamera1.stopFX();
		menuCamera2.stopFX();
		menuCamera3.stopFX();
		menuCamera4.stopFX();

		screen = MENU;
	}

	public function getBodyAtMouse():B2Body
	{
		var x:Float = Physics.screenToWorld(FlxG.mouse.x);
		var y:Float = Physics.screenToWorld(FlxG.mouse.y);

		var mousePVec:B2Vec2 = new B2Vec2(x, y);

		var aabb:B2AABB = new B2AABB();

		aabb.lowerBound = new B2Vec2(x - 0.001, y - 0.001);
		aabb.upperBound = new B2Vec2(x + 0.001, y + 0.001);

		var k_maxCount:Int = 10;
		var shapes:Array<B2Shape> = new Array();

		var body:B2Body = null;

		function getBodyCallback(fixture:B2Fixture):Bool
		{
			var shape:B2Shape = fixture.getShape();
			if (fixture.getBody().getType() != B2Body.b2_staticBody)
			{
				var inside:Bool = shape.testPoint(fixture.getBody().getTransform(), mousePVec);
				if (inside)
				{
					body = fixture.getBody();
					return false;
				}
			}
			return true;
		}

		Physics.WORLD.queryAABB(getBodyCallback, aabb);

		return body;
	}

	function handlePlayMouse():Void
	{
		if (FlxG.mouse.justPressed && mouseJoint == null)
		{
			var body:B2Body = getBodyAtMouse();

			if (body != null)
			{
				var md:B2MouseJointDef = new B2MouseJointDef();
				md.bodyA = Physics.WORLD.getGroundBody();
				md.bodyB = body;
				md.target.set(Physics.screenToWorld(FlxG.mouse.x), Physics.screenToWorld(FlxG.mouse.y));
				md.collideConnected = true;
				md.maxForce = 3000.0 * body.getMass();
				mouseJoint = cast(Physics.WORLD.createJoint(md), B2MouseJoint);
				mouseJoint.setMaxForce(300);
				body.setAwake(true);

				body.setLinearVelocity(new B2Vec2(0, 0));
			}
		}

		if (!FlxG.mouse.pressed)
		{
			if (mouseJoint != null)
			{
				Physics.WORLD.destroyJoint(mouseJoint);
				mouseJoint = null;
			}
		}

		if (mouseJoint != null)
		{
			var p2:B2Vec2 = new B2Vec2(Physics.screenToWorld(FlxG.mouse.x), Physics.screenToWorld(FlxG.mouse.y));
			mouseJoint.setTarget(p2);
		}
	}
}
