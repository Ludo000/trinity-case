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



class SceneEvents_20 extends SceneScript
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
		nameMap.set("Current Line", "_CurrentLine");
		_CurrentLine = 0.0;
		nameMap.set("Line List", "_LineList");
		nameMap.set("Dialogue List", "_DialogueList");
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
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(25), (Engine.engine.getGameAttribute("pos_vie_x") : Float), (Engine.engine.getGameAttribute("pos_vie_y") : Float));
		getActor(24).setY((Engine.engine.getGameAttribute("pos_fleche_karma_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(23), (Engine.engine.getGameAttribute("pos_karma_bar_x") : Float), (Engine.engine.getGameAttribute("pos_karma_bar_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(6), (Engine.engine.getGameAttribute("pos_choix_gauche_x") : Float), (Engine.engine.getGameAttribute("pos_choix_gauche_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(10), (Engine.engine.getGameAttribute("pos_choix_centre_x") : Float), (Engine.engine.getGameAttribute("pos_choix_centre_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(7), (Engine.engine.getGameAttribute("pos_choix_droite_x") : Float), (Engine.engine.getGameAttribute("pos_choix_droite_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(4), (Engine.engine.getGameAttribute("pos_fleche_x") : Float), (Engine.engine.getGameAttribute("pos_fleche_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(3), (Engine.engine.getGameAttribute("pos_points_x") : Float), (Engine.engine.getGameAttribute("pos_points_y") : Float));
		hideTileLayer(engine.getLayerByName("bombe2"));
		hideTileLayer(engine.getLayerByName("bombe3"));
		hideTileLayer(engine.getLayerByName("bombe4"));
		getActor(17).disableActorDrawing();
		getActor(26).disableActorDrawing();
		_HoverQCMChoix2 = false;
		_HoverQCMChoix2 = false;
		_HoverQCMChoix1 = false;
		_HoverQCMChoix4 = false;
		_HoverQCMChoix5 = false;
		_linelenght = 0;
		_CurrentLine = 0;
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				getActor(24).setX(((Engine.engine.getGameAttribute("pos_fleche_karma") : Float) + (Engine.engine.getGameAttribute("karma") : Float)));
				if(((Engine.engine.getGameAttribute("NumDialogue") : Float) <= (Engine.engine.getGameAttribute("MaxDialogue") : Float)))
				{
					if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_1"))
					{
						Engine.engine.setGameAttribute("ShowNext", false);
						if(_HoverQCMChoix1)
						{
							g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
							g.strokeSize = 5;
							g.drawRect(getRegion(0).getX(), getRegion(0).getY(), getRegion(0).getWidth(), getRegion(0).getHeight());
						}
						else if(_HoverQCMChoix2)
						{
							g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
							g.strokeSize = 5;
							g.drawRect(getRegion(2).getX(), getRegion(2).getY(), getRegion(2).getWidth(), getRegion(2).getHeight());
						}
						else if(_HoverQCMChoix3)
						{
							g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
							g.strokeSize = 5;
							g.drawRect(getRegion(3).getX(), getRegion(3).getY(), getRegion(3).getWidth(), getRegion(3).getHeight());
						}
						else if(_HoverQCMChoix4)
						{
							g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
							g.strokeSize = 5;
							g.drawRect(getRegion(1).getX(), getRegion(1).getY(), getRegion(1).getWidth(), getRegion(1).getHeight());
						}
					}
					else if((((Engine.engine.getGameAttribute("ask") : String) == "Q1") && !((Engine.engine.getGameAttribute("Q1") : Bool))))
					{
						Engine.engine.setGameAttribute("ShowChoice", true);
						Engine.engine.setGameAttribute("ShowNext", false);
					}
					else if(((Engine.engine.getGameAttribute("ask") : String) == "show"))
					{
						getActor(26).enableActorDrawing();
					}
					else if(((Engine.engine.getGameAttribute("ask") : String) == "reload"))
					{
						Engine.engine.setGameAttribute("ShowNext", false);
						reloadCurrentScene(createFadeOut(2, Utils.getColorRGB(0,0,0)), createFadeIn(2, Utils.getColorRGB(0,0,0)));
					}
					else
					{
						Engine.engine.setGameAttribute("ShowChoice", false);
						getActor(17).disableActorDrawing();
					}
					if((Engine.engine.getGameAttribute("Q1") : Bool))
					{
						Engine.engine.setGameAttribute("Q1", false);
						if(((Engine.engine.getGameAttribute("QKarma") : String) == "good"))
						{
							(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore:Why does Blanche want to kill me?I can help you if you cooperate ! ";
						}
						else if(((Engine.engine.getGameAttribute("QKarma") : String) == "bad"))
						{
							(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore:Stop all your little game ! Why do you all want to kill me ? What did I do ?";
						}
					}
					if(((Engine.engine.getGameAttribute("ShowChoice") : Bool) && (Engine.engine.getGameAttribute("carnet_hide") : Bool)))
					{
						g.setFont(getFont(16));
						g.drawString("" + "Good cops", 1740, 460);
						g.setFont(getFont(19));
						g.drawString("" + "Bad cops", 1420, 460);
					}
					if((0 < (Engine.engine.getGameAttribute("ShowPrec") : Float)))
					{
						g.setFont(getFont(2));
						g.drawString("" + (Engine.engine.getGameAttribute("ShowPrec") : Float), 1811, 884);
					}
					if(((Engine.engine.getGameAttribute("PersoFeel") : String) == "content"))
					{
						getActor(26).setAnimation("content");
					}
					else if(((Engine.engine.getGameAttribute("PersoFeel") : String) == "colere"))
					{
						getActor(26).setAnimation("colere");
					}
					else if(((Engine.engine.getGameAttribute("PersoFeel") : String) == "normal"))
					{
						getActor(26).setAnimation("normal");
					}
				}
				else
				{
					switchScene(GameModel.get().scenes.get(40).getID(), createFadeOut(1, Utils.getColorRGB(0,0,0)), createFadeIn(1, Utils.getColorRGB(0,0,0)));
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(0), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_1"))
				{
					playSound(getSound(224));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Theodore:Only one position is right so of course I won't touch this button !";
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).splice(Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 2)), 1);
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).splice(Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 2)), 1);
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).splice(Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 2)), 1);
					Engine.engine.setGameAttribute("ShowPrec", -1);
					Engine.engine.setGameAttribute("ShowNext", true);
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					Engine.engine.setGameAttribute("ask", "null");
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(2), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_1"))
				{
					playSound(getSound(224));
					showTileLayer(engine.getLayerByName("bombe2"));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "himself : BROAM";
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Voice:Umh I think it was the wrong position.";
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 2))] = "Theodore:What ? No...";
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 3))] = "Voice:Good luck with your life from now on you'll need it. : : reload";
					Engine.engine.setGameAttribute("ShowPrec", -1);
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					Engine.engine.setGameAttribute("ShowNext", true);
					Engine.engine.setGameAttribute("ask", "null");
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(3), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_1"))
				{
					playSound(getSound(224));
					showTileLayer(engine.getLayerByName("bombe3"));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "himself : BROAM";
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Voice:Umh I think it was the wrong position.";
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 2))] = "Theodore:What ? No...";
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 3))] = "Voice:Good luck with your life from now on you'll need it. : : reload";
					Engine.engine.setGameAttribute("ShowPrec", -1);
					Engine.engine.setGameAttribute("ShowNext", true);
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					Engine.engine.setGameAttribute("ask", "null");
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(1), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_1"))
				{
					playSound(getSound(224));
					showTileLayer(engine.getLayerByName("bombe4"));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "himself : BROAM";
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Voice:Umh I think it was the wrong position.";
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 2))] = "Theodore:What ? No...";
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 3))] = "Voice:Good luck with your life from now on you'll need it. : : reload";
					Engine.engine.setGameAttribute("ShowPrec", -1);
					Engine.engine.setGameAttribute("ShowNext", true);
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					Engine.engine.setGameAttribute("ask", "null");
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(0), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_HoverQCMChoix1 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(2), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_HoverQCMChoix2 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(3), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_HoverQCMChoix3 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(1), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_HoverQCMChoix4 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(0), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_HoverQCMChoix1 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(2), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_HoverQCMChoix2 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(3), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_HoverQCMChoix3 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(1), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_HoverQCMChoix4 = false;
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}