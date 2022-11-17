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



class Design_86_86_dialog extends SceneScript
{
	
public var _DialogueList:Array<Dynamic>;

public var _LineList:Array<Dynamic>;

public var _WordList:Array<Dynamic>;

public var _PersoFeel:String;

public var _Interlocuteur:String;

public var _curfont:String;

public var _CurrentLine:Float;

public var _linelenght:Float;

public var _taillemotespace:Float;

public var _xx:Float;

public var _jj:Float;

public var _dialog:Actor;

 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Dialogue List", "_DialogueList");
_DialogueList = [];
nameMap.set("Line List", "_LineList");
_LineList = [];
nameMap.set("Word List", "_WordList");
_WordList = [];
nameMap.set("PersoFeel", "_PersoFeel");
_PersoFeel = "";
nameMap.set("Interlocuteur", "_Interlocuteur");
_Interlocuteur = "";
nameMap.set("cur_font", "_curfont");
_curfont = "";
nameMap.set("Current Line", "_CurrentLine");
_CurrentLine = 0.0;
nameMap.set("line lenght", "_linelenght");
_linelenght = 0.0;
nameMap.set("taille motespace", "_taillemotespace");
_taillemotespace = 0.0;
nameMap.set("xx", "_xx");
_xx = 0.0;
nameMap.set("jj", "_jj");
_jj = 0.0;
nameMap.set("dialog", "_dialog");

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        Engine.engine.setGameAttribute("LineList", _LineList);
    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        Engine.engine.setGameAttribute("MaxDialogue", (Engine.engine.getGameAttribute("LineList").length - 1));
        if(Engine.engine.getGameAttribute("carnet_hide"))
{
            Engine.engine.setGameAttribute("Dialog list", ("" + Engine.engine.getGameAttribute("LineList")[Std.int(Engine.engine.getGameAttribute("NumDialogue"))]).split(":"));
            _WordList = ("" + Engine.engine.getGameAttribute("Dialog list")[Std.int(1)]).split(" ");
propertyChanged("_WordList", _WordList);
            Engine.engine.setGameAttribute("PersoFeel", StringTools.trim(("" + Engine.engine.getGameAttribute("Dialog list")[Std.int(2)])));
            Engine.engine.setGameAttribute("interlocuteur", StringTools.trim(("" + Engine.engine.getGameAttribute("Dialog list")[Std.int(0)])));
            Engine.engine.setGameAttribute("ask", StringTools.trim(("" + Engine.engine.getGameAttribute("Dialog list")[Std.int(3)])));
            Engine.engine.setGameAttribute("Levent", StringTools.trim(("" + Engine.engine.getGameAttribute("Dialog list")[Std.int(4)])));
            if(Engine.engine.getGameAttribute("ShowDialog"))
{
                if((Engine.engine.getGameAttribute("NumDialogue") <= Engine.engine.getGameAttribute("MaxDialogue")))
{
                    /* "DIALOGUE" */
                    if((Engine.engine.getGameAttribute("interlocuteur") == "himself"))
{
                        g.setFont(getFont(31));
                        _dialog.setAnimation("" + "normal");
                        _curfont = "normal";
propertyChanged("_curfont", _curfont);
}

                    else if((Engine.engine.getGameAttribute("interlocuteur") == "Anna"))
{
                        if(((getCurrentSceneName() == "05 act1 scene01 interro") || ((getCurrentSceneName() == "08 act1 scene02 interro") || (getCurrentSceneName() == "11 act1 scene03 interro"))))
{
                            g.setFont(getFont(119));
                            _dialog.setAnimation("" + "evennement");
                            g.drawString("" + Engine.engine.getGameAttribute("interlocuteur"), (_dialog.getX() + 45), (_dialog.getY() + 25));
                            g.setFont(getFont(118));
                            _curfont = "eve";
propertyChanged("_curfont", _curfont);
}

                        else
{
                            _dialog.setAnimation("" + "normal");
                            g.setFont(getFont(82));
                            g.drawString("" + Engine.engine.getGameAttribute("interlocuteur"), (_dialog.getX() + 45), (_dialog.getY() + 25));
                            g.setFont(getFont(2));
}

}

                    else if((Engine.engine.getGameAttribute("interlocuteur") == "hors"))
{
                        _dialog.setAnimation("" + "normal");
                        g.setFont(getFont(2));
}

                    else
{
                        _dialog.setAnimation("" + "normal");
                        g.setFont(getFont(82));
                        g.drawString("" + Engine.engine.getGameAttribute("interlocuteur"), (_dialog.getX() + 45), (_dialog.getY() + 25));
                        g.setFont(getFont(2));
}

                    _CurrentLine = asNumber(0);
propertyChanged("_CurrentLine", _CurrentLine);
                    _linelenght = asNumber(0);
propertyChanged("_linelenght", _linelenght);
                    for(item in cast(_WordList, Array<Dynamic>))
{
                        if((_curfont == "eve"))
{
                            _taillemotespace = asNumber((getFont(118).font.getTextWidth(convertToPseudoUnicode(item))/Engine.SCALE + getFont(118).font.getTextWidth(" ")/Engine.SCALE));
propertyChanged("_taillemotespace", _taillemotespace);
}

                        else if((_curfont == "himself"))
{
                            _taillemotespace = asNumber((getFont(31).font.getTextWidth(convertToPseudoUnicode(item))/Engine.SCALE + getFont(31).font.getTextWidth(" ")/Engine.SCALE));
propertyChanged("_taillemotespace", _taillemotespace);
}

                        else
{
                            _taillemotespace = asNumber((getFont(2).font.getTextWidth(convertToPseudoUnicode(item))/Engine.SCALE + getFont(2).font.getTextWidth(" ")/Engine.SCALE));
propertyChanged("_taillemotespace", _taillemotespace);
}

                        g.drawString("" + convertToPseudoUnicode(item), (_linelenght + (_dialog.getX() + 30)), (_CurrentLine + (_dialog.getY() + 80)));
                        _linelenght += _taillemotespace;
propertyChanged("_linelenght", _linelenght);
                        if((_linelenght > 1400))
{
                            _CurrentLine += (getFont(2).getHeight()/Engine.SCALE + 5);
propertyChanged("_CurrentLine", _CurrentLine);
                            _linelenght = asNumber(0);
propertyChanged("_linelenght", _linelenght);
}

}

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