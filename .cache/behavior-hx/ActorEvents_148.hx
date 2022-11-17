package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;
import com.stencyl.graphics.ScaleMode;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Config;
import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.motion.*;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class ActorEvents_148 extends ActorScript
{
	public var _descc:String;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("descc", "_descc");
		_descc = "";
		
	}
	
	override public function init()
	{
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("ShowFiche") : Bool))
				{
					actor.enableActorDrawing();
				}
				else
				{
					actor.disableActorDrawing();
				}
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				Engine.engine.setGameAttribute("shwoFicheJohson", !((Engine.engine.getGameAttribute("shwoFicheJohson") : Bool)));
				Engine.engine.setGameAttribute("showFiche11victime", false);
				Engine.engine.setGameAttribute("nom_case", "Case #7402");
				Engine.engine.setGameAttribute("nom_temoin", "Mr Jean Collibris");
				Engine.engine.setGameAttribute("desc_perso", "35 years old <br> 1m82 <br> Chief at \"La Bonne Omelette\" <br> <br> Suspect for the case #7402");
				Engine.engine.setGameAttribute("texte_temoin", "he called himself Theodore Lawliet [...] he was tall, blond and got a reedy voice [...] <br> I also remember he was always licking his upper lip [...] <br> I met him while I was collecting mushroom int the forest. I was lost this day and I fell into some sort of cave [...] <br> the near wasn't properly cleared, but it was strange the cave <br> seemed to have been set up as an atomic bunker [...] <br> there was this big iron door wich was closed with a keypad next to it [...] <br> there was an railway near the place [...] <br> there was also an old mirador [...]");
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}