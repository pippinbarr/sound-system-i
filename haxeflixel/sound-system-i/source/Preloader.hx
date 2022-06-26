import flash.display.Bitmap;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormat;
import flixel.FlxG;
import flixel.system.FlxPreloader;
import flixel.system.FlxPreloader;
import flixel.text.FlxText;
import flixel.text.FlxText;

@:bitmap("assets/images/preloader/loading.png")
class CirclesBitmapData extends flash.display.BitmapData {}

@:bitmap("assets/images/preloader/click.png")
class ClickBitmapData extends flash.display.BitmapData {}

class Preloader extends FlxPreloader
{
	private var _bg:Bitmap;
	private var _loading:Bitmap;
	private var _loadingCover:Bitmap;
	private var _clickText:Bitmap;

	override private function create():Void
	{
		_buffer = new Sprite();
		addChild(_buffer);

		_bg = new Bitmap(new BitmapData(800, 600, false, 0xff444444));
		_bg.x = 0;
		_bg.y = 0;

		_buffer.addChild(_bg);
		// addChild(_bg);

		_loading = new Bitmap(new CirclesBitmapData(0, 0));
		_loading.x = stage.stageWidth / 2 - 400 / 2;
		_loading.y = stage.stageHeight / 2 - 100 / 2;

		_buffer.addChild(_loading);
		// addChild(_loading);

		_loadingCover = new Bitmap(new BitmapData(Std.int(400), Std.int(100), false, 0xff444444));
		_loadingCover.x = _loading.x;
		_loadingCover.y = _loading.y;

		_buffer.addChild(_loadingCover);

		_clickText = new Bitmap(new ClickBitmapData(0, 0));
		_clickText.x = _loading.x + 400 - 100;
		_clickText.y = _loading.y + 100 - 100;
		_buffer.addChild(_clickText);
		_clickText.visible = false;
	}

	override public function onLoaded():Void
	{
		super.onLoaded();
		_loaded = false;
		// trace("Here 2");
	}

	override public function update(Percent:Float):Void
	{
		var ActualPercent:Float = root.loaderInfo.bytesLoaded / root.loaderInfo.bytesTotal;
		_loadingCover.x = _loading.x + ActualPercent * _loading.width;

		if (ActualPercent >= 1.0 && !_clickText.visible)
		{
			_clickText.visible = true;
			stage.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, mouseDown);
		}
	}

	private function mouseDown(e:flash.events.MouseEvent):Void
	{
		stage.removeEventListener(flash.events.MouseEvent.MOUSE_DOWN, mouseDown);
		_loaded = true;
		stage.focus = null;
		// removeChild(_buffer);
		// _min = 1000;
	}

	// private function mouseDown(e:flash.events.MouseEvent):Void
	// {
	// 	_loaded = true;
	// 	stage.removeEventListener(flash.events.MouseEvent.MOUSE_DOWN,mouseDown);
	// 	//_min = 1000;
	// 	stage.focus = null;
	// }
}
