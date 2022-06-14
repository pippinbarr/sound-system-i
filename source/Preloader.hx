import flixel.system.FlxPreloader;
import flixel.text.FlxText;

import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.text.TextField;
import flash.text.TextFormat;


@:bitmap("assets/images/preloader/loading.png") 
class CirclesBitmapData extends flash.display.BitmapData {}

class Preloader extends FlxPreloader
{
	private var _bg:Bitmap;
	private var _loading:Bitmap;
	private var _loadingCover:Bitmap;


	override private function create():Void
	{
		// _buffer = new Sprite();
		// addChild(_buffer);

		_bg = new Bitmap(new BitmapData(800,600,false,0x444444));
		_bg.x = 0; _bg.y = 0;

		// _buffer.addChild(_bg);
		addChild(_bg);

		_loading = new Bitmap(new CirclesBitmapData(0,0));
		_loading.x = stage.stageWidth / 2 - _loading.width / 2;
		_loading.y = stage.stageHeight / 2 - _loading.height/2;
		
		// _buffer.addChild(_loading);
		addChild(_loading);

		_loadingCover = new Bitmap(new BitmapData(Std.int(_loading.width),Std.int(_loading.height),false,0x444444));
		_loadingCover.x = _loading.x; _loadingCover.y = _loading.y;

		addChild(_loadingCover);

	}


	override public function onLoaded():Void
	{
		super.onLoaded();
		// _loaded = true;
		// trace("Here 2");
	}


	override public function update(Percent:Float):Void
	{
		var ActualPercent:Float = root.loaderInfo.bytesLoaded / root.loaderInfo.bytesTotal;
		// _loadingCover.scaleX = ActualPercent * (stage.stageWidth + 10);
		_loadingCover.x = _loading.x + ActualPercent * _loading.width;

		if (ActualPercent >= 1.0)
		{
			// trace("Here.");
			// _loaded = true;
			// stage.focus = null;
			// stage.addEventListener(flash.events.MouseEvent.MOUSE_DOWN,mouseDown);
		}
	}

	// private function mouseDown(e:flash.events.MouseEvent):Void 
	// {
	// 	_loaded = true;
	// 	stage.removeEventListener(flash.events.MouseEvent.MOUSE_DOWN,mouseDown);
	// 	//_min = 1000;
	// 	stage.focus = null;
	// }

}
