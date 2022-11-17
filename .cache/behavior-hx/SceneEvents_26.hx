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



class SceneEvents_26 extends SceneScript
{
	public var _Dialogue:String;
	public var _Interlocuteur:String;
	public var _Time:Float;
	public var _NumDialogue:Float;
	public var _WordList:Array<Dynamic>;
	public var _NewText:String;
	public var _CurrentLine:Float;
	public var _MaxDialogue:Float;
	public var _Ton:String;
	public var _win:Bool;
	public var _ii:Float;
	public var _DialogueList:Array<Dynamic>;
	public var _linelenght:Float;
	public var _health:Float;
	public var _Q1:Bool;
	public var _C1:Bool;
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
	public var _Perd1karma:Bool;
	public var _curfont:String;
	public var _taillemotespace:Float;
	public var _HoverQCMChoix4:Bool;
	public var _shotonce:Bool;
	
	
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
		nameMap.set("New Text", "_NewText");
		_NewText = "";
		nameMap.set("Current Line", "_CurrentLine");
		_CurrentLine = 0.0;
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
		nameMap.set("health", "_health");
		_health = 0.0;
		nameMap.set("Q1", "_Q1");
		_Q1 = false;
		nameMap.set("C1", "_C1");
		_C1 = false;
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
		nameMap.set("desc_perso", "_descperso");
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
		nameMap.set("Perd1karma", "_Perd1karma");
		_Perd1karma = false;
		nameMap.set("cur_font", "_curfont");
		_curfont = "";
		nameMap.set("taille motespace", "_taillemotespace");
		_taillemotespace = 0.0;
		nameMap.set("Hover_QCM_Choix4", "_HoverQCMChoix4");
		_HoverQCMChoix4 = false;
		nameMap.set("shot_once", "_shotonce");
		_shotonce = false;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		scripts.SceneEvents_3._customBlock_reinitialisation_pour_nouvelle_scene();
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(25), (Engine.engine.getGameAttribute("pos_vie_x") : Float), (Engine.engine.getGameAttribute("pos_vie_y") : Float));
		getActor(24).setY((Engine.engine.getGameAttribute("pos_fleche_karma_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(23), (Engine.engine.getGameAttribute("pos_karma_bar_x") : Float), (Engine.engine.getGameAttribute("pos_karma_bar_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(27), (Engine.engine.getGameAttribute("pos_fleche_x") : Float), (Engine.engine.getGameAttribute("pos_fleche_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(27), (Engine.engine.getGameAttribute("pos_points_x") : Float), (Engine.engine.getGameAttribute("pos_points_y") : Float));
		showTileLayer(engine.getLayerByName("showndown"));
		_positionSurX = getActor(30).getX();
		_positionSurY = getActor(30).getY();
		getActor(31).setX(_positionSurX);
		getActor(31).setY(_positionSurY);
		getActor(32).setX(_positionSurX);
		getActor(32).setY(_positionSurY);
		getActor(33).setX(_positionSurX);
		getActor(33).setY(_positionSurY);
		_shotonce = false;
		getActor(33).disableActorDrawing();
		getActor(32).disableActorDrawing();
		getActor(30).disableActorDrawing();
		getActor(31).disableActorDrawing();
		getActor(28).disableActorDrawing();
		getActor(29).disableActorDrawing();
		if(((Engine.engine.getGameAttribute("karma") : Float) > 100))
		{
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Anna:..!");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:No !");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("himself :'FUMP' : : : son_shot");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:Ughh.");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Anna:Theodore !");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:...!:colere");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:Next time I won't miss.");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:Ughhh... wait...");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:What do you want now ?:normal");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:She's...innocent... don't kill her.");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:Don't worry innocent or not I don't care.");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("himself:'BLAM' : : : son_shot");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:Ugh...Who.. : : shot ");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Arthur:I'm sorry Blanche but I can let you do that. : : pula");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Arthur:I'm sorry Blanche but I can let you do that.");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:Haha 'cough' 'cough' you...");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Arthur:We were kid, you can't blame him for things he did fifteen years ago !");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche: I..can't...forgive...'cough'");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Arthur:I know Blanche, I know.");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Arthur: I'm sorry.");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:..Wait...");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:I forgive you...");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:Ah 'cough' Ah ....");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:..........");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Anna:Theo ! Are you okay  !Theo !");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("himself : Theodore Stayed two month in the hospital. : : black");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("himself : Luckily the bullet didn't damage any vital organ.");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("himself : After that Theodore and Anna spent more time together.");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("himself : But that's another story.");
		}
		else if(((Engine.engine.getGameAttribute("karma") : Float) < -100))
		{
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Anna:...!");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:No !");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("himself:'FUMP' : : : son_shot");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Anna:Ughh. : : shot");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:Anna no !");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Anna:Agh.......");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Anna:..........");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:No !");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:....:doute");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:Are you happy now ?");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:......");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:She didn't even know what happened !");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:What are you doing ? You're leaving ?");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:.....");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:I'm done with you now !:colere");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:All of this happened because of you !Remember that !");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:...");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:So stop the whining and try to lives now.");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:You'll see how easy it is...:doute");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("himself:Theodore was never seen again after this day. : : black");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("himself:Some says he leaved the country,some other he couldn't live with what happened.");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("himself:The truth remains uncertain.");
		}
		else
		{
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Anna:...!");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:No !");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("himself:'FUMP' : : : son_shot");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Anna:Ughh : : shot");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:Anna no !");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Anna:Agh....... ");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Anna:..........");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:No !");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:....:doute");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:Are you happy now ?");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:......");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:She didn't even know what happened !");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:What are you doing ? You're leaving ?");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:.....");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:I'm done with you now !:colere");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:All of this happened because of you !Remember that !");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Theodore:...");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:So stop the whining and try to lives now.");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("Blanche:You'll see how easy it is...:doute");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("himself:Theodore was never seen again after this day.");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("himself:Some says he leaved the country,some other he couldn't live with what happened.");
			(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).push("himself:The truth remains uncertain.");
		}
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				getActor(24).setX(((Engine.engine.getGameAttribute("pos_fleche_karma") : Float) + (Engine.engine.getGameAttribute("karma") : Float)));
				if(((Engine.engine.getGameAttribute("NumDialogue") : Float) <= (Engine.engine.getGameAttribute("MaxDialogue") : Float)))
				{
					scripts.SceneEvents_3._customBlock_gestion_emotion_anna_adulte((Engine.engine.getGameAttribute("PersoFeel") : String), getActor(31), getActor(32), getLastCreatedActor(), getActor(30), getActor(33));
					if(((Engine.engine.getGameAttribute("Levent") : String) == "son_shot"))
					{
						if(!(_shotonce))
						{
							_shotonce = true;
							playSound(getSound(185));
						}
					}
					if(((Engine.engine.getGameAttribute("interlocuteur") : String) == "Anna"))
					{
						getActor(33).disableActorDrawing();
						getActor(32).enableActorDrawing();
						getActor(30).enableActorDrawing();
						getActor(31).enableActorDrawing();
						getActor(28).disableActorDrawing();
						getActor(29).disableActorDrawing();
					}
					else if(((Engine.engine.getGameAttribute("interlocuteur") : String) == "Blanche"))
					{
						getActor(33).disableActorDrawing();
						getActor(32).disableActorDrawing();
						getActor(30).disableActorDrawing();
						getActor(31).disableActorDrawing();
						getActor(28).enableActorDrawing();
						getActor(29).disableActorDrawing();
					}
					else if(((Engine.engine.getGameAttribute("interlocuteur") : String) == "Arthur"))
					{
						getActor(33).disableActorDrawing();
						getActor(32).disableActorDrawing();
						getActor(30).disableActorDrawing();
						getActor(31).disableActorDrawing();
						getActor(28).disableActorDrawing();
						getActor(29).enableActorDrawing();
					}
					if((0 < (Engine.engine.getGameAttribute("ShowPrec") : Float)))
					{
						g.setFont(getFont(2));
						g.drawString("" + (Engine.engine.getGameAttribute("ShowPrec") : Float), 1811, 884);
					}
					if((Engine.engine.getGameAttribute("ShowChoice") : Bool))
					{
						g.setFont(getFont(16));
						g.drawString("" + "Good cops", 1740, 460);
						g.setFont(getFont(19));
						g.drawString("" + "Bad cops", 1420, 460);
					}
					if(((Engine.engine.getGameAttribute("PersoFeel") : String) == "gentil"))
					{
						getActor(28).setAnimation("gentil");
					}
					else if(((Engine.engine.getGameAttribute("PersoFeel") : String) == "colere"))
					{
						getActor(28).setAnimation("colere");
					}
					else if(((Engine.engine.getGameAttribute("PersoFeel") : String) == "doute"))
					{
						getActor(28).setAnimation("doute");
					}
					else if(((Engine.engine.getGameAttribute("PersoFeel") : String) == "normal"))
					{
						getActor(28).setAnimation("normal");
					}
					if((((Engine.engine.getGameAttribute("ask") : String) == "shot") && ((Engine.engine.getGameAttribute("interlocuteur") : String) == "Blanche")))
					{
						getActor(28).setAnimation("shot");
					}
					else if((((Engine.engine.getGameAttribute("ask") : String) == "shot") && ((Engine.engine.getGameAttribute("interlocuteur") : String) == "Anna")))
					{
						getActor(30).setAnimation("shot");
						getActor(32).setAnimation("grrr");
						getActor(31).setAnimation("shocked");
					}
					if(((Engine.engine.getGameAttribute("ask") : String) == "fond_revient"))
					{
						showTileLayer(engine.getLayerByName("showndown"));
						getActor(28).enableActorDrawing();
					}
					else if(((Engine.engine.getGameAttribute("ask") : String) == "black"))
					{
						getActor(33).disableActorDrawing();
						getActor(32).disableActorDrawing();
						getActor(30).disableActorDrawing();
						getActor(31).disableActorDrawing();
						getActor(28).disableActorDrawing();
						getActor(29).disableActorDrawing();
						hideTileLayer(engine.getLayerByName("showndown"));
					}
					else if(((Engine.engine.getGameAttribute("ask") : String) == "pula"))
					{
						getActor(28).disableActorDrawing();
					}
					else
					{
						Engine.engine.setGameAttribute("ShowChoice", false);
					}
				}
				else
				{
					switchScene(GameModel.get().scenes.get(46).getID(), createFadeOut(1, Utils.getColorRGB(0,0,0)), createFadeIn(1, Utils.getColorRGB(0,0,0)));
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}