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



class SceneEvents_3 extends SceneScript
{
	public var _descrperso:Array<Dynamic>;
	public var _Interlocuteur:String;
	public var _Choix2:Bool;
	public var _WordList:Array<Dynamic>;
	public var _Choix3:Bool;
	public var _hoverpreuve1:Bool;
	public var _descperso:String;
	public var _hoverpreuve2:Bool;
	public var _CurrentLine:Float;
	public var _LineList:Array<Dynamic>;
	public var _hoverpreuve3:Bool;
	public var _HoverQCMChoix1:Bool;
	public var _HoverQCMChoix2:Bool;
	public var _HoverQCMChoix3:Bool;
	public var _curfont:String;
	public var _DialogueList:Array<Dynamic>;
	public var _taillemotespace:Float;
	public var _xx:Float;
	public var _linelenght:Float;
	public var _jj:Float;
	public var _Choix1:Bool;
	public var _PersoFeel:String;
	public var _recap:String;
	public var _recaplist:Array<Dynamic>;
	
	/* ===================== Global Custom Block ====================== */
	public static function _customBlock_set_pos_actor_to_actor(__actor1:Actor, __actor2:Actor):Void
	{
		__actor1.setX(__actor2.getX());
		__actor1.setY(__actor2.getY());
	}
	
	/* ===================== Global Custom Block ====================== */
	public static function _customBlock_pos_actor_to(__actor:Actor, __x:Float, __y:Float):Void
	{
		__actor.setX(__x);
		__actor.setY(__y);
	}
	
	/* ===================== Global Custom Block ====================== */
	public static function _customBlock_reinitialisation_pour_nouvelle_scene():Void
	{
		Engine.engine.setGameAttribute("page_carnet", 1);
		Engine.engine.setGameAttribute("ShowEvidences", false);
		Engine.engine.setGameAttribute("carnet_hide", true);
		Engine.engine.setGameAttribute("ShowNext", true);
		Engine.engine.setGameAttribute("Q1", false);
		Engine.engine.setGameAttribute("ShowChoice", false);
		Engine.engine.setGameAttribute("ShowPrec", -1);
		Engine.engine.setGameAttribute("menu_ouvert", false);
		Engine.engine.setGameAttribute("NumDialogue", 0);
		Engine.engine.setGameAttribute("Levent", "0");
		Engine.engine.setGameAttribute("ask", "0");
	}
	
	/* ===================== Global Custom Block ====================== */
	public static function _customBlock_X_to_the_right_of(__actor:Actor):Float
	{
		return (__actor.getX() + ((__actor.getWidth()) + 20));
	}
	
	/* ===================== Global Custom Block ====================== */
	public static function _customBlock_Y_to_the_right_of(__actor:Actor, __margin:Float):Float
	{
		return (__actor.getY() + (((__actor.getHeight()) / 2) + __margin));
	}
	
	/* ===================== Global Custom Block ====================== */
	public static function _customBlock_gestion_emotion_anna_enfant(__PersoFeel:String, __tete:Actor, __bouche:Actor, __bras:Actor, __torse:Actor, __joue:Actor):Void
	{
		if((__PersoFeel == "rigole"))
		{
			__tete.setAnimation("content");
			__bouche.setAnimation("content_plus");
		}
		else if((__PersoFeel == "gene"))
		{
			__tete.setAnimation("surpris");
			__bouche.setAnimation("pas_content");
		}
		else if((__PersoFeel == "normal"))
		{
			__tete.setAnimation("normal");
			__bouche.setAnimation("content");
		}
		else if((__PersoFeel == "surpris"))
		{
			__tete.setAnimation("surpris");
			__bouche.setAnimation("surpris");
		}
		else if((__PersoFeel == "colere"))
		{
			__tete.setAnimation("normal");
			__bouche.setAnimation("pas_content");
		}
		else if((__PersoFeel == "montre"))
		{
			__tete.setAnimation("content");
			__bouche.setAnimation("content");
			__bras.setAnimation("revele");
		}
		else if((__PersoFeel == "clean"))
		{
			getActor(22).disableActorDrawing();
		}
	}
	
	/* ===================== Global Custom Block ====================== */
	public static function _customBlock_gestion_emotion_anna_adulte(__feel:String, __tete:Actor, __bouche:Actor, __bras:Actor, __torse:Actor, __joue:Actor):Void
	{
		if((__feel == "content"))
		{
			__tete.setAnimation("normal");
			__bouche.setAnimation("content_plus");
			__torse.setAnimation("detendu");
			__joue.disableActorDrawing();
		}
		else if((__feel == "appear"))
		{
			__tete.enableActorDrawing();
			__bouche.enableActorDrawing();
			__torse.enableActorDrawing();
			__joue.disableActorDrawing();
			__tete.setAnimation("normal");
			__bouche.setAnimation("content_plus");
			__torse.setAnimation("salut");
		}
		else if((__feel == "appear2"))
		{
			__tete.enableActorDrawing();
			__bouche.enableActorDrawing();
			__torse.enableActorDrawing();
			__joue.disableActorDrawing();
		}
		else if((__feel == "disappear"))
		{
			__tete.disableActorDrawing();
			__bouche.disableActorDrawing();
			__torse.disableActorDrawing();
			__joue.disableActorDrawing();
		}
		else if((__feel == "normal"))
		{
			__tete.setAnimation("normal");
			__bouche.setAnimation("normal");
			__torse.setAnimation("detendu");
		}
		else if((__feel == "frustre"))
		{
			__tete.setAnimation("sad");
			__bouche.setAnimation("grrr");
			__torse.setAnimation("detendu");
			__joue.disableActorDrawing();
		}
		else if((__feel == "decu"))
		{
			__tete.setAnimation("sad");
			__bouche.setAnimation("pas_content");
			__torse.setAnimation("detendu");
			__joue.disableActorDrawing();
		}
		else if((__feel == "enerve"))
		{
			__tete.setAnimation("serious");
			__bouche.setAnimation("grrr");
			__torse.setAnimation("detendu");
			__joue.disableActorDrawing();
		}
		else if((__feel == "pas_content"))
		{
			__tete.setAnimation("normal");
			__bouche.setAnimation("pas_content");
			__torse.setAnimation("detendu");
			__joue.disableActorDrawing();
		}
		else if((__feel == "serieux_sourire"))
		{
			__tete.setAnimation("serious");
			__bouche.setAnimation("normal");
			__torse.setAnimation("detendu");
			__joue.disableActorDrawing();
		}
		else if((__feel == "surpris"))
		{
			__tete.setAnimation("shocked");
			__bouche.setAnimation("grrr");
			__torse.setAnimation("detendu");
			__joue.disableActorDrawing();
		}
		else if((__feel == "shot"))
		{
			__tete.setAnimation("shocked");
			__bouche.setAnimation("grrr");
			__torse.setAnimation("shot");
			__joue.disableActorDrawing();
		}
		else if((__feel == "rougit"))
		{
			__tete.setAnimation("sad");
			__bouche.setAnimation("content");
			__torse.setAnimation("detendu");
			__joue.enableActorDrawing();
		}
	}
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("descr_perso", "_descrperso");
		nameMap.set("Interlocuteur", "_Interlocuteur");
		_Interlocuteur = "";
		nameMap.set("Choix2", "_Choix2");
		_Choix2 = false;
		nameMap.set("Word List", "_WordList");
		nameMap.set("Choix3", "_Choix3");
		_Choix3 = false;
		nameMap.set("hover preuve 1", "_hoverpreuve1");
		_hoverpreuve1 = false;
		nameMap.set("desc_perso", "_descperso");
		_descperso = "";
		nameMap.set("hover preuve 2", "_hoverpreuve2");
		_hoverpreuve2 = false;
		nameMap.set("Current Line", "_CurrentLine");
		_CurrentLine = 0.0;
		nameMap.set("Line List", "_LineList");
		nameMap.set("hover preuve 3", "_hoverpreuve3");
		_hoverpreuve3 = false;
		nameMap.set("Hover_QCM_Choix1", "_HoverQCMChoix1");
		_HoverQCMChoix1 = false;
		nameMap.set("Hover_QCM_Choix2", "_HoverQCMChoix2");
		_HoverQCMChoix2 = false;
		nameMap.set("Hover_QCM_Choix3", "_HoverQCMChoix3");
		_HoverQCMChoix3 = false;
		nameMap.set("cur_font", "_curfont");
		_curfont = "";
		nameMap.set("Dialogue List", "_DialogueList");
		nameMap.set("taille motespace", "_taillemotespace");
		_taillemotespace = 0.0;
		nameMap.set("xx", "_xx");
		_xx = 0.0;
		nameMap.set("line lenght", "_linelenght");
		_linelenght = 0.0;
		nameMap.set("jj", "_jj");
		_jj = 0.0;
		nameMap.set("Choix1", "_Choix1");
		_Choix1 = false;
		nameMap.set("PersoFeel", "_PersoFeel");
		_PersoFeel = "";
		nameMap.set("recap", "_recap");
		_recap = "";
		nameMap.set("recap_list", "_recaplist");
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		Engine.engine.setGameAttribute("pos_vie_x", getActor(28).getX());
		Engine.engine.setGameAttribute("pos_vie_y", getActor(28).getY());
		Engine.engine.setGameAttribute("pos_karma_bar_x", getActor(26).getX());
		Engine.engine.setGameAttribute("pos_karma_bar_y", getActor(26).getY());
		Engine.engine.setGameAttribute("pos_fleche_karma", getActor(27).getX());
		Engine.engine.setGameAttribute("pos_fleche_karma_y", getActor(27).getY());
		Engine.engine.setGameAttribute("pos_carnet_icone_x", getActor(5).getX());
		Engine.engine.setGameAttribute("pos_carnet_icone_y", getActor(5).getY());
		Engine.engine.setGameAttribute("pos_choix_gauche_x", getActor(6).getX());
		Engine.engine.setGameAttribute("pos_choix_gauche_y", getActor(6).getY());
		Engine.engine.setGameAttribute("pos_choix_centre_x", getActor(10).getX());
		Engine.engine.setGameAttribute("pos_choix_centre_y", getActor(10).getY());
		Engine.engine.setGameAttribute("pos_choix_droite_x", getActor(7).getX());
		Engine.engine.setGameAttribute("pos_choix_droite_y", getActor(7).getY());
		Engine.engine.setGameAttribute("pos_loupe_x", getActor(17).getX());
		Engine.engine.setGameAttribute("pos_loupe_y", getActor(17).getY());
		Engine.engine.setGameAttribute("pos_fleche_x", getActor(4).getX());
		Engine.engine.setGameAttribute("pos_fleche_y", getActor(4).getY());
		Engine.engine.setGameAttribute("pos_points_x", getActor(3).getX());
		Engine.engine.setGameAttribute("pos_points_y", getActor(3).getY());
		Engine.engine.setGameAttribute("pos_dialog", getActor(2).getX());
		Engine.engine.setGameAttribute("pos_dialog_y", getActor(2).getY());
		Engine.engine.setGameAttribute("pos_carnet_x", getActor(12).getX());
		Engine.engine.setGameAttribute("pos_carnet_y", getActor(12).getY());
		scripts.SceneEvents_3._customBlock_reinitialisation_pour_nouvelle_scene();
		Engine.engine.setGameAttribute("health", 10);
		getActor(17).disableActorDrawing();
		getActor(22).disableActorDrawing();
		scripts.SceneEvents_3._customBlock_set_pos_actor_to_actor(getActor(19), getActor(18));
		scripts.SceneEvents_3._customBlock_set_pos_actor_to_actor(getActor(21), getActor(18));
		scripts.SceneEvents_3._customBlock_set_pos_actor_to_actor(getActor(20), getActor(18));
		scripts.SceneEvents_3._customBlock_set_pos_actor_to_actor(getActor(22), getActor(18));
		_hoverpreuve1 = false;
		_hoverpreuve2 = false;
		_hoverpreuve3 = false;
		Engine.engine.setGameAttribute("health", 10);
		Engine.engine.setGameAttribute("karma", 0);
		Engine.engine.setGameAttribute("karma_point", 25);
		_linelenght = 0;
		_CurrentLine = 0;
		_recap = "There is no content here yet.";
		_descperso = "<b> Anna </b> <br> She's my friend.";
		_PersoFeel = "normal";
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((Engine.engine.getGameAttribute("NumDialogue") : Float) <= (Engine.engine.getGameAttribute("MaxDialogue") : Float)))
				{
					scripts.SceneEvents_3._customBlock_gestion_emotion_anna_enfant((Engine.engine.getGameAttribute("PersoFeel") : String), getActor(19), getActor(20), getActor(21), getActor(18), getActor(22));
					if(((0 < (Engine.engine.getGameAttribute("ShowPrec") : Float)) && (Engine.engine.getGameAttribute("carnet_hide") : Bool)))
					{
						g.setFont(getFont(2));
						g.drawString("" + (Engine.engine.getGameAttribute("ShowPrec") : Float), 1811, 884);
					}
					if(((Engine.engine.getGameAttribute("ShowChoice") : Bool) && (Engine.engine.getGameAttribute("carnet_hide") : Bool)))
					{
						g.setFont(getFont(16));
						g.drawString("" + "Good guy", 1740, 460);
						g.setFont(getFont(19));
						g.drawString("" + "Chide her", 1420, 460);
					}
					if((Engine.engine.getGameAttribute("carnet_hide") : Bool))
					{
						if((((Engine.engine.getGameAttribute("ask") : String) == "C1") || (((Engine.engine.getGameAttribute("ask") : String) == "C2") || ((Engine.engine.getGameAttribute("ask") : String) == "C3"))))
						{
							getActor(17).enableActorDrawing();
							Engine.engine.setGameAttribute("ShowNext", false);
							Engine.engine.setGameAttribute("ShowPrec", -1);
						}
						else if(((Engine.engine.getGameAttribute("ask") : String) == "Q1"))
						{
							Engine.engine.setGameAttribute("ShowChoice", true);
							Engine.engine.setGameAttribute("ShowNext", false);
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
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore: Honnestly it doesn't matter if you eat my cake, i like to resolve mysteries, but make it more difficult next time ! :montre";
							}
							else if(((Engine.engine.getGameAttribute("QKarma") : String) == "bad"))
							{
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore: Honnestly it wasn't to difficult but from now on try to avoid to repeat the same deed 5 week in a row, you'd end up in jail pretty fast. :montre";
							}
						}
					}
					if(!((Engine.engine.getGameAttribute("carnet_hide") : Bool)))
					{
						if(((Engine.engine.getGameAttribute("page_carnet") : Float) == 1))
						{
							g.setFont(getFont(25));
							
							g.setFont(getFont(26));
							_CurrentLine = 0;
							_linelenght = 0;
							_descrperso = (_descperso).split(" ");
							for(item in cast(_descrperso, Array<Dynamic>))
							{
								if((item == "<b>"))
								{
									g.setFont(getFont(44));
								}
								if((item == "</b>"))
								{
									g.setFont(getFont(26));
								}
								if((!(item == "<br>") && (!(item == "<b>") && !(item == "</b>"))))
								{
									g.drawString("" + item, (_linelenght + (getActor(12).getX() + 380)), (_CurrentLine + (getActor(12).getY() + 200)));
									_linelenght += (getFont(26).getTextWidth("" + item)/Engine.SCALE + 10);
								}
								if(((_linelenght > 400) || (item == "<br>")))
								{
									_CurrentLine += (getFont(26).getHeight()/Engine.SCALE + 5);
									_linelenght = 0;
								}
							}
						}
						else if(((Engine.engine.getGameAttribute("page_carnet") : Float) == 2))
						{
							g.setFont(getFont(26));
							g.drawString("" + "Observation: Anna left during classroom.", (scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(23)) : Float), (scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(23), 0) : Float));
							g.drawString("" + "Suspect's antedecedent : Several case", (scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(24)) : Float), (scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(24), 0) : Float));
							g.drawString("" + "of theft of (my) food.", (scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(24)) : Float), (scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(24), 20) : Float));
							g.drawString("" + "Chewing gum in lock of cloakroom", (scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(25)) : Float), (scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(25), 0) : Float));
							if(_hoverpreuve1)
							{
								g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
								g.strokeSize = 5;
								g.drawRect((getActor(23).getX() - 10), (getActor(23).getY() - 10), 550, 150);
							}
							else if(_hoverpreuve2)
							{
								g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
								g.strokeSize = 5;
								g.drawRect((getActor(24).getX() - 10), (getActor(24).getY() - 10), 550, 150);
							}
							else if(_hoverpreuve3)
							{
								g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
								g.strokeSize = 5;
								g.drawRect((getActor(25).getX() - 10), (getActor(25).getY() - 10), 550, 150);
							}
						}
						else if(((Engine.engine.getGameAttribute("page_carnet") : Float) == 3))
						{
							g.setFont(getFont(25));
							
							_CurrentLine = 0;
							_linelenght = 0;
							g.setFont(getFont(26));
							g.drawString("" + "There is no content here yet.", (getActor(12).getX() + 380), (getActor(12).getY() + 200));
							_recaplist = (_recap).split(" ");
							
						}
						else if(((Engine.engine.getGameAttribute("page_carnet") : Float) == 4))
						{
							g.setFont(getFont(26));
							g.drawString("" + "There is no content here yet.", (getActor(12).getX() + 380), (getActor(12).getY() + 200));
						}
					}
				}
				else
				{
					switchScene(GameModel.get().scenes.get(48).getID(), createFadeOut(1, Utils.getColorRGB(0,0,0)), createFadeIn(1, Utils.getColorRGB(0,0,0)));
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(4), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hoverpreuve1 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(5), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hoverpreuve2 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hoverpreuve3 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(4), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_hoverpreuve1 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(5), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_hoverpreuve2 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_hoverpreuve3 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(4), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((!((Engine.engine.getGameAttribute("carnet_hide") : Bool)) && ((Engine.engine.getGameAttribute("page_carnet") : Float) == 2)))
				{
					if(((Engine.engine.getGameAttribute("ask") : String) == "C1"))
					{
						Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
						Engine.engine.setGameAttribute("ShowNext", true);
						Engine.engine.setGameAttribute("ShowPrec", -1);
						Engine.engine.setGameAttribute("ask", "null");
						playSound(getSound(184));
					}
					else
					{
						Engine.engine.setGameAttribute("Perd1Pv", true);
					}
					Engine.engine.setGameAttribute("carnet_hide", true);
					Engine.engine.setGameAttribute("ShowEvidences", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(5), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((!((Engine.engine.getGameAttribute("carnet_hide") : Bool)) && ((Engine.engine.getGameAttribute("page_carnet") : Float) == 2)))
				{
					if(((Engine.engine.getGameAttribute("ask") : String) == "C3"))
					{
						Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
						Engine.engine.setGameAttribute("ShowNext", true);
						Engine.engine.setGameAttribute("ShowPrec", -1);
						Engine.engine.setGameAttribute("ask", "null");
						playSound(getSound(184));
					}
					else
					{
						Engine.engine.setGameAttribute("Perd1Pv", true);
					}
					Engine.engine.setGameAttribute("carnet_hide", true);
					Engine.engine.setGameAttribute("ShowEvidences", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((!((Engine.engine.getGameAttribute("carnet_hide") : Bool)) && ((Engine.engine.getGameAttribute("page_carnet") : Float) == 2)))
				{
					if(((Engine.engine.getGameAttribute("ask") : String) == "C2"))
					{
						Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
						Engine.engine.setGameAttribute("ShowNext", true);
						Engine.engine.setGameAttribute("ShowPrec", -1);
						Engine.engine.setGameAttribute("ask", "null");
						playSound(getSound(184));
					}
					else
					{
						Engine.engine.setGameAttribute("Perd1Pv", true);
					}
					Engine.engine.setGameAttribute("carnet_hide", true);
					Engine.engine.setGameAttribute("ShowEvidences", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(0), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(!((Engine.engine.getGameAttribute("carnet_hide") : Bool)))
				{
					Engine.engine.setGameAttribute("page_carnet", 1);
					playSound(getSound(158));
					Engine.engine.setGameAttribute("ShowEvidences", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(2), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(!((Engine.engine.getGameAttribute("carnet_hide") : Bool)))
				{
					playSound(getSound(158));
					Engine.engine.setGameAttribute("page_carnet", 3);
					Engine.engine.setGameAttribute("ShowEvidences", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(1), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(!((Engine.engine.getGameAttribute("carnet_hide") : Bool)))
				{
					Engine.engine.setGameAttribute("page_carnet", 2);
					playSound(getSound(158));
					Engine.engine.setGameAttribute("ShowEvidences", true);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(3), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(!((Engine.engine.getGameAttribute("carnet_hide") : Bool)))
				{
					Engine.engine.setGameAttribute("page_carnet", 4);
					Engine.engine.setGameAttribute("ShowEvidences", false);
					playSound(getSound(158));
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}