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
import box2D.collision.shapes.B2Shape;

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



class SceneEvents_4 extends SceneScript
{
	public var _Dialogue:String;
	public var _Interlocuteur:String;
	public var _Time:Float;
	public var _NumDialogue:Float;
	public var _WordList:Array<Dynamic>;
	public var _descperso:String;
	public var _CurrentLine:Float;
	public var _LineList:Array<Dynamic>;
	public var _MaxDialogue:Float;
	public var _Ton:String;
	public var _win:Bool;
	public var _ii:Float;
	public var _DialogueList:Array<Dynamic>;
	public var _linelenght:Float;
	public var _Q1:Bool;
	public var _Choix1:Bool;
	public var _Q2:Bool;
	public var _ShowNext:Bool;
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
	public var _descrperso:Array<Dynamic>;
	public var _Choix2:Bool;
	public var _Choix3:Bool;
	public var _positionSurX:Float;
	public var _positionSurY:Float;
	public var _C1:Bool;
	public var _HoverQCMChoix1:Bool;
	public var _HoverQCMChoix2:Bool;
	public var _QCM1:Bool;
	public var _HoverQCMChoix3:Bool;
	public var _QCM2:Bool;
	public var _hoverpreuve1:Bool;
	public var _hoverpreuve2:Bool;
	public var _hoverpreuve3:Bool;
	public var _Perd1karma:Bool;
	public var _curfont:String;
	public var _taillemotespace:Float;
	
	
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
		nameMap.set("desc_perso", "_descperso");
		_descperso = "";
		nameMap.set("Current Line", "_CurrentLine");
		_CurrentLine = 0.0;
		nameMap.set("Line List", "_LineList");
		nameMap.set("MaxDialogue", "_MaxDialogue");
		_MaxDialogue = 0.0;
		nameMap.set("Ton", "_Ton");
		_Ton = "";
		nameMap.set("win", "_win");
		_win = false;
		nameMap.set("ii", "_ii");
		_ii = 0.0;
		nameMap.set("Dialogue List", "_DialogueList");
		nameMap.set("line lenght", "_linelenght");
		_linelenght = 0.0;
		nameMap.set("Q1", "_Q1");
		_Q1 = false;
		nameMap.set("Choix1", "_Choix1");
		_Choix1 = false;
		nameMap.set("Q2", "_Q2");
		_Q2 = false;
		nameMap.set("ShowNext", "_ShowNext");
		_ShowNext = false;
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
		nameMap.set("Perd1PV", "_Perd1PV");
		_Perd1PV = false;
		nameMap.set("ask", "_ask");
		_ask = "";
		nameMap.set("descr_perso", "_descrperso");
		nameMap.set("Choix2", "_Choix2");
		_Choix2 = false;
		nameMap.set("Choix3", "_Choix3");
		_Choix3 = false;
		nameMap.set("positionSurX", "_positionSurX");
		_positionSurX = 0.0;
		nameMap.set("positionSurY", "_positionSurY");
		_positionSurY = 0.0;
		nameMap.set("C1", "_C1");
		_C1 = false;
		nameMap.set("Hover_QCM_Choix1", "_HoverQCMChoix1");
		_HoverQCMChoix1 = false;
		nameMap.set("Hover_QCM_Choix2", "_HoverQCMChoix2");
		_HoverQCMChoix2 = false;
		nameMap.set("QCM_1", "_QCM1");
		_QCM1 = false;
		nameMap.set("Hover_QCM_Choix3", "_HoverQCMChoix3");
		_HoverQCMChoix3 = false;
		nameMap.set("QCM_2", "_QCM2");
		_QCM2 = false;
		nameMap.set("hover preuve 1", "_hoverpreuve1");
		_hoverpreuve1 = false;
		nameMap.set("hover preuve 2", "_hoverpreuve2");
		_hoverpreuve2 = false;
		nameMap.set("hover preuve 3", "_hoverpreuve3");
		_hoverpreuve3 = false;
		nameMap.set("Perd1karma", "_Perd1karma");
		_Perd1karma = false;
		nameMap.set("cur_font", "_curfont");
		_curfont = "";
		nameMap.set("taille motespace", "_taillemotespace");
		_taillemotespace = 0.0;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		Engine.engine.setGameAttribute("health", 10);
		Engine.engine.setGameAttribute("karma", 0);
		scripts.SceneEvents_3._customBlock_reinitialisation_pour_nouvelle_scene();
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(33), (Engine.engine.getGameAttribute("pos_vie_x") : Float), (Engine.engine.getGameAttribute("pos_vie_y") : Float));
		getActor(32).setY((Engine.engine.getGameAttribute("pos_fleche_karma_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(31), (Engine.engine.getGameAttribute("pos_karma_bar_x") : Float), (Engine.engine.getGameAttribute("pos_karma_bar_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(6), (Engine.engine.getGameAttribute("pos_choix_gauche_x") : Float), (Engine.engine.getGameAttribute("pos_choix_gauche_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(10), (Engine.engine.getGameAttribute("pos_choix_centre_x") : Float), (Engine.engine.getGameAttribute("pos_choix_centre_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(7), (Engine.engine.getGameAttribute("pos_choix_droite_x") : Float), (Engine.engine.getGameAttribute("pos_choix_droite_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(4), (Engine.engine.getGameAttribute("pos_fleche_x") : Float), (Engine.engine.getGameAttribute("pos_fleche_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(3), (Engine.engine.getGameAttribute("pos_points_x") : Float), (Engine.engine.getGameAttribute("pos_points_y") : Float));
		getActor(30).disableActorDrawing();
		getActor(29).disableActorDrawing();
		getActor(28).disableActorDrawing();
		getActor(26).disableActorDrawing();
		_positionSurX = getActor(26).getX();
		_positionSurY = getActor(26).getY();
		getActor(28).setX(_positionSurX);
		getActor(28).setY(_positionSurY);
		getActor(29).setX(_positionSurX);
		getActor(29).setY(_positionSurY);
		getActor(30).setX(_positionSurX);
		getActor(30).setY(_positionSurY);
		_Choix1 = false;
		_Choix2 = false;
		_Choix3 = false;
		_Perd1PV = false;
		_linelenght = 0;
		_CurrentLine = 0;
		_recap = "There is no content here yet.";
		_descperso = "<b> Anna </b> <br> She's my friend.";
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((Engine.engine.getGameAttribute("NumDialogue") : Float) <= (Engine.engine.getGameAttribute("MaxDialogue") : Float)))
				{
					if((0 < (Engine.engine.getGameAttribute("ShowPrec") : Float)))
					{
						g.setFont(getFont(2));
						g.drawString("" + (Engine.engine.getGameAttribute("ShowPrec") : Float), 1811, 884);
					}
					scripts.SceneEvents_3._customBlock_gestion_emotion_anna_adulte((Engine.engine.getGameAttribute("PersoFeel") : String), getActor(28), getActor(29), getLastCreatedActor(), getActor(26), getActor(30));
				}
				else
				{
					switchScene(GameModel.get().scenes.get(5).getID(), createFadeOut(1, Utils.getColorRGB(0,0,0)), createFadeIn(1, Utils.getColorRGB(0,0,0)));
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}