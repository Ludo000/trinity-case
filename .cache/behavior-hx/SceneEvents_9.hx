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



class SceneEvents_9 extends SceneScript
{
	public var _Interlocuteur:String;
	public var _WordList:Array<Dynamic>;
	public var _CurrentLine:Float;
	public var _LineList:Array<Dynamic>;
	public var _DialogueList:Array<Dynamic>;
	public var _linelenght:Float;
	public var _PersoFeel:String;
	public var _recap:String;
	public var _recaplist:Array<Dynamic>;
	public var _descperso:Array<Dynamic>;
	public var _descc:String;
	public var _descrperso:Array<Dynamic>;
	public var _hoverpreuve1:Bool;
	public var _hoverpreuve2:Bool;
	public var _hoverpreuve3:Bool;
	public var _HoverQCMChoix1:Bool;
	public var _HoverQCMChoix2:Bool;
	public var _HoverQCMChoix3:Bool;
	public var _showFiche1:Bool;
	public var _nomfiche:String;
	public var _nomcrimefiche:String;
	public var _textefiche:Array<Dynamic>;
	public var _afficherlafiche:Bool;
	public var _taillemotespace:Float;
	public var _curfont:String;
	public var _Rap20:Bool;
	public var _hoverpreuve4:Bool;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Interlocuteur", "_Interlocuteur");
		_Interlocuteur = "";
		nameMap.set("Word List", "_WordList");
		nameMap.set("Current Line", "_CurrentLine");
		_CurrentLine = 0.0;
		nameMap.set("Line List", "_LineList");
		nameMap.set("Dialogue List", "_DialogueList");
		nameMap.set("line lenght", "_linelenght");
		_linelenght = 0.0;
		nameMap.set("PersoFeel", "_PersoFeel");
		_PersoFeel = "";
		nameMap.set("recap", "_recap");
		_recap = "";
		nameMap.set("recap_list", "_recaplist");
		nameMap.set("desc_perso", "_descperso");
		nameMap.set("descc", "_descc");
		_descc = "";
		nameMap.set("descr_perso", "_descrperso");
		nameMap.set("hover preuve 1", "_hoverpreuve1");
		_hoverpreuve1 = false;
		nameMap.set("hover preuve 2", "_hoverpreuve2");
		_hoverpreuve2 = false;
		nameMap.set("hover preuve 3", "_hoverpreuve3");
		_hoverpreuve3 = false;
		nameMap.set("Hover_QCM_Choix1", "_HoverQCMChoix1");
		_HoverQCMChoix1 = false;
		nameMap.set("Hover_QCM_Choix2", "_HoverQCMChoix2");
		_HoverQCMChoix2 = false;
		nameMap.set("Hover_QCM_Choix3", "_HoverQCMChoix3");
		_HoverQCMChoix3 = false;
		nameMap.set("showFiche1", "_showFiche1");
		_showFiche1 = false;
		nameMap.set("nom_fiche", "_nomfiche");
		_nomfiche = "";
		nameMap.set("nom_crime_fiche", "_nomcrimefiche");
		_nomcrimefiche = "";
		nameMap.set("texte_fiche", "_textefiche");
		nameMap.set("afficherlafiche", "_afficherlafiche");
		_afficherlafiche = false;
		nameMap.set("taille motespace", "_taillemotespace");
		_taillemotespace = 0.0;
		nameMap.set("cur_font", "_curfont");
		_curfont = "";
		nameMap.set("Rap20", "_Rap20");
		_Rap20 = false;
		nameMap.set("hoverpreuve4", "_hoverpreuve4");
		_hoverpreuve4 = false;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		scripts.SceneEvents_3._customBlock_reinitialisation_pour_nouvelle_scene();
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(20), (Engine.engine.getGameAttribute("pos_vie_x") : Float), (Engine.engine.getGameAttribute("pos_vie_y") : Float));
		getActor(19).setY((Engine.engine.getGameAttribute("pos_fleche_karma_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(18), (Engine.engine.getGameAttribute("pos_karma_bar_x") : Float), (Engine.engine.getGameAttribute("pos_karma_bar_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(6), (Engine.engine.getGameAttribute("pos_choix_gauche_x") : Float), (Engine.engine.getGameAttribute("pos_choix_gauche_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(10), (Engine.engine.getGameAttribute("pos_choix_centre_x") : Float), (Engine.engine.getGameAttribute("pos_choix_centre_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(7), (Engine.engine.getGameAttribute("pos_choix_droite_x") : Float), (Engine.engine.getGameAttribute("pos_choix_droite_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(4), (Engine.engine.getGameAttribute("pos_fleche_x") : Float), (Engine.engine.getGameAttribute("pos_fleche_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(3), (Engine.engine.getGameAttribute("pos_points_x") : Float), (Engine.engine.getGameAttribute("pos_points_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(2), (Engine.engine.getGameAttribute("pos_dialog") : Float), (Engine.engine.getGameAttribute("pos_dialog_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(5), (Engine.engine.getGameAttribute("pos_carnet_icone_x") : Float), (Engine.engine.getGameAttribute("pos_carnet_icone_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(12), (Engine.engine.getGameAttribute("pos_carnet_x") : Float), (Engine.engine.getGameAttribute("pos_carnet_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(21), (Engine.engine.getGameAttribute("pos_qcm_x") : Float), (Engine.engine.getGameAttribute("pos_qcm_y") : Float));
		Engine.engine.setGameAttribute("pos_table_x", getActor(15).getX());
		Engine.engine.setGameAttribute("pos_table_y", getActor(15).getY());
		getActor(17).disableActorDrawing();
		getActor(21).disableActorDrawing();
		_afficherlafiche = false;
		_HoverQCMChoix1 = false;
		_HoverQCMChoix2 = false;
		_hoverpreuve1 = false;
		_hoverpreuve2 = false;
		_hoverpreuve3 = false;
		_taillemotespace = 0;
		_linelenght = 0;
		_CurrentLine = 0;
		_descc = "35 years old <br> 1m82 <br> Chief at \"La Bonne Omelette\" <br>";
		_recap = "24 years old women found dead , strangled in the cave of an abandoned house,tied to a chair in front of a Tv wich was showing young women being killed the same way in loop. On the wall there was also picture of all his victims being strangled, with the killer properly cut off of every picture , on all of them \"for her\" was written with a marker. <br> There is a total of 11 victims,among them the young women killed in the karaoke. The murder was recorder,we can see a man tying the young women then we hear a door being slamed shut before cutting.  <br> We can clearly see the face of the man tying the woman.  <br> <br> <b> Clue : </b> <br> -The SD card with the murder record.  <br> -DNA on the rope wich was used to tied the victim.  <br> -The forensic report , the victim hasn't eaten for 3 days before she died. <br> <br> <b> Suspect: </b> <br> Mr Collibris : cooking chief , has been identified has the man tying the women on the record. <br> His DNA match with the one on the rope , his implication is yet to confirme.";
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((Engine.engine.getGameAttribute("NumDialogue") : Float) <= (Engine.engine.getGameAttribute("MaxDialogue") : Float)))
				{
					if(((0 < (Engine.engine.getGameAttribute("ShowPrec") : Float)) && (Engine.engine.getGameAttribute("carnet_hide") : Bool)))
					{
						g.setFont(getFont(2));
						g.drawString("" + (Engine.engine.getGameAttribute("ShowPrec") : Float), 1811, 884);
					}
					if(((Engine.engine.getGameAttribute("ShowChoice") : Bool) && (Engine.engine.getGameAttribute("carnet_hide") : Bool)))
					{
						g.setFont(getFont(16));
						g.drawString("" + "Good cops", 1740, 460);
						g.setFont(getFont(19));
						g.drawString("" + "Bad cops", 1420, 460);
					}
					if((Engine.engine.getGameAttribute("carnet_hide") : Bool))
					{
						if(((Engine.engine.getGameAttribute("PersoFeel") : String) == "surpris"))
						{
							getActor(22).setAnimation("surpris");
						}
						else if(((Engine.engine.getGameAttribute("PersoFeel") : String) == "colere"))
						{
							getActor(22).setAnimation("colere");
						}
						else if(((Engine.engine.getGameAttribute("PersoFeel") : String) == "normal"))
						{
							getActor(22).setAnimation("normal");
						}
						if(((Engine.engine.getGameAttribute("ask") : String) == "C1"))
						{
							getActor(17).enableActorDrawing();
							Engine.engine.setGameAttribute("ShowNext", false);
							Engine.engine.setGameAttribute("ShowPrec", -1);
						}
						else if((((Engine.engine.getGameAttribute("ask") : String) == "Q1") || (((Engine.engine.getGameAttribute("ask") : String) == "Q2") || ((Engine.engine.getGameAttribute("ask") : String) == "Q3"))))
						{
							Engine.engine.setGameAttribute("ShowChoice", true);
							Engine.engine.setGameAttribute("ShowNext", false);
						}
						else if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_1"))
						{
							Engine.engine.setGameAttribute("ShowNext", false);
							getActor(21).enableActorDrawing();
							g.setFont(getFont(26));
							g.drawString("" + "- It change nothing.", (getActor(21).getX() + 20), (getActor(21).getY() + 50));
							g.drawString("" + "- Mr Colibris didn't kill the victim.", (getActor(21).getX() + 20), (getActor(21).getY() + 80));
							if(_HoverQCMChoix1)
							{
								g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
								g.strokeSize = 5;
								g.drawRect((getActor(21).getX() + 15), (getActor(21).getY() + 45), 600, 30);
							}
							else if(_HoverQCMChoix2)
							{
								g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
								g.strokeSize = 5;
								g.drawRect((getActor(21).getX() + 15), (getActor(21).getY() + 75), 600, 30);
							}
						}
						else
						{
							Engine.engine.setGameAttribute("ShowChoice", false);
							getActor(17).disableActorDrawing();
							getActor(21).disableActorDrawing();
							getActor(2).setAnimation("normal");
						}
						if((Engine.engine.getGameAttribute("Q1") : Bool))
						{
							Engine.engine.setGameAttribute("Q1", false);
							if(((Engine.engine.getGameAttribute("QKarma") : String) == "good"))
							{
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore:Okay it's for a movie, so what exactly was your part in ?";
							}
							else if(((Engine.engine.getGameAttribute("QKarma") : String) == "bad"))
							{
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore:You know I would have believe you if at the end of the 'movie' the women doesn't get brutally murdered, too bad it's not the case.";
							}
						}
						if((Engine.engine.getGameAttribute("Q2") : Bool))
						{
							Engine.engine.setGameAttribute("Q2", false);
							if(((Engine.engine.getGameAttribute("QKarma") : String) == "good"))
							{
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore:You need protection it's obvious ! But we can only do that if you tell me what you know !";
							}
							else if(((Engine.engine.getGameAttribute("QKarma") : String) == "bad"))
							{
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore:Okay you can choose not to talk, we got some free room in jail and you appear on a murder record so...";
							}
						}
						if((Engine.engine.getGameAttribute("Q3") : Bool))
						{
							Engine.engine.setGameAttribute("Q3", false);
							if(((Engine.engine.getGameAttribute("QKarma") : String) == "good"))
							{
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore:Yeah really I'll tell the judge you were cooperative.";
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).splice(Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1)), 1);
							}
							else if(((Engine.engine.getGameAttribute("QKarma") : String) == "bad"))
							{
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore:Yeah hopefully ! But going to an abandoned house and tie an unconscious women just because a man you met hours before tell you to do it is pretty dumb.";
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Theodore:With luck the judge won't convict you for being a moron.";
							}
						}
					}
					else
					{
						if(((Engine.engine.getGameAttribute("page_carnet") : Float) == 1))
						{
							Engine.engine.setGameAttribute("ShowFiche", false);
							g.setFont(getFont(25));
							g.drawString("" + "Eric Johnson", (getActor(12).getX() + 380), (getActor(12).getY() + 100));
							g.setFont(getFont(26));
							_CurrentLine = 0;
							_linelenght = 0;
							_descperso = (_descc).split(" ");
							for(item in cast(_descperso, Array<Dynamic>))
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
							Engine.engine.setGameAttribute("ShowFiche", false);
							g.setFont(getFont(26));
							g.drawString("" + "Report of the forensic scientist", (scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(23)) : Float), (scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(23), 0) : Float));
							g.drawString("" + "that show that the victim", (scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(23)) : Float), (scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(23), 20) : Float));
							g.drawString("" + "didn't eat for 3 days before her death.", (scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(23)) : Float), (scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(23), 40) : Float));
							g.drawString("" + "DNA dound ont the rope", (scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(24)) : Float), (scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(24), 0) : Float));
							g.drawString("" + "that tied the victim.", (scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(24)) : Float), (scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(24), 20) : Float));
							g.drawString("" + "SD Card, countains video of the scene.", (scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(25)) : Float), (scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(25), 0) : Float));
							if(_hoverpreuve1)
							{
								g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
								g.strokeSize = 5;
								g.drawRect((getActor(24).getX() - 10), (getActor(24).getY() - 10), 500, 150);
							}
							else if(_hoverpreuve2)
							{
								g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
								g.strokeSize = 5;
								g.drawRect((getActor(23).getX() - 10), (getActor(23).getY() - 10), 500, 150);
							}
							else if(_hoverpreuve3)
							{
								g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
								g.strokeSize = 5;
								g.drawRect((getActor(25).getX() - 10), (getActor(25).getY() - 10), 500, 150);
							}
						}
						else if(((Engine.engine.getGameAttribute("page_carnet") : Float) == 3))
						{
							Engine.engine.setGameAttribute("ShowFiche", false);
							g.setFont(getFont(25));
							g.drawString("" + "Murder of the cellar", (getActor(12).getX() + 380), (getActor(12).getY() + 100));
							g.setFont(getFont(26));
							_CurrentLine = 0;
							_linelenght = 0;
							_recaplist = (_recap).split(" ");
							for(item in cast(_recaplist, Array<Dynamic>))
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
						else if(((Engine.engine.getGameAttribute("page_carnet") : Float) == 4))
						{
							Engine.engine.setGameAttribute("ShowFiche", true);
							g.setFont(getFont(26));
							g.drawString("" + "Case #4701 : Mr Eric Johnson", (scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(28)) : Float), (scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(28), 0) : Float));
							if(_hoverpreuve1)
							{
								g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
								g.strokeSize = 5;
								g.drawRect((getActor(28).getX() - 10), (getActor(28).getY() - 10), 500, ((getActor(28).getHeight()) + 20));
							}
							if((Engine.engine.getGameAttribute("showFicheTexte") : Bool))
							{
								g.setFont(getFont(26));
								g.setFont(getFont(25));
								g.drawString("" + (Engine.engine.getGameAttribute("nom_case") : String), (getRegion(11).getX() + 10), (getRegion(11).getY() + 10));
								g.drawString("" + (Engine.engine.getGameAttribute("nom_temoin") : String), (getRegion(11).getX() + 10), (getRegion(11).getY() + 40));
								g.setFont(getFont(26));
								_recaplist = ((Engine.engine.getGameAttribute("desc_perso") : String)).split(" ");
								_textefiche = ((Engine.engine.getGameAttribute("texte_temoin") : String)).split(" ");
								_CurrentLine = 0;
								_linelenght = 0;
								for(item in cast(_recaplist, Array<Dynamic>))
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
										g.drawString("" + item, (_linelenght + (getRegion(11).getX() + 10)), (_CurrentLine + (getRegion(11).getY() + 100)));
										_linelenght += (getFont(26).getTextWidth("" + item)/Engine.SCALE + 10);
									}
									if(((_linelenght > 400) || (item == "<br>")))
									{
										_CurrentLine += (getFont(26).getHeight()/Engine.SCALE + 5);
										_linelenght = 0;
									}
								}
								_linelenght = 0;
								g.setFont(getFont(25));
								g.drawString("" + "Testimony", (getRegion(11).getX() + 10), (getRegion(11).getY() + 250));
								g.setFont(getFont(26));
								for(item in cast(_textefiche, Array<Dynamic>))
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
										g.drawString("" + item, (_linelenght + (getRegion(11).getX() + 10)), (_CurrentLine + (getRegion(11).getY() + 300)));
										_linelenght += (getFont(26).getTextWidth("" + item)/Engine.SCALE + 10);
									}
									if(((_linelenght > 400) || (item == "<br>")))
									{
										_CurrentLine += (getFont(26).getHeight()/Engine.SCALE + 5);
										_linelenght = 0;
									}
								}
								_linelenght = 0;
								_CurrentLine = 0;
							}
						}
					}
				}
				else
				{
					switchScene(GameModel.get().scenes.get(10).getID(), createFadeOut(1, Utils.getColorRGB(0,0,0)), createFadeIn(1, Utils.getColorRGB(0,0,0)));
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
					playSound(getSound(158));
					Engine.engine.setGameAttribute("page_carnet", 1);
					Engine.engine.setGameAttribute("ShowEvidences", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(1), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(!((Engine.engine.getGameAttribute("ShowEvidences") : Bool)))
				{
					playSound(getSound(158));
					Engine.engine.setGameAttribute("page_carnet", 2);
					Engine.engine.setGameAttribute("ShowEvidences", true);
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
					Engine.engine.setGameAttribute("page_carnet", 3);
					playSound(getSound(158));
					Engine.engine.setGameAttribute("ShowEvidences", false);
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
					playSound(getSound(158));
					Engine.engine.setGameAttribute("ShowEvidences", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(4), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hoverpreuve1 = true;
				_hoverpreuve1 = true;
				if((!((Engine.engine.getGameAttribute("carnet_hide") : Bool)) && ((Engine.engine.getGameAttribute("page_carnet") : Float) == 4)))
				{
					Engine.engine.setGameAttribute("showFiche11victime", false);
					Engine.engine.setGameAttribute("nom_case", "Case #7401");
					Engine.engine.setGameAttribute("nom_temoin", "Mr Eric Johnson");
					Engine.engine.setGameAttribute("desc_perso", "20 years old <br> 1m80 <br> Technician at \"Le Bonheur\" <br> Suspect for the case #7401");
					Engine.engine.setGameAttribute("texte_temoin", "\"I may have installed the cameras, but I didn't killed her ! [...] <br> I only spoke to him on the phone, and guessing by noises and this crime severity, it had to be from a phone cab. <br> But he had a voice suprisingly soft for an adult, I think he also had some sort of bad habit. <br> I mean I often heard a licking noise when he ended his sentences, it wasn't often enough to be noticeable though. <br>  He gave me money by dropping it directly into my mail box, I was never able to see him.\"");
					Engine.engine.setGameAttribute("showFicheTexte", true);
				}
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
					if(((Engine.engine.getGameAttribute("ask") : String) == "C3"))
					{
						Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
						Engine.engine.setGameAttribute("ShowNext", true);
						Engine.engine.setGameAttribute("ask", "null");
						Engine.engine.setGameAttribute("ShowPrec", -1);
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
		addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((!((Engine.engine.getGameAttribute("carnet_hide") : Bool)) && ((Engine.engine.getGameAttribute("page_carnet") : Float) == 2)))
				{
					if(((Engine.engine.getGameAttribute("ask") : String) == "C1"))
					{
						Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
						Engine.engine.setGameAttribute("ShowNext", true);
						Engine.engine.setGameAttribute("ask", "null");
						Engine.engine.setGameAttribute("ShowPrec", -1);
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
		addMouseOverActorListener(getRegion(7), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_1"))
				{
					playSound(getSound(156));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Theodore:No we saw on the record Mr Colibris tying the victime minutes before the killer came. If he leaved the house he was with the neighborhood.";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					getActor(21).disableActorDrawing();
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(8), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_1"))
				{
					playSound(getSound(156));
					Engine.engine.setGameAttribute("ShowNext", true);
					Engine.engine.setGameAttribute("ask", "null");
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Theodore:You're lucky we just find out that couldn't have killed the victime.";
					getActor(21).disableActorDrawing();
					Engine.engine.setGameAttribute("ShowPrec", -1);
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(7), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_HoverQCMChoix1 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(8), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_HoverQCMChoix2 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(7), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_HoverQCMChoix1 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(8), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_HoverQCMChoix2 = false;
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}