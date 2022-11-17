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



class ActorEvents_85 extends ActorScript
{          	
	
public var _DialogueList:Array<Dynamic>;

public var _LineList:Array<Dynamic>;

public var _WordList:Array<Dynamic>;

public var _PersoFeel:String;

public var _Interlocuteur:String;

public var _Choix1:Bool;

public var _Choix2:Bool;

public var _Choix3:Bool;

public var _linelenght:Float;

public var _CurrentLine:Float;

public var _descrperso:Array<Dynamic>;

public var _descperso:String;

public var _hoverpreuve1:Bool;

public var _hoverpreuve2:Bool;

public var _hoverpreuve3:Bool;

public var _recap:String;

public var _recaplist:Array<Dynamic>;

public var _ask:String;

public var _pagecarnet:Float;

public var _Q2:Bool;

public var _Q1:Bool;

public var _carnethide:Bool;

public var _Q3:Bool;

public var _ShowNext:Bool;

public var _ShowEvidences:Bool;

public var _ShowPrec:Float;

public var _NumDialogue:Float;

public var _win:Bool;

public var _Ton:String;

public var _ShowChoice:Bool;

public var _Perd1PV:Bool;

public var _Perd1karma:Bool;

 
 	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
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
nameMap.set("Choix1", "_Choix1");
_Choix1 = false;
nameMap.set("Choix2", "_Choix2");
_Choix2 = false;
nameMap.set("Choix3", "_Choix3");
_Choix3 = false;
nameMap.set("line lenght", "_linelenght");
_linelenght = 0.0;
nameMap.set("Current Line", "_CurrentLine");
_CurrentLine = 0.0;
nameMap.set("descr_perso", "_descrperso");
_descrperso = [];
nameMap.set("desc_perso", "_descperso");
_descperso = "";
nameMap.set("hover preuve 1", "_hoverpreuve1");
_hoverpreuve1 = false;
nameMap.set("hover preuve 2", "_hoverpreuve2");
_hoverpreuve2 = false;
nameMap.set("hover preuve 3", "_hoverpreuve3");
_hoverpreuve3 = false;
nameMap.set("recap", "_recap");
_recap = "";
nameMap.set("recap_list", "_recaplist");
_recaplist = [];
nameMap.set("ask", "_ask");
_ask = "";
nameMap.set("page_carnet", "_pagecarnet");
_pagecarnet = 0.0;
nameMap.set("Q2", "_Q2");
_Q2 = false;
nameMap.set("Q1", "_Q1");
_Q1 = false;
nameMap.set("carnet_hide", "_carnethide");
_carnethide = false;
nameMap.set("Q3", "_Q3");
_Q3 = false;
nameMap.set("ShowNext", "_ShowNext");
_ShowNext = false;
nameMap.set("ShowEvidences", "_ShowEvidences");
_ShowEvidences = false;
nameMap.set("ShowPrec", "_ShowPrec");
_ShowPrec = 0.0;
nameMap.set("NumDialogue", "_NumDialogue");
_NumDialogue = 0.0;
nameMap.set("win", "_win");
_win = false;
nameMap.set("Ton", "_Ton");
_Ton = "";
nameMap.set("ShowChoice", "_ShowChoice");
_ShowChoice = false;
nameMap.set("Perd1PV", "_Perd1PV");
_Perd1PV = false;
nameMap.set("Perd1karma", "_Perd1karma");
_Perd1karma = false;

	}
	
	override public function init()
	{
		    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if((Engine.engine.getGameAttribute("karma") < -500))
{
            Engine.engine.setGameAttribute("karma", -500);
}

        else if((Engine.engine.getGameAttribute("karma") > 500))
{
            Engine.engine.setGameAttribute("karma", 500);
}

        actor.setX((Engine.engine.getGameAttribute("pos_fleche_karma") + Engine.engine.getGameAttribute("karma")));
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}