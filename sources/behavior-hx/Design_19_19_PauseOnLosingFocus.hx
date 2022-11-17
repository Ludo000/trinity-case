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
import box2D.collision.shapes.B2Shape;

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



class Design_19_19_PauseOnLosingFocus extends SceneScript
{
	
public var _PauseControl:String;

public var _DimScreen:Bool;

public var _DimmingOpacity:Float;

public var _DimmingColor:Int;

public var _FocusLost:Bool;

public var _PausedText:String;

public var _Font:Font;

public var _menuouvert:Bool;

 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Pause Control", "_PauseControl");
nameMap.set("Dim Screen", "_DimScreen");
_DimScreen = true;
nameMap.set("Dimming Opacity", "_DimmingOpacity");
_DimmingOpacity = 50.0;
nameMap.set("Dimming Color", "_DimmingColor");
_DimmingColor = Utils.getColorRGB(0,0,0);
nameMap.set("Focus Lost", "_FocusLost");
_FocusLost = false;
nameMap.set("Paused Text", "_PausedText");
_PausedText = "Paused";
nameMap.set("Font", "_Font");
nameMap.set("menuouvert", "_menuouvert");
_menuouvert = false;

	}
	
	override public function init()
	{
		    
/* ============================ Focus ============================= */
addFocusChangeListener(function(lost:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && lost)
{
        _FocusLost = true;
propertyChanged("_FocusLost", _FocusLost);
        engine.pause();
}
});
    
/* ============================ Click ============================= */
addMouseReleasedListener(function(list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if((engine.isPaused() && _FocusLost))
{
            engine.unpause();
}

        _FocusLost = false;
propertyChanged("_FocusLost", _FocusLost);
}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener("echap", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && released)
{
        if(!(engine.isPaused()))
{
            engine.pause();
            Engine.engine.setGameAttribute("carnet_hide", true);
            pauseSoundOnChannel(Std.int(0));
}

        else
{
            engine.unpause();
            resumeSoundOnChannel(Std.int(0));
            Engine.engine.setGameAttribute("menu_ouvert", false);
}

}
});
    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if((engine.isPaused() || _FocusLost))
{
            if(!(Engine.engine.getGameAttribute("menu_ouvert")))
{
                Engine.engine.setGameAttribute("menu_ouvert", true);
                createRecycledActor(getActorType(193), ((getScreenWidth() - 501) / 2), 600, Script.FRONT);
                createRecycledActor(getActorType(196), ((getScreenWidth() - 501) / 2), 800, Script.FRONT);
                createRecycledActor(getActorType(203), 1305, 56, Script.FRONT);
                createRecycledActor(getActorType(201), 1267, 22, Script.FRONT);
                createRecycledActor(getActorType(205), 1680, 40, Script.FRONT);
}

            if(_DimScreen)
{
                g.fillColor = _DimmingColor;
                g.alpha = (_DimmingOpacity/100);
                g.fillRect(0, 0, getScreenWidth(), getScreenHeight());
}

}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}