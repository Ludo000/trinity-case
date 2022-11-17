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



class Design_20_20_ThreeStateButton extends ActorScript
{          	
	
public var _NormalAnimation:String;

public var _PressedAnimation:String;

public var _Down:Bool;

public var _HoverAnimation:String;

public var _Message:String;
    
/* ========================= Custom Event ========================= */
public function _customEvent_Action():Void
{
        actor.shout("_customEvent_" + _Message);
}


 
 	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Normal Animation", "_NormalAnimation");
nameMap.set("Pressed Animation", "_PressedAnimation");
nameMap.set("Down", "_Down");
_Down = false;
nameMap.set("Hover Animation", "_HoverAnimation");
nameMap.set("Message", "_Message");
_Message = "";
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        actor.anchorToScreen();
    
/* =========================== On Actor =========================== */
addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        actor.setAnimation("" + _PressedAnimation);
        _Down = true;
propertyChanged("_Down", _Down);
}
});
    
/* =========================== On Actor =========================== */
addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 5 == mouseState)
{
        if(_Down)
{
            _customEvent_Action();
}

        if(#if mobile true #else false #end)
{
            actor.setAnimation("" + _NormalAnimation);
}

        else
{
            actor.setAnimation("" + _HoverAnimation);
}

        _Down = false;
propertyChanged("_Down", _Down);
}
});
    
/* =========================== On Actor =========================== */
addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 1 == mouseState)
{
        actor.setAnimation("" + _HoverAnimation);
}
});
    
/* =========================== On Actor =========================== */
addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && -1 == mouseState)
{
        actor.setAnimation("" + _NormalAnimation);
        _Down = false;
propertyChanged("_Down", _Down);
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}