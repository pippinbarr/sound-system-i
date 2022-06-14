package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Font;
import lime.graphics.Image;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if (sys || nodejs)
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/images/bgs/bg1-2048.jpg", __ASSET__assets_images_bgs_bg1_2048_jpg);
		type.set ("assets/images/bgs/bg1-2048.jpg", AssetType.IMAGE);
		className.set ("assets/images/bgs/bg1.jpg", __ASSET__assets_images_bgs_bg1_jpg);
		type.set ("assets/images/bgs/bg1.jpg", AssetType.IMAGE);
		className.set ("assets/images/bgs/bg2-2048.jpg", __ASSET__assets_images_bgs_bg2_2048_jpg);
		type.set ("assets/images/bgs/bg2-2048.jpg", AssetType.IMAGE);
		className.set ("assets/images/bgs/bg2.jpg", __ASSET__assets_images_bgs_bg2_jpg);
		type.set ("assets/images/bgs/bg2.jpg", AssetType.IMAGE);
		className.set ("assets/images/bgs/bg3-2048.jpg", __ASSET__assets_images_bgs_bg3_2048_jpg);
		type.set ("assets/images/bgs/bg3-2048.jpg", AssetType.IMAGE);
		className.set ("assets/images/bgs/bg3.jpg", __ASSET__assets_images_bgs_bg3_jpg);
		type.set ("assets/images/bgs/bg3.jpg", AssetType.IMAGE);
		className.set ("assets/images/bgs/bg4-2048.jpg", __ASSET__assets_images_bgs_bg4_2048_jpg);
		type.set ("assets/images/bgs/bg4-2048.jpg", AssetType.IMAGE);
		className.set ("assets/images/bgs/bg4.jpg", __ASSET__assets_images_bgs_bg4_jpg);
		type.set ("assets/images/bgs/bg4.jpg", AssetType.IMAGE);
		className.set ("assets/images/buttons/back_button.png", __ASSET__assets_images_buttons_back_button_png);
		type.set ("assets/images/buttons/back_button.png", AssetType.IMAGE);
		className.set ("assets/images/buttons/back_button_small.png", __ASSET__assets_images_buttons_back_button_small_png);
		type.set ("assets/images/buttons/back_button_small.png", AssetType.IMAGE);
		className.set ("assets/images/buttons/pause_button.png", __ASSET__assets_images_buttons_pause_button_png);
		type.set ("assets/images/buttons/pause_button.png", AssetType.IMAGE);
		className.set ("assets/images/buttons/pause_button_small.png", __ASSET__assets_images_buttons_pause_button_small_png);
		type.set ("assets/images/buttons/pause_button_small.png", AssetType.IMAGE);
		className.set ("assets/images/buttons/play_button.png", __ASSET__assets_images_buttons_play_button_png);
		type.set ("assets/images/buttons/play_button.png", AssetType.IMAGE);
		className.set ("assets/images/buttons/play_button_small.png", __ASSET__assets_images_buttons_play_button_small_png);
		type.set ("assets/images/buttons/play_button_small.png", AssetType.IMAGE);
		className.set ("assets/images/buttons/reset_button.png", __ASSET__assets_images_buttons_reset_button_png);
		type.set ("assets/images/buttons/reset_button.png", AssetType.IMAGE);
		className.set ("assets/images/buttons/reset_button_small.png", __ASSET__assets_images_buttons_reset_button_small_png);
		type.set ("assets/images/buttons/reset_button_small.png", AssetType.IMAGE);
		className.set ("assets/images/circles/circle_black.png", __ASSET__assets_images_circles_circle_black_png);
		type.set ("assets/images/circles/circle_black.png", AssetType.IMAGE);
		className.set ("assets/images/circles/circle_cyan.png", __ASSET__assets_images_circles_circle_cyan_png);
		type.set ("assets/images/circles/circle_cyan.png", AssetType.IMAGE);
		className.set ("assets/images/circles/circle_magenta.png", __ASSET__assets_images_circles_circle_magenta_png);
		type.set ("assets/images/circles/circle_magenta.png", AssetType.IMAGE);
		className.set ("assets/images/circles/circle_yellow.png", __ASSET__assets_images_circles_circle_yellow_png);
		type.set ("assets/images/circles/circle_yellow.png", AssetType.IMAGE);
		className.set ("assets/images/preloader/loading.png", __ASSET__assets_images_preloader_loading_png);
		type.set ("assets/images/preloader/loading.png", AssetType.IMAGE);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/ArpAA1.mp3", __ASSET__assets_sounds_arpaa1_mp3);
		type.set ("assets/sounds/ArpAA1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/ArpAA1short.mp3", __ASSET__assets_sounds_arpaa1short_mp3);
		type.set ("assets/sounds/ArpAA1short.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/ArpAB1.mp3", __ASSET__assets_sounds_arpab1_mp3);
		type.set ("assets/sounds/ArpAB1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/ArpAB1short.mp3", __ASSET__assets_sounds_arpab1short_mp3);
		type.set ("assets/sounds/ArpAB1short.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/ArpAD1.mp3", __ASSET__assets_sounds_arpad1_mp3);
		type.set ("assets/sounds/ArpAD1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/ArpAD1short.mp3", __ASSET__assets_sounds_arpad1short_mp3);
		type.set ("assets/sounds/ArpAD1short.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/ArpAE1.mp3", __ASSET__assets_sounds_arpae1_mp3);
		type.set ("assets/sounds/ArpAE1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/ArpAE1short.mp3", __ASSET__assets_sounds_arpae1short_mp3);
		type.set ("assets/sounds/ArpAE1short.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/ArpBA2.mp3", __ASSET__assets_sounds_arpba2_mp3);
		type.set ("assets/sounds/ArpBA2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/ArpBA3.mp3", __ASSET__assets_sounds_arpba3_mp3);
		type.set ("assets/sounds/ArpBA3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/ArpBB2.mp3", __ASSET__assets_sounds_arpbb2_mp3);
		type.set ("assets/sounds/ArpBB2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/ArpBD1.mp3", __ASSET__assets_sounds_arpbd1_mp3);
		type.set ("assets/sounds/ArpBD1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/ArpBD2.mp3", __ASSET__assets_sounds_arpbd2_mp3);
		type.set ("assets/sounds/ArpBD2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/ArpBE1.mp3", __ASSET__assets_sounds_arpbe1_mp3);
		type.set ("assets/sounds/ArpBE1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/ArpBE2.mp3", __ASSET__assets_sounds_arpbe2_mp3);
		type.set ("assets/sounds/ArpBE2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/ArpBFS1.mp3", __ASSET__assets_sounds_arpbfs1_mp3);
		type.set ("assets/sounds/ArpBFS1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/ArpBFS2.mp3", __ASSET__assets_sounds_arpbfs2_mp3);
		type.set ("assets/sounds/ArpBFS2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/boopA2.mp3", __ASSET__assets_sounds_boopa2_mp3);
		type.set ("assets/sounds/boopA2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/boopA3.mp3", __ASSET__assets_sounds_boopa3_mp3);
		type.set ("assets/sounds/boopA3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/boopB2.mp3", __ASSET__assets_sounds_boopb2_mp3);
		type.set ("assets/sounds/boopB2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/boopD1.mp3", __ASSET__assets_sounds_boopd1_mp3);
		type.set ("assets/sounds/boopD1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/boopD2.mp3", __ASSET__assets_sounds_boopd2_mp3);
		type.set ("assets/sounds/boopD2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/boopE1.mp3", __ASSET__assets_sounds_boope1_mp3);
		type.set ("assets/sounds/boopE1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/boopE2.mp3", __ASSET__assets_sounds_boope2_mp3);
		type.set ("assets/sounds/boopE2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/boopFS1.mp3", __ASSET__assets_sounds_boopfs1_mp3);
		type.set ("assets/sounds/boopFS1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/boopFS2.mp3", __ASSET__assets_sounds_boopfs2_mp3);
		type.set ("assets/sounds/boopFS2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/hihat.mp3", __ASSET__assets_sounds_hihat_mp3);
		type.set ("assets/sounds/hihat.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/kick1.mp3", __ASSET__assets_sounds_kick1_mp3);
		type.set ("assets/sounds/kick1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/kick2.mp3", __ASSET__assets_sounds_kick2_mp3);
		type.set ("assets/sounds/kick2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/snare1.mp3", __ASSET__assets_sounds_snare1_mp3);
		type.set ("assets/sounds/snare1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/voice0.mp3", __ASSET__assets_sounds_voice0_mp3);
		type.set ("assets/sounds/voice0.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/voice1.mp3", __ASSET__assets_sounds_voice1_mp3);
		type.set ("assets/sounds/voice1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/voice2.mp3", __ASSET__assets_sounds_voice2_mp3);
		type.set ("assets/sounds/voice2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/voice3.mp3", __ASSET__assets_sounds_voice3_mp3);
		type.set ("assets/sounds/voice3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/bgs/bg1-2048.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bgs/bg1.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bgs/bg2-2048.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bgs/bg2.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bgs/bg3-2048.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bgs/bg3.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bgs/bg4-2048.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bgs/bg4.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/buttons/back_button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/buttons/back_button_small.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/buttons/pause_button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/buttons/pause_button_small.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/buttons/play_button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/buttons/play_button_small.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/buttons/reset_button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/buttons/reset_button_small.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/circles/circle_black.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/circles/circle_cyan.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/circles/circle_magenta.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/circles/circle_yellow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/preloader/loading.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/ArpAA1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/ArpAA1short.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/ArpAB1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/ArpAB1short.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/ArpAD1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/ArpAD1short.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/ArpAE1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/ArpAE1short.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/ArpBA2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/ArpBA3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/ArpBB2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/ArpBD1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/ArpBD2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/ArpBE1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/ArpBE2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/ArpBFS1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/ArpBFS2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/boopA2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/boopA3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/boopB2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/boopD1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/boopD2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/boopE1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/boopE2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/boopFS1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/boopFS2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/hihat.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/kick1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/kick2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/snare1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/voice0.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/voice1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/voice2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/voice3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		/*var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/bgs/bg1-2048.jpg", __ASSET__assets_images_bgs_bg1_2048_jpg);
		type.set ("assets/images/bgs/bg1-2048.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/bgs/bg1.jpg", __ASSET__assets_images_bgs_bg1_jpg);
		type.set ("assets/images/bgs/bg1.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/bgs/bg2-2048.jpg", __ASSET__assets_images_bgs_bg2_2048_jpg);
		type.set ("assets/images/bgs/bg2-2048.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/bgs/bg2.jpg", __ASSET__assets_images_bgs_bg2_jpg);
		type.set ("assets/images/bgs/bg2.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/bgs/bg3-2048.jpg", __ASSET__assets_images_bgs_bg3_2048_jpg);
		type.set ("assets/images/bgs/bg3-2048.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/bgs/bg3.jpg", __ASSET__assets_images_bgs_bg3_jpg);
		type.set ("assets/images/bgs/bg3.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/bgs/bg4-2048.jpg", __ASSET__assets_images_bgs_bg4_2048_jpg);
		type.set ("assets/images/bgs/bg4-2048.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/bgs/bg4.jpg", __ASSET__assets_images_bgs_bg4_jpg);
		type.set ("assets/images/bgs/bg4.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/buttons/back_button.png", __ASSET__assets_images_buttons_back_button_png);
		type.set ("assets/images/buttons/back_button.png", AssetType.IMAGE);
		
		className.set ("assets/images/buttons/back_button_small.png", __ASSET__assets_images_buttons_back_button_small_png);
		type.set ("assets/images/buttons/back_button_small.png", AssetType.IMAGE);
		
		className.set ("assets/images/buttons/pause_button.png", __ASSET__assets_images_buttons_pause_button_png);
		type.set ("assets/images/buttons/pause_button.png", AssetType.IMAGE);
		
		className.set ("assets/images/buttons/pause_button_small.png", __ASSET__assets_images_buttons_pause_button_small_png);
		type.set ("assets/images/buttons/pause_button_small.png", AssetType.IMAGE);
		
		className.set ("assets/images/buttons/play_button.png", __ASSET__assets_images_buttons_play_button_png);
		type.set ("assets/images/buttons/play_button.png", AssetType.IMAGE);
		
		className.set ("assets/images/buttons/play_button_small.png", __ASSET__assets_images_buttons_play_button_small_png);
		type.set ("assets/images/buttons/play_button_small.png", AssetType.IMAGE);
		
		className.set ("assets/images/buttons/reset_button.png", __ASSET__assets_images_buttons_reset_button_png);
		type.set ("assets/images/buttons/reset_button.png", AssetType.IMAGE);
		
		className.set ("assets/images/buttons/reset_button_small.png", __ASSET__assets_images_buttons_reset_button_small_png);
		type.set ("assets/images/buttons/reset_button_small.png", AssetType.IMAGE);
		
		className.set ("assets/images/circles/circle_black.png", __ASSET__assets_images_circles_circle_black_png);
		type.set ("assets/images/circles/circle_black.png", AssetType.IMAGE);
		
		className.set ("assets/images/circles/circle_cyan.png", __ASSET__assets_images_circles_circle_cyan_png);
		type.set ("assets/images/circles/circle_cyan.png", AssetType.IMAGE);
		
		className.set ("assets/images/circles/circle_magenta.png", __ASSET__assets_images_circles_circle_magenta_png);
		type.set ("assets/images/circles/circle_magenta.png", AssetType.IMAGE);
		
		className.set ("assets/images/circles/circle_yellow.png", __ASSET__assets_images_circles_circle_yellow_png);
		type.set ("assets/images/circles/circle_yellow.png", AssetType.IMAGE);
		
		className.set ("assets/images/preloader/loading.png", __ASSET__assets_images_preloader_loading_png);
		type.set ("assets/images/preloader/loading.png", AssetType.IMAGE);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/ArpAA1.mp3", __ASSET__assets_sounds_arpaa1_mp3);
		type.set ("assets/sounds/ArpAA1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/ArpAA1short.mp3", __ASSET__assets_sounds_arpaa1short_mp3);
		type.set ("assets/sounds/ArpAA1short.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/ArpAB1.mp3", __ASSET__assets_sounds_arpab1_mp3);
		type.set ("assets/sounds/ArpAB1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/ArpAB1short.mp3", __ASSET__assets_sounds_arpab1short_mp3);
		type.set ("assets/sounds/ArpAB1short.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/ArpAD1.mp3", __ASSET__assets_sounds_arpad1_mp3);
		type.set ("assets/sounds/ArpAD1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/ArpAD1short.mp3", __ASSET__assets_sounds_arpad1short_mp3);
		type.set ("assets/sounds/ArpAD1short.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/ArpAE1.mp3", __ASSET__assets_sounds_arpae1_mp3);
		type.set ("assets/sounds/ArpAE1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/ArpAE1short.mp3", __ASSET__assets_sounds_arpae1short_mp3);
		type.set ("assets/sounds/ArpAE1short.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/ArpBA2.mp3", __ASSET__assets_sounds_arpba2_mp3);
		type.set ("assets/sounds/ArpBA2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/ArpBA3.mp3", __ASSET__assets_sounds_arpba3_mp3);
		type.set ("assets/sounds/ArpBA3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/ArpBB2.mp3", __ASSET__assets_sounds_arpbb2_mp3);
		type.set ("assets/sounds/ArpBB2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/ArpBD1.mp3", __ASSET__assets_sounds_arpbd1_mp3);
		type.set ("assets/sounds/ArpBD1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/ArpBD2.mp3", __ASSET__assets_sounds_arpbd2_mp3);
		type.set ("assets/sounds/ArpBD2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/ArpBE1.mp3", __ASSET__assets_sounds_arpbe1_mp3);
		type.set ("assets/sounds/ArpBE1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/ArpBE2.mp3", __ASSET__assets_sounds_arpbe2_mp3);
		type.set ("assets/sounds/ArpBE2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/ArpBFS1.mp3", __ASSET__assets_sounds_arpbfs1_mp3);
		type.set ("assets/sounds/ArpBFS1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/ArpBFS2.mp3", __ASSET__assets_sounds_arpbfs2_mp3);
		type.set ("assets/sounds/ArpBFS2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/boopA2.mp3", __ASSET__assets_sounds_boopa2_mp3);
		type.set ("assets/sounds/boopA2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/boopA3.mp3", __ASSET__assets_sounds_boopa3_mp3);
		type.set ("assets/sounds/boopA3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/boopB2.mp3", __ASSET__assets_sounds_boopb2_mp3);
		type.set ("assets/sounds/boopB2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/boopD1.mp3", __ASSET__assets_sounds_boopd1_mp3);
		type.set ("assets/sounds/boopD1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/boopD2.mp3", __ASSET__assets_sounds_boopd2_mp3);
		type.set ("assets/sounds/boopD2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/boopE1.mp3", __ASSET__assets_sounds_boope1_mp3);
		type.set ("assets/sounds/boopE1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/boopE2.mp3", __ASSET__assets_sounds_boope2_mp3);
		type.set ("assets/sounds/boopE2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/boopFS1.mp3", __ASSET__assets_sounds_boopfs1_mp3);
		type.set ("assets/sounds/boopFS1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/boopFS2.mp3", __ASSET__assets_sounds_boopfs2_mp3);
		type.set ("assets/sounds/boopFS2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/hihat.mp3", __ASSET__assets_sounds_hihat_mp3);
		type.set ("assets/sounds/hihat.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/kick1.mp3", __ASSET__assets_sounds_kick1_mp3);
		type.set ("assets/sounds/kick1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/kick2.mp3", __ASSET__assets_sounds_kick2_mp3);
		type.set ("assets/sounds/kick2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/snare1.mp3", __ASSET__assets_sounds_snare1_mp3);
		type.set ("assets/sounds/snare1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/voice0.mp3", __ASSET__assets_sounds_voice0_mp3);
		type.set ("assets/sounds/voice0.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/voice1.mp3", __ASSET__assets_sounds_voice1_mp3);
		type.set ("assets/sounds/voice1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/voice2.mp3", __ASSET__assets_sounds_voice2_mp3);
		type.set ("assets/sounds/voice2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/voice3.mp3", __ASSET__assets_sounds_voice3_mp3);
		type.set ("assets/sounds/voice3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		*/
		var useManifest = true;
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && requestedType == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return AudioBuffer.fromFile (path.get (id));
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		//return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		//else 
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Dynamic /*Font*/ {
		
		// TODO: Complete Lime Font API
		
		#if openfl
		#if (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), openfl.text.Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			openfl.text.Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), openfl.text.Font);
			
		} else {
			
			return new openfl.text.Font (path.get (id));
			
		}
		
		#end
		#end
		
		return null;
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		return Image.fromFile (path.get (id));
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getAudioBuffer (id));
			
		//}
		
		#else
		
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_bgs_bg1_2048_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bgs_bg1_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bgs_bg2_2048_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bgs_bg2_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bgs_bg3_2048_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bgs_bg3_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bgs_bg4_2048_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bgs_bg4_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_buttons_back_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_buttons_back_button_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_buttons_pause_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_buttons_pause_button_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_buttons_play_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_buttons_play_button_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_buttons_reset_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_buttons_reset_button_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_circles_circle_black_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_circles_circle_cyan_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_circles_circle_magenta_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_circles_circle_yellow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_preloader_loading_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpaa1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpaa1short_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpab1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpab1short_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpad1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpad1short_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpae1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpae1short_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpba2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpba3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpbb2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpbd1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpbd2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpbe1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpbe2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpbfs1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_arpbfs2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_boopa2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_boopa3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_boopb2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_boopd1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_boopd2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_boope1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_boope2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_boopfs1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_boopfs2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hihat_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_kick1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_kick2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_snare1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice0_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }


#elseif html5

#if openfl





























































#end

#else

#if openfl

#end

#if (windows || mac || linux)

//
//@:file("assets/data/data-goes-here.txt") class __ASSET__assets_data_data_goes_here_txt extends lime.utils.ByteArray {}
//@:bitmap("assets/images/bgs/bg1-2048.jpg") class __ASSET__assets_images_bgs_bg1_2048_jpg extends openfl.display.BitmapData {}
//@:bitmap("assets/images/bgs/bg1.jpg") class __ASSET__assets_images_bgs_bg1_jpg extends openfl.display.BitmapData {}
//@:bitmap("assets/images/bgs/bg2-2048.jpg") class __ASSET__assets_images_bgs_bg2_2048_jpg extends openfl.display.BitmapData {}
//@:bitmap("assets/images/bgs/bg2.jpg") class __ASSET__assets_images_bgs_bg2_jpg extends openfl.display.BitmapData {}
//@:bitmap("assets/images/bgs/bg3-2048.jpg") class __ASSET__assets_images_bgs_bg3_2048_jpg extends openfl.display.BitmapData {}
//@:bitmap("assets/images/bgs/bg3.jpg") class __ASSET__assets_images_bgs_bg3_jpg extends openfl.display.BitmapData {}
//@:bitmap("assets/images/bgs/bg4-2048.jpg") class __ASSET__assets_images_bgs_bg4_2048_jpg extends openfl.display.BitmapData {}
//@:bitmap("assets/images/bgs/bg4.jpg") class __ASSET__assets_images_bgs_bg4_jpg extends openfl.display.BitmapData {}
//@:bitmap("assets/images/buttons/back_button.png") class __ASSET__assets_images_buttons_back_button_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/buttons/back_button_small.png") class __ASSET__assets_images_buttons_back_button_small_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/buttons/pause_button.png") class __ASSET__assets_images_buttons_pause_button_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/buttons/pause_button_small.png") class __ASSET__assets_images_buttons_pause_button_small_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/buttons/play_button.png") class __ASSET__assets_images_buttons_play_button_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/buttons/play_button_small.png") class __ASSET__assets_images_buttons_play_button_small_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/buttons/reset_button.png") class __ASSET__assets_images_buttons_reset_button_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/buttons/reset_button_small.png") class __ASSET__assets_images_buttons_reset_button_small_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/circles/circle_black.png") class __ASSET__assets_images_circles_circle_black_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/circles/circle_cyan.png") class __ASSET__assets_images_circles_circle_cyan_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/circles/circle_magenta.png") class __ASSET__assets_images_circles_circle_magenta_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/circles/circle_yellow.png") class __ASSET__assets_images_circles_circle_yellow_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/preloader/loading.png") class __ASSET__assets_images_preloader_loading_png extends openfl.display.BitmapData {}
//@:file("assets/music/music-goes-here.txt") class __ASSET__assets_music_music_goes_here_txt extends lime.utils.ByteArray {}
//@:sound("assets/sounds/ArpAA1.mp3") class __ASSET__assets_sounds_arpaa1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/ArpAA1short.mp3") class __ASSET__assets_sounds_arpaa1short_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/ArpAB1.mp3") class __ASSET__assets_sounds_arpab1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/ArpAB1short.mp3") class __ASSET__assets_sounds_arpab1short_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/ArpAD1.mp3") class __ASSET__assets_sounds_arpad1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/ArpAD1short.mp3") class __ASSET__assets_sounds_arpad1short_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/ArpAE1.mp3") class __ASSET__assets_sounds_arpae1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/ArpAE1short.mp3") class __ASSET__assets_sounds_arpae1short_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/ArpBA2.mp3") class __ASSET__assets_sounds_arpba2_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/ArpBA3.mp3") class __ASSET__assets_sounds_arpba3_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/ArpBB2.mp3") class __ASSET__assets_sounds_arpbb2_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/ArpBD1.mp3") class __ASSET__assets_sounds_arpbd1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/ArpBD2.mp3") class __ASSET__assets_sounds_arpbd2_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/ArpBE1.mp3") class __ASSET__assets_sounds_arpbe1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/ArpBE2.mp3") class __ASSET__assets_sounds_arpbe2_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/ArpBFS1.mp3") class __ASSET__assets_sounds_arpbfs1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/ArpBFS2.mp3") class __ASSET__assets_sounds_arpbfs2_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/boopA2.mp3") class __ASSET__assets_sounds_boopa2_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/boopA3.mp3") class __ASSET__assets_sounds_boopa3_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/boopB2.mp3") class __ASSET__assets_sounds_boopb2_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/boopD1.mp3") class __ASSET__assets_sounds_boopd1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/boopD2.mp3") class __ASSET__assets_sounds_boopd2_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/boopE1.mp3") class __ASSET__assets_sounds_boope1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/boopE2.mp3") class __ASSET__assets_sounds_boope2_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/boopFS1.mp3") class __ASSET__assets_sounds_boopfs1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/boopFS2.mp3") class __ASSET__assets_sounds_boopfs2_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/hihat.mp3") class __ASSET__assets_sounds_hihat_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/kick1.mp3") class __ASSET__assets_sounds_kick1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/kick2.mp3") class __ASSET__assets_sounds_kick2_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/snare1.mp3") class __ASSET__assets_sounds_snare1_mp3 extends openfl.media.Sound {}
//@:file("assets/sounds/sounds-go-here.txt") class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.ByteArray {}
//@:sound("assets/sounds/voice0.mp3") class __ASSET__assets_sounds_voice0_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/voice1.mp3") class __ASSET__assets_sounds_voice1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/voice2.mp3") class __ASSET__assets_sounds_voice2_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/voice3.mp3") class __ASSET__assets_sounds_voice3_mp3 extends openfl.media.Sound {}
//@:sound("/usr/lib/haxe/lib/flixel/3,3,6/assets/sounds/beep.mp3") class __ASSET__assets_sounds_beep_mp3 extends openfl.media.Sound {}
//@:sound("/usr/lib/haxe/lib/flixel/3,3,6/assets/sounds/flixel.mp3") class __ASSET__assets_sounds_flixel_mp3 extends openfl.media.Sound {}
//
//

#end

#end
#end

