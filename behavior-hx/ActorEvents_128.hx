package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

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

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
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

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

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



class ActorEvents_128 extends ActorScript
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
        if(Engine.engine.getGameAttribute("ShowFiche"))
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
        Engine.engine.setGameAttribute("shwoFicheJohson", !(Engine.engine.getGameAttribute("shwoFicheJohson")));
        Engine.engine.setGameAttribute("showFiche11victime", false);
        Engine.engine.setGameAttribute("nom_case", "Case #7401");
        Engine.engine.setGameAttribute("nom_temoin", "Mr Eric Johnson");
        Engine.engine.setGameAttribute("desc_perso", "20 years old <br> 1m80 <br> Technician at \"Le Bonheur\" <br> Suspect for the case #7401");
        Engine.engine.setGameAttribute("texte_temoin", "\"I may have installed the cameras, but I didn't killed her ! [...] <br> I only spoke to him on the phone, and guessing by noises and this crime severity, it had to be from a phone cab. <br> But he had a voice suprisingly soft for an adult, I think he also had some sort of bad habit. <br> I mean I often heard a licking noise when he ended his sentences, it wasn't often enough to be noticeable though. <br>  He gave me money by dropping it directly into my mail box, I was never able to see him.\"");
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}