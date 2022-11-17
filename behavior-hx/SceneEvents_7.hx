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



class SceneEvents_7 extends SceneScript
{
	
public var _Interlocuteur:String;

public var _descperso:Array<Dynamic>;

public var _descc:String;

public var _NumDialogue:Float;

public var _descrperso:Array<Dynamic>;

public var _positionSurX:Float;

public var _WordList:Array<Dynamic>;

public var _CurrentLine:Float;

public var _LineList:Array<Dynamic>;

public var _positionSurY:Float;

public var _HoverQCMChoix3:Bool;

public var _DialogueList:Array<Dynamic>;

public var _linelenght:Float;

public var _HoverQCMChoix1:Bool;

public var _HoverQCMChoix2:Bool;

public var _taillemotespace:Float;

public var _curfont:String;

public var _PersoFeel:String;

public var _pagecarnet:Float;

public var _recaplist:Array<Dynamic>;

public var _recap:String;

 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Interlocuteur", "_Interlocuteur");
_Interlocuteur = "";
nameMap.set("desc_perso", "_descperso");
_descperso = [];
nameMap.set("descc", "_descc");
_descc = "";
nameMap.set("NumDialogue", "_NumDialogue");
_NumDialogue = 0.0;
nameMap.set("descr_perso", "_descrperso");
_descrperso = [];
nameMap.set("positionSurX", "_positionSurX");
_positionSurX = 0.0;
nameMap.set("Word List", "_WordList");
_WordList = [];
nameMap.set("Current Line", "_CurrentLine");
_CurrentLine = 0.0;
nameMap.set("Line List", "_LineList");
_LineList = [];
nameMap.set("positionSurY", "_positionSurY");
_positionSurY = 0.0;
nameMap.set("Hover_QCM_Choix3", "_HoverQCMChoix3");
_HoverQCMChoix3 = false;
nameMap.set("Dialogue List", "_DialogueList");
_DialogueList = [];
nameMap.set("line lenght", "_linelenght");
_linelenght = 0.0;
nameMap.set("Hover_QCM_Choix1", "_HoverQCMChoix1");
_HoverQCMChoix1 = false;
nameMap.set("Hover_QCM_Choix2", "_HoverQCMChoix2");
_HoverQCMChoix2 = false;
nameMap.set("taille motespace", "_taillemotespace");
_taillemotespace = 0.0;
nameMap.set("cur_font", "_curfont");
_curfont = "";
nameMap.set("PersoFeel", "_PersoFeel");
_PersoFeel = "";
nameMap.set("page_carnet", "_pagecarnet");
_pagecarnet = 0.0;
nameMap.set("recap_list", "_recaplist");
_recaplist = [];
nameMap.set("recap", "_recap");
_recap = "";

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        scripts.SceneEvents_3._customBlock_reinitialisation_pour_nouvelle_scene();
        getActor(21).disableActorDrawing();
        getActor(22).disableActorDrawing();
        getActor(26).disableActorDrawing();
        _positionSurX = asNumber(getActor(18).getX());
propertyChanged("_positionSurX", _positionSurX);
        _positionSurY = asNumber(getActor(18).getY());
propertyChanged("_positionSurY", _positionSurY);
        getActor(21).setX(_positionSurX);
        getActor(21).setY(_positionSurY);
        getActor(20).setX(_positionSurX);
        getActor(20).setY(_positionSurY);
        getActor(19).setX(_positionSurX);
        getActor(19).setY(_positionSurY);
        _pagecarnet = asNumber(1);
propertyChanged("_pagecarnet", _pagecarnet);
        _NumDialogue = asNumber(0);
propertyChanged("_NumDialogue", _NumDialogue);
        _HoverQCMChoix2 = false;
propertyChanged("_HoverQCMChoix2", _HoverQCMChoix2);
        _HoverQCMChoix2 = false;
propertyChanged("_HoverQCMChoix2", _HoverQCMChoix2);
        _HoverQCMChoix1 = false;
propertyChanged("_HoverQCMChoix1", _HoverQCMChoix1);
        _linelenght = asNumber(0);
propertyChanged("_linelenght", _linelenght);
        _CurrentLine = asNumber(0);
propertyChanged("_CurrentLine", _CurrentLine);
    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if((Engine.engine.getGameAttribute("NumDialogue") <= Engine.engine.getGameAttribute("MaxDialogue")))
{
            if((0 < Engine.engine.getGameAttribute("ShowPrec")))
{
                g.setFont(getFont(2));
                g.drawString("" + Engine.engine.getGameAttribute("ShowPrec"), 1811, 884);
}

            if(Engine.engine.getGameAttribute("ShowChoice"))
{
                g.setFont(getFont(16));
                g.drawString("" + "Good cops", 1740, 460);
                g.setFont(getFont(19));
                g.drawString("" + "Bad cops", 1420, 460);
}

            scripts.SceneEvents_3._customBlock_gestion_emotion_anna_adulte(Engine.engine.getGameAttribute("PersoFeel"),getActor(19),getActor(20),getLastCreatedActor(),getActor(18),getActor(21));
            if((Engine.engine.getGameAttribute("ask") == "QCM_1"))
{
                Engine.engine.setGameAttribute("ShowNext", false);
                getActor(22).enableActorDrawing();
                g.setFont(getFont(26));
                g.drawString("" + "-It's the murderer first kill.", (getActor(22).getX() + 20), (getActor(22).getY() + 50));
                g.drawString("" + "-He is experienced .", (getActor(22).getX() + 20), (getActor(22).getY() + 80));
                g.drawString("" + "-He got lucky.", (getActor(22).getX() + 20), (getActor(22).getY() + 110));
                if(_HoverQCMChoix1)
{
                    g.fillColor = Utils.getColorRGB(0,0,0);
                    g.strokeSize = Std.int(5);
                    g.drawRect((getActor(22).getX() + 15), (getActor(22).getY() + 45), 600, 30);
}

                else if(_HoverQCMChoix2)
{
                    g.fillColor = Utils.getColorRGB(0,0,0);
                    g.strokeSize = Std.int(5);
                    g.drawRect((getActor(22).getX() + 15), (getActor(22).getY() + 75), 600, 30);
}

                else if(_HoverQCMChoix3)
{
                    g.fillColor = Utils.getColorRGB(0,0,0);
                    g.strokeSize = Std.int(5);
                    g.drawRect((getActor(22).getX() + 15), (getActor(22).getY() + 105), 600, 30);
}

}

            else
{
                Engine.engine.setGameAttribute("ShowChoice", false);
}

            if((Engine.engine.getGameAttribute("ask") == "schema1"))
{
                hideTileLayer(1, "" + "office_tab");
                getActor(26).enableActorDrawing();
                getActor(26).setAnimation("" + "1");
}

            else if((Engine.engine.getGameAttribute("ask") == "schema2"))
{
                getActor(26).enableActorDrawing();
                getActor(26).setAnimation("" + "2");
}

            else if((Engine.engine.getGameAttribute("ask") == "schema3"))
{
                getActor(26).enableActorDrawing();
                getActor(26).setAnimation("" + "3");
}

            else if((Engine.engine.getGameAttribute("ask") == "schema4"))
{
                getActor(26).enableActorDrawing();
                getActor(26).setAnimation("" + "4");
}

            else
{
                getActor(26).disableActorDrawing();
}

}

        else
{
            switchScene(GameModel.get().scenes.get(8).getID(), createFadeOut(1, Utils.getColorRGB(0,0,0)), createFadeIn(1, Utils.getColorRGB(0,0,0)));
}

}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(4), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        if((Engine.engine.getGameAttribute("ask") == "QCM_1"))
{
            playSound(getSound(156));
            Engine.engine.setGameAttribute("NumDialogue", (Engine.engine.getGameAttribute("NumDialogue") + 1));
            Engine.engine.getGameAttribute("LineList")[Std.int(Engine.engine.getGameAttribute("NumDialogue"))] = "Anna : I don't think so... : decu";
            Engine.engine.setGameAttribute("Perd1Pv", true);
            Engine.engine.setGameAttribute("ShowNext", false);
            Engine.engine.setGameAttribute("ShowPrec", 1);
            getActor(22).disableActorDrawing();
}

}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(5), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        if((Engine.engine.getGameAttribute("ask") == "QCM_1"))
{
            playSound(getSound(156));
            Engine.engine.setGameAttribute("NumDialogue", (Engine.engine.getGameAttribute("NumDialogue") + 1));
            Engine.engine.getGameAttribute("LineList")[Std.int(Engine.engine.getGameAttribute("NumDialogue"))] = "Theodore : With all this we can make the assumption that he is experienced.";
            Engine.engine.setGameAttribute("ShowNext", true);
            Engine.engine.setGameAttribute("ShowPrec", -1);
            getActor(22).disableActorDrawing();
}

}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        if((Engine.engine.getGameAttribute("ask") == "QCM_1"))
{
            playSound(getSound(156));
            Engine.engine.setGameAttribute("NumDialogue", (Engine.engine.getGameAttribute("NumDialogue") + 1));
            Engine.engine.getGameAttribute("LineList")[Std.int(Engine.engine.getGameAttribute("NumDialogue"))] = "Anna : I don't think so... : decu";
            Engine.engine.setGameAttribute("Perd1Pv", true);
            Engine.engine.setGameAttribute("ShowNext", false);
            Engine.engine.setGameAttribute("ShowPrec", 1);
            getActor(22).disableActorDrawing();
}

}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(4), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 1 == mouseState)
{
        _HoverQCMChoix1 = true;
propertyChanged("_HoverQCMChoix1", _HoverQCMChoix1);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(5), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 1 == mouseState)
{
        _HoverQCMChoix2 = true;
propertyChanged("_HoverQCMChoix2", _HoverQCMChoix2);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 1 == mouseState)
{
        _HoverQCMChoix3 = true;
propertyChanged("_HoverQCMChoix3", _HoverQCMChoix3);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(4), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && -1 == mouseState)
{
        _HoverQCMChoix1 = false;
propertyChanged("_HoverQCMChoix1", _HoverQCMChoix1);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(5), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && -1 == mouseState)
{
        _HoverQCMChoix2 = false;
propertyChanged("_HoverQCMChoix2", _HoverQCMChoix2);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && -1 == mouseState)
{
        _HoverQCMChoix3 = false;
propertyChanged("_HoverQCMChoix3", _HoverQCMChoix3);
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}