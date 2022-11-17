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



class ActorEvents_12 extends ActorScript
{
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		
	}
	
	override public function init()
	{
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((Engine.engine.getGameAttribute("ShowChoice") : Bool) && (Engine.engine.getGameAttribute("carnet_hide") : Bool)))
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
				if(!(engine.isPaused()))
				{
					if((Engine.engine.getGameAttribute("carnet_hide") : Bool))
					{
						if((((Engine.engine.getGameAttribute("ask") : String) == "Q1") || ((Engine.engine.getGameAttribute("Levent") : String) == "Q1")))
						{
							playSound(getSound(156));
							Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
							Engine.engine.setGameAttribute("Q1", true);
							Engine.engine.setGameAttribute("ask", "null");
							Engine.engine.setGameAttribute("ShowNext", true);
							Engine.engine.setGameAttribute("karma", ((Engine.engine.getGameAttribute("karma") : Float) + (Engine.engine.getGameAttribute("karma_point") : Float)));
							Engine.engine.setGameAttribute("QKarma", "good");
						}
						if((((Engine.engine.getGameAttribute("ask") : String) == "Q2") || ((Engine.engine.getGameAttribute("Levent") : String) == "Q2")))
						{
							playSound(getSound(156));
							Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
							Engine.engine.setGameAttribute("ask", "null");
							Engine.engine.setGameAttribute("Q2", true);
							Engine.engine.setGameAttribute("ShowNext", true);
							Engine.engine.setGameAttribute("karma", ((Engine.engine.getGameAttribute("karma") : Float) + (Engine.engine.getGameAttribute("karma_point") : Float)));
							Engine.engine.setGameAttribute("QKarma", "good");
						}
						if((((Engine.engine.getGameAttribute("ask") : String) == "Q3") || ((Engine.engine.getGameAttribute("Levent") : String) == "Q3")))
						{
							playSound(getSound(156));
							Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
							Engine.engine.setGameAttribute("ask", "null");
							Engine.engine.setGameAttribute("Q3", true);
							Engine.engine.setGameAttribute("ShowNext", true);
							Engine.engine.setGameAttribute("karma", ((Engine.engine.getGameAttribute("karma") : Float) + (Engine.engine.getGameAttribute("karma_point") : Float)));
							Engine.engine.setGameAttribute("QKarma", "good");
						}
						if((((Engine.engine.getGameAttribute("ask") : String) == "Q4") || ((Engine.engine.getGameAttribute("Levent") : String) == "Q4")))
						{
							playSound(getSound(156));
							Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
							Engine.engine.setGameAttribute("ask", "null");
							Engine.engine.setGameAttribute("Q4", true);
							Engine.engine.setGameAttribute("ShowNext", true);
							Engine.engine.setGameAttribute("karma", ((Engine.engine.getGameAttribute("karma") : Float) + (Engine.engine.getGameAttribute("karma_point") : Float)));
							Engine.engine.setGameAttribute("QKarma", "good");
						}
					}
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}