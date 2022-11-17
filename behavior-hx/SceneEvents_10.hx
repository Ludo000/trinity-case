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



class SceneEvents_10 extends SceneScript
{
	
public var _Dialogue:String;

public var _Interlocuteur:String;

public var _WordList:Array<Dynamic>;

public var _CurrentLine:Float;

public var _LineList:Array<Dynamic>;

public var _DialogueList:Array<Dynamic>;

public var _linelenght:Float;

public var _health:Float;

public var _carnethide:Bool;

public var _Q3:Bool;

public var _ShowChoice:Bool;

public var _johnsonfeel:Bool;

public var _PersoFeel:String;

public var _pagecarnet:Float;

public var _ShowEvidences:Bool;

public var _ShowPrec:Float;

public var _recap:String;

public var _recaplist:Array<Dynamic>;

public var _Perd1PV:Bool;

public var _ask:String;

public var _descperso:Array<Dynamic>;

public var _descc:String;

public var _jj:Float;

public var _Choix1:Bool;

public var _Choix2:Bool;

public var _Choix3:Bool;

public var _descrperso:Array<Dynamic>;

public var _positionSurX:Float;

public var _positionSurY:Float;

public var _descperso2:String;

public var _QCM1:Bool;

public var _QCM2:Bool;

public var _HoverQCMChoix1:Bool;

public var _HoverQCMChoix2:Bool;

public var _HoverQCMChoix3:Bool;

public var _hoverpreuve1:Bool;

public var _hoverpreuve2:Bool;

public var _hoverpreuve3:Bool;

public var _Perd1karma:Bool;

public var _HoverQCMChoix4:Bool;

public var _HoverQCMChoix5:Bool;

public var _curfont:String;

public var _taillemotespace:Float;

 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Dialogue", "_Dialogue");
_Dialogue = "";
nameMap.set("Interlocuteur", "_Interlocuteur");
_Interlocuteur = "";
nameMap.set("Word List", "_WordList");
_WordList = [];
nameMap.set("Current Line", "_CurrentLine");
_CurrentLine = 0.0;
nameMap.set("Line List", "_LineList");
_LineList = [];
nameMap.set("Dialogue List", "_DialogueList");
_DialogueList = [];
nameMap.set("line lenght", "_linelenght");
_linelenght = 0.0;
nameMap.set("health", "_health");
_health = 0.0;
nameMap.set("carnet_hide", "_carnethide");
_carnethide = false;
nameMap.set("Q3", "_Q3");
_Q3 = false;
nameMap.set("ShowChoice", "_ShowChoice");
_ShowChoice = false;
nameMap.set("johnson_feel", "_johnsonfeel");
_johnsonfeel = false;
nameMap.set("PersoFeel", "_PersoFeel");
_PersoFeel = "";
nameMap.set("page_carnet", "_pagecarnet");
_pagecarnet = 0.0;
nameMap.set("ShowEvidences", "_ShowEvidences");
_ShowEvidences = false;
nameMap.set("ShowPrec", "_ShowPrec");
_ShowPrec = 0.0;
nameMap.set("recap", "_recap");
_recap = "";
nameMap.set("recap_list", "_recaplist");
_recaplist = [];
nameMap.set("Perd1PV", "_Perd1PV");
_Perd1PV = false;
nameMap.set("ask", "_ask");
_ask = "";
nameMap.set("desc_perso", "_descperso");
_descperso = [];
nameMap.set("descc", "_descc");
_descc = "";
nameMap.set("jj", "_jj");
_jj = 0.0;
nameMap.set("Choix1", "_Choix1");
_Choix1 = false;
nameMap.set("Choix2", "_Choix2");
_Choix2 = false;
nameMap.set("Choix3", "_Choix3");
_Choix3 = false;
nameMap.set("descr_perso", "_descrperso");
_descrperso = [];
nameMap.set("positionSurX", "_positionSurX");
_positionSurX = 0.0;
nameMap.set("positionSurY", "_positionSurY");
_positionSurY = 0.0;
nameMap.set("desc_perso 2", "_descperso2");
_descperso2 = "";
nameMap.set("QCM_1", "_QCM1");
_QCM1 = false;
nameMap.set("QCM_2", "_QCM2");
_QCM2 = false;
nameMap.set("Hover_QCM_Choix1", "_HoverQCMChoix1");
_HoverQCMChoix1 = false;
nameMap.set("Hover_QCM_Choix2", "_HoverQCMChoix2");
_HoverQCMChoix2 = false;
nameMap.set("Hover_QCM_Choix3", "_HoverQCMChoix3");
_HoverQCMChoix3 = false;
nameMap.set("hover preuve 1", "_hoverpreuve1");
_hoverpreuve1 = false;
nameMap.set("hover preuve 2", "_hoverpreuve2");
_hoverpreuve2 = false;
nameMap.set("hover preuve 3", "_hoverpreuve3");
_hoverpreuve3 = false;
nameMap.set("Perd1karma", "_Perd1karma");
_Perd1karma = false;
nameMap.set("Hover_QCM_Choix4", "_HoverQCMChoix4");
_HoverQCMChoix4 = false;
nameMap.set("Hover_QCM_Choix5", "_HoverQCMChoix5");
_HoverQCMChoix5 = false;
nameMap.set("cur_font", "_curfont");
_curfont = "";
nameMap.set("taille motespace", "_taillemotespace");
_taillemotespace = 0.0;

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        scripts.SceneEvents_3._customBlock_reinitialisation_pour_nouvelle_scene();
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(25),Engine.engine.getGameAttribute("pos_vie_x"),Engine.engine.getGameAttribute("pos_vie_y"));
        getActor(24).setY(Engine.engine.getGameAttribute("pos_fleche_karma_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(23),Engine.engine.getGameAttribute("pos_karma_bar_x"),Engine.engine.getGameAttribute("pos_karma_bar_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(6),Engine.engine.getGameAttribute("pos_choix_gauche_x"),Engine.engine.getGameAttribute("pos_choix_gauche_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(10),Engine.engine.getGameAttribute("pos_choix_centre_x"),Engine.engine.getGameAttribute("pos_choix_centre_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(7),Engine.engine.getGameAttribute("pos_choix_droite_x"),Engine.engine.getGameAttribute("pos_choix_droite_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(4),Engine.engine.getGameAttribute("pos_fleche_x"),Engine.engine.getGameAttribute("pos_fleche_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(3),Engine.engine.getGameAttribute("pos_points_x"),Engine.engine.getGameAttribute("pos_points_y"));
        getActor(17).disableActorDrawing();
        getActor(21).disableActorDrawing();
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
        _QCM2 = false;
propertyChanged("_QCM2", _QCM2);
        _QCM1 = false;
propertyChanged("_QCM1", _QCM1);
        _HoverQCMChoix2 = false;
propertyChanged("_HoverQCMChoix2", _HoverQCMChoix2);
        _HoverQCMChoix2 = false;
propertyChanged("_HoverQCMChoix2", _HoverQCMChoix2);
        _HoverQCMChoix1 = false;
propertyChanged("_HoverQCMChoix1", _HoverQCMChoix1);
        _HoverQCMChoix4 = false;
propertyChanged("_HoverQCMChoix4", _HoverQCMChoix4);
        _HoverQCMChoix5 = false;
propertyChanged("_HoverQCMChoix5", _HoverQCMChoix5);
        _linelenght = asNumber(0);
propertyChanged("_linelenght", _linelenght);
        _CurrentLine = asNumber(0);
propertyChanged("_CurrentLine", _CurrentLine);
    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        getActor(24).setX((Engine.engine.getGameAttribute("pos_fleche_karma") + Engine.engine.getGameAttribute("karma")));
        if((Engine.engine.getGameAttribute("NumDialogue") <= Engine.engine.getGameAttribute("MaxDialogue")))
{
            if((0 < Engine.engine.getGameAttribute("ShowPrec")))
{
                g.setFont(getFont(2));
                g.drawString("" + Engine.engine.getGameAttribute("ShowPrec"), 1811, 884);
}

            scripts.SceneEvents_3._customBlock_gestion_emotion_anna_adulte(Engine.engine.getGameAttribute("PersoFeel"),getActor(19),getActor(20),getLastCreatedActor(),getActor(18),getActor(21));
            if((Engine.engine.getGameAttribute("ask") == "QCM_1"))
{
                Engine.engine.setGameAttribute("ShowNext", false);
                getActor(26).enableActorDrawing();
                if(_HoverQCMChoix1)
{
                    g.fillColor = Utils.getColorRGB(0,0,0);
                    g.strokeSize = Std.int(5);
                    g.drawRect(getRegion(5).getX(), getRegion(5).getY(), getRegion(5).getWidth(), getRegion(5).getHeight());
}

                else if(_HoverQCMChoix2)
{
                    g.fillColor = Utils.getColorRGB(0,0,0);
                    g.strokeSize = Std.int(5);
                    g.drawRect(getRegion(6).getX(), getRegion(6).getY(), getRegion(6).getWidth(), getRegion(6).getHeight());
}

                else if(_HoverQCMChoix3)
{
                    g.fillColor = Utils.getColorRGB(0,0,0);
                    g.strokeSize = Std.int(5);
                    g.drawRect(getRegion(7).getX(), getRegion(7).getY(), getRegion(7).getWidth(), getRegion(7).getHeight());
}

                else if(_HoverQCMChoix4)
{
                    g.fillColor = Utils.getColorRGB(0,0,0);
                    g.strokeSize = Std.int(5);
                    g.drawRect(getRegion(8).getX(), getRegion(8).getY(), getRegion(8).getWidth(), getRegion(8).getHeight());
}

                else if(_HoverQCMChoix5)
{
                    g.fillColor = Utils.getColorRGB(0,0,0);
                    g.strokeSize = Std.int(5);
                    g.drawRect(getRegion(9).getX(), getRegion(9).getY(), getRegion(9).getWidth(), getRegion(9).getHeight());
}

}

            else
{
                Engine.engine.setGameAttribute("ShowChoice", false);
                getActor(17).disableActorDrawing();
                getActor(26).disableActorDrawing();
}

}

        else
{
            switchScene(GameModel.get().scenes.get(32).getID(), createFadeOut(1, Utils.getColorRGB(0,0,0)), createFadeIn(1, Utils.getColorRGB(0,0,0)));
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
            playSound(getSound(224));
            Engine.engine.getGameAttribute("LineList")[Std.int((Engine.engine.getGameAttribute("NumDialogue") + 1))] = "Theodore:I don't see other place, it's probably here.";
            getActor(26).disableActorDrawing();
            Engine.engine.setGameAttribute("ShowPrec", -1);
            _QCM1 = true;
propertyChanged("_QCM1", _QCM1);
            Engine.engine.setGameAttribute("NumDialogue", (Engine.engine.getGameAttribute("NumDialogue") + 1));
            Engine.engine.setGameAttribute("ShowNext", true);
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
            playSound(getSound(224));
            Engine.engine.getGameAttribute("LineList")[Std.int((Engine.engine.getGameAttribute("NumDialogue") + 1))] = "Anna : It's not even near the railway, it can't be that ! : decu";
            Engine.engine.setGameAttribute("Perd1Pv", true);
            Engine.engine.setGameAttribute("ShowNext", false);
            Engine.engine.setGameAttribute("ShowPrec", 1);
            getActor(26).disableActorDrawing();
            Engine.engine.setGameAttribute("NumDialogue", (Engine.engine.getGameAttribute("NumDialogue") + 1));
}

}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(7), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        if((Engine.engine.getGameAttribute("ask") == "QCM_1"))
{
            playSound(getSound(224));
            Engine.engine.getGameAttribute("LineList")[Std.int((Engine.engine.getGameAttribute("NumDialogue") + 1))] = "Anna : He don't talk about a road, it can't be that ! : decu";
            Engine.engine.setGameAttribute("Perd1Pv", true);
            Engine.engine.setGameAttribute("ShowNext", false);
            Engine.engine.setGameAttribute("ShowPrec", 1);
            getActor(26).disableActorDrawing();
            Engine.engine.setGameAttribute("NumDialogue", (Engine.engine.getGameAttribute("NumDialogue") + 1));
}

}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(8), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        if((Engine.engine.getGameAttribute("ask") == "QCM_1"))
{
            Engine.engine.getGameAttribute("LineList")[Std.int((Engine.engine.getGameAttribute("NumDialogue") + 1))] = "Anna : It's not even near the railway, it can't be that ! : decu";
            Engine.engine.setGameAttribute("Perd1Pv", true);
            Engine.engine.setGameAttribute("ShowNext", false);
            Engine.engine.setGameAttribute("ShowPrec", 1);
            getActor(26).disableActorDrawing();
            Engine.engine.setGameAttribute("NumDialogue", (Engine.engine.getGameAttribute("NumDialogue") + 1));
            playSound(getSound(224));
}

}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(9), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        if((Engine.engine.getGameAttribute("ask") == "QCM_1"))
{
            playSound(getSound(224));
            Engine.engine.getGameAttribute("LineList")[Std.int((Engine.engine.getGameAttribute("NumDialogue") + 1))] = "Anna : He don't talk about a river, it can't be that ! : decu";
            Engine.engine.setGameAttribute("Perd1Pv", true);
            Engine.engine.setGameAttribute("ShowNext", false);
            Engine.engine.setGameAttribute("ShowPrec", 1);
            getActor(26).disableActorDrawing();
            Engine.engine.setGameAttribute("NumDialogue", (Engine.engine.getGameAttribute("NumDialogue") + 1));
}

}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(5), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 1 == mouseState)
{
        _HoverQCMChoix1 = true;
propertyChanged("_HoverQCMChoix1", _HoverQCMChoix1);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 1 == mouseState)
{
        _HoverQCMChoix2 = true;
propertyChanged("_HoverQCMChoix2", _HoverQCMChoix2);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(7), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 1 == mouseState)
{
        _HoverQCMChoix3 = true;
propertyChanged("_HoverQCMChoix3", _HoverQCMChoix3);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(8), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 1 == mouseState)
{
        _HoverQCMChoix4 = true;
propertyChanged("_HoverQCMChoix4", _HoverQCMChoix4);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(9), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 1 == mouseState)
{
        _HoverQCMChoix5 = true;
propertyChanged("_HoverQCMChoix5", _HoverQCMChoix5);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(5), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && -1 == mouseState)
{
        _HoverQCMChoix1 = false;
propertyChanged("_HoverQCMChoix1", _HoverQCMChoix1);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && -1 == mouseState)
{
        _HoverQCMChoix2 = false;
propertyChanged("_HoverQCMChoix2", _HoverQCMChoix2);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(7), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && -1 == mouseState)
{
        _HoverQCMChoix3 = false;
propertyChanged("_HoverQCMChoix3", _HoverQCMChoix3);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(8), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && -1 == mouseState)
{
        _HoverQCMChoix4 = false;
propertyChanged("_HoverQCMChoix4", _HoverQCMChoix4);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(9), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && -1 == mouseState)
{
        _HoverQCMChoix5 = false;
propertyChanged("_HoverQCMChoix5", _HoverQCMChoix5);
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}