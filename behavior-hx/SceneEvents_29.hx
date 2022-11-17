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



class SceneEvents_29 extends SceneScript
{
	
public var _Dialogue:String;

public var _Interlocuteur:String;

public var _Time:Float;

public var _NumDialogue:Float;

public var _WordList:Array<Dynamic>;

public var _NewText:String;

public var _CurrentLine:Float;

public var _LineList:Array<Dynamic>;

public var _MaxDialogue:Float;

public var _Ton:String;

public var _win:Bool;

public var _ii:Float;

public var _DialogueList:Array<Dynamic>;

public var _linelenght:Float;

public var _health:Float;

public var _C1:Bool;

public var _Q1:Bool;

public var _ShowNext:Bool;

public var _Q2:Bool;

public var _Q3:Bool;

public var _carnethide:Bool;

public var _johnsonfeel:Bool;

public var _ShowChoice:Bool;

public var _pagecarnet:Float;

public var _PersoFeel:String;

public var _ShowPrec:Float;

public var _ShowEvidences:Bool;

public var _recaplist:Array<Dynamic>;

public var _recap:String;

public var _ask:String;

public var _Perd1PV:Bool;

public var _jj:Float;

public var _Choix1:Bool;

public var _descperso:Array<Dynamic>;

public var _descc:String;

public var _descrperso:Array<Dynamic>;

public var _positionSurX:Float;

public var _Choix2:Bool;

public var _Choix3:Bool;

public var _QCM1:Bool;

public var _QCM2:Bool;

public var _positionSurY:Float;

public var _descperso2:String;

public var _HoverQCMChoix3:Bool;

public var _Perd1karma:Bool;

public var _HoverQCMChoix1:Bool;

public var _HoverQCMChoix2:Bool;

public var _taillemotespace:Float;

public var _curfont:String;

 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Dialogue", "_Dialogue");
_Dialogue = "";
nameMap.set("Interlocuteur", "_Interlocuteur");
_Interlocuteur = "";
nameMap.set("Time", "_Time");
_Time = 0.0;
nameMap.set("NumDialogue", "_NumDialogue");
_NumDialogue = 0.0;
nameMap.set("Word List", "_WordList");
_WordList = [];
nameMap.set("New Text", "_NewText");
_NewText = "";
nameMap.set("Current Line", "_CurrentLine");
_CurrentLine = 0.0;
nameMap.set("Line List", "_LineList");
_LineList = [];
nameMap.set("MaxDialogue", "_MaxDialogue");
_MaxDialogue = 0.0;
nameMap.set("Ton", "_Ton");
_Ton = "";
nameMap.set("win", "_win");
_win = false;
nameMap.set("ii", "_ii");
_ii = 0.0;
nameMap.set("Dialogue List", "_DialogueList");
_DialogueList = [];
nameMap.set("line lenght", "_linelenght");
_linelenght = 0.0;
nameMap.set("health", "_health");
_health = 0.0;
nameMap.set("C1", "_C1");
_C1 = false;
nameMap.set("Q1", "_Q1");
_Q1 = false;
nameMap.set("ShowNext", "_ShowNext");
_ShowNext = false;
nameMap.set("Q2", "_Q2");
_Q2 = false;
nameMap.set("Q3", "_Q3");
_Q3 = false;
nameMap.set("carnet_hide", "_carnethide");
_carnethide = false;
nameMap.set("johnson_feel", "_johnsonfeel");
_johnsonfeel = false;
nameMap.set("ShowChoice", "_ShowChoice");
_ShowChoice = false;
nameMap.set("page_carnet", "_pagecarnet");
_pagecarnet = 0.0;
nameMap.set("PersoFeel", "_PersoFeel");
_PersoFeel = "";
nameMap.set("ShowPrec", "_ShowPrec");
_ShowPrec = 0.0;
nameMap.set("ShowEvidences", "_ShowEvidences");
_ShowEvidences = false;
nameMap.set("recap_list", "_recaplist");
_recaplist = [];
nameMap.set("recap", "_recap");
_recap = "";
nameMap.set("ask", "_ask");
_ask = "";
nameMap.set("Perd1PV", "_Perd1PV");
_Perd1PV = false;
nameMap.set("jj", "_jj");
_jj = 0.0;
nameMap.set("Choix1", "_Choix1");
_Choix1 = false;
nameMap.set("desc_perso", "_descperso");
_descperso = [];
nameMap.set("descc", "_descc");
_descc = "";
nameMap.set("descr_perso", "_descrperso");
_descrperso = [];
nameMap.set("positionSurX", "_positionSurX");
_positionSurX = 0.0;
nameMap.set("Choix2", "_Choix2");
_Choix2 = false;
nameMap.set("Choix3", "_Choix3");
_Choix3 = false;
nameMap.set("QCM_1", "_QCM1");
_QCM1 = false;
nameMap.set("QCM_2", "_QCM2");
_QCM2 = false;
nameMap.set("positionSurY", "_positionSurY");
_positionSurY = 0.0;
nameMap.set("desc_perso 2", "_descperso2");
_descperso2 = "";
nameMap.set("Hover_QCM_Choix3", "_HoverQCMChoix3");
_HoverQCMChoix3 = false;
nameMap.set("Perd1karma", "_Perd1karma");
_Perd1karma = false;
nameMap.set("Hover_QCM_Choix1", "_HoverQCMChoix1");
_HoverQCMChoix1 = false;
nameMap.set("Hover_QCM_Choix2", "_HoverQCMChoix2");
_HoverQCMChoix2 = false;
nameMap.set("taille motespace", "_taillemotespace");
_taillemotespace = 0.0;
nameMap.set("cur_font", "_curfont");
_curfont = "";

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        scripts.SceneEvents_3._customBlock_reinitialisation_pour_nouvelle_scene();
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(25),Engine.engine.getGameAttribute("pos_vie_x"),Engine.engine.getGameAttribute("pos_vie_y"));
        getActor(24).setY(Engine.engine.getGameAttribute("pos_fleche_karma_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(23),Engine.engine.getGameAttribute("pos_karma_bar_x"),Engine.engine.getGameAttribute("pos_karma_bar_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(27),Engine.engine.getGameAttribute("pos_fleche_x"),Engine.engine.getGameAttribute("pos_fleche_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(27),Engine.engine.getGameAttribute("pos_points_x"),Engine.engine.getGameAttribute("pos_points_y"));
    
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

            if(Engine.engine.getGameAttribute("ShowChoice"))
{
                g.setFont(getFont(16));
                g.drawString("" + "Good cops", 1740, 460);
                g.setFont(getFont(19));
                g.drawString("" + "Bad cops", 1420, 460);
}

}

        else
{
            switchScene(GameModel.get().scenes.get(4).getID(), createFadeOut(1, Utils.getColorRGB(0,0,0)), createFadeIn(1, Utils.getColorRGB(0,0,0)));
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}