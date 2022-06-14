import lime.Assets;
#if !macro


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	private static var app:lime.app.Application;
	
	
	public static function create ():Void {
		
		app = new openfl.display.Application ();
		app.create (config);
		
		var display = new Preloader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if js
		var urls = [];
		var types = [];
		
		
		urls.push ("assets/data/data-goes-here.txt");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/images/bgs/bg1-2048.jpg");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/bgs/bg1.jpg");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/bgs/bg2-2048.jpg");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/bgs/bg2.jpg");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/bgs/bg3-2048.jpg");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/bgs/bg3.jpg");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/bgs/bg4-2048.jpg");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/bgs/bg4.jpg");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/buttons/back_button.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/buttons/back_button_small.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/buttons/pause_button.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/buttons/pause_button_small.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/buttons/play_button.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/buttons/play_button_small.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/buttons/reset_button.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/buttons/reset_button_small.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/circles/circle_black.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/circles/circle_cyan.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/circles/circle_magenta.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/circles/circle_yellow.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/preloader/loading.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/music/music-goes-here.txt");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/sounds/ArpAA1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/ArpAA1short.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/ArpAB1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/ArpAB1short.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/ArpAD1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/ArpAD1short.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/ArpAE1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/ArpAE1short.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/ArpBA2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/ArpBA3.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/ArpBB2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/ArpBD1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/ArpBD2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/ArpBE1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/ArpBE2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/ArpBFS1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/ArpBFS2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/boopA2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/boopA3.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/boopB2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/boopD1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/boopD2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/boopE1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/boopE2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/boopFS1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/boopFS2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/hihat.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/kick1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/kick2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/snare1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/sounds-go-here.txt");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/sounds/voice0.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/voice1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/voice2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/voice3.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/beep.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/flixel.mp3");
		types.push (AssetType.MUSIC);
		
		
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if sys
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (loaded == total) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			antialiasing: Std.int (0),
			background: Std.int (0),
			borderless: false,
			depthBuffer: false,
			fps: Std.int (60),
			fullscreen: false,
			height: Std.int (600),
			orientation: "portrait",
			resizable: true,
			stencilBuffer: false,
			title: "PhotograhicI",
			vsync: true,
			width: Std.int (800),
			
		}
		
		#if js
		#if munit
		flash.Lib.embed (null, 800, 600, "000000");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		openfl.Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
		openfl.Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields (Main)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		if (hasMain) {
			
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
