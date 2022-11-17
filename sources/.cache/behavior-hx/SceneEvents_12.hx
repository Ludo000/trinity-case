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



class SceneEvents_12 extends SceneScript
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
	public var _Choix1:Bool;
	public var _Choix2:Bool;
	public var _Choix3:Bool;
	public var _descrperso:Array<Dynamic>;
	public var _hoverpreuve1:Bool;
	public var _hoverpreuve2:Bool;
	public var _hoverpreuve3:Bool;
	public var _QCM1:Bool;
	public var _QCM2:Bool;
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
	public var _PremierChoix:String;
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
		nameMap.set("Choix1", "_Choix1");
		_Choix1 = false;
		nameMap.set("Choix2", "_Choix2");
		_Choix2 = false;
		nameMap.set("Choix3", "_Choix3");
		_Choix3 = false;
		nameMap.set("descr_perso", "_descrperso");
		nameMap.set("hover preuve 1", "_hoverpreuve1");
		_hoverpreuve1 = false;
		nameMap.set("hover preuve 2", "_hoverpreuve2");
		_hoverpreuve2 = false;
		nameMap.set("hover preuve 3", "_hoverpreuve3");
		_hoverpreuve3 = false;
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
		nameMap.set("PremierChoix", "_PremierChoix");
		_PremierChoix = "";
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
		getActor(29).disableActorDrawing();
		getActor(32).disableActorDrawing();
		_hoverpreuve4 = false;
		_Choix1 = false;
		_afficherlafiche = false;
		_HoverQCMChoix1 = false;
		_HoverQCMChoix2 = false;
		_QCM1 = false;
		_Rap20 = false;
		_hoverpreuve1 = false;
		_hoverpreuve2 = false;
		_hoverpreuve3 = false;
		_taillemotespace = 0;
		_linelenght = 0;
		_CurrentLine = 0;
		_descc = "";
		_recap = "";
		
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
						if(((Engine.engine.getGameAttribute("PersoFeel") : String) == "content"))
						{
							getActor(30).setAnimation("content");
						}
						else if(((Engine.engine.getGameAttribute("PersoFeel") : String) == "colere"))
						{
							getActor(30).setAnimation("colere");
						}
						else if(((Engine.engine.getGameAttribute("PersoFeel") : String) == "normal"))
						{
							getActor(30).setAnimation("normal");
						}
						if(((((Engine.engine.getGameAttribute("ask") : String) == "C1") || ((Engine.engine.getGameAttribute("ask") : String) == "C2")) || ((Engine.engine.getGameAttribute("ask") : String) == "C3")))
						{
							getActor(17).enableActorDrawing();
							Engine.engine.setGameAttribute("ShowNext", false);
							Engine.engine.setGameAttribute("ShowPrec", -1);
						}
						else if((((Engine.engine.getGameAttribute("ask") : String) == "Q1") && !((Engine.engine.getGameAttribute("Q1") : Bool))))
						{
							Engine.engine.setGameAttribute("ShowChoice", true);
							Engine.engine.setGameAttribute("ShowNext", false);
						}
						else if((((Engine.engine.getGameAttribute("ask") : String) == "Q2") && !((Engine.engine.getGameAttribute("Q2") : Bool))))
						{
							Engine.engine.setGameAttribute("ShowChoice", true);
							Engine.engine.setGameAttribute("ShowNext", false);
						}
						else if((((Engine.engine.getGameAttribute("ask") : String) == "Q3") && !((Engine.engine.getGameAttribute("Q3") : Bool))))
						{
							Engine.engine.setGameAttribute("ShowChoice", true);
							Engine.engine.setGameAttribute("ShowNext", false);
						}
						else if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_1"))
						{
							Engine.engine.setGameAttribute("ShowNext", false);
							getActor(21).enableActorDrawing();
							g.setFont(getFont(26));
							g.drawString("" + "- I think his love his the one who tell him to kill.", (getActor(21).getX() + 20), (getActor(21).getY() + 50));
							g.drawString("" + "- I think his love his not the one who gave order to him.", (getActor(21).getX() + 20), (getActor(21).getY() + 80));
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
						else if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_2"))
						{
							Engine.engine.setGameAttribute("ShowNext", false);
							getActor(21).enableActorDrawing();
							g.setFont(getFont(26));
							g.drawString("" + "- Blanche is the one who gave order, Sophie is his loved one.", (getActor(21).getX() + 20), (getActor(21).getY() + 50));
							g.drawString("" + "-Sophie is the one who gave order, Blanche is his loved one.", (getActor(21).getX() + 20), (getActor(21).getY() + 80));
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
						else if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_3"))
						{
							Engine.engine.setGameAttribute("ShowNext", false);
							getActor(21).enableActorDrawing();
							g.setFont(getFont(26));
							g.drawString("" + "- Blanche is his mistress.", (getActor(21).getX() + 20), (getActor(21).getY() + 50));
							g.drawString("" + "- Blanche is his love.", (getActor(21).getX() + 20), (getActor(21).getY() + 80));
							g.drawString("" + "- Blanche is dead.", (getActor(21).getX() + 20), (getActor(21).getY() + 110));
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
							else if(_HoverQCMChoix3)
							{
								g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
								g.strokeSize = 5;
								g.drawRect((getActor(21).getX() + 15), (getActor(21).getY() + 105), 600, 30);
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
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore:Listen I won't lie to you we know that you killed all these women !";
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Theodore:But if you'r cooperative we can make your life easier !";
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).splice(Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 2)), 1);
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).remove(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 3));
							}
							else if(((Engine.engine.getGameAttribute("QKarma") : String) == "bad"))
							{
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore:Good question ! Why are you here ?";
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Theodore:In my opinion with all the women you killed you should be in some dark hole.";
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 2))] = "Theodore:But luckily we're interested in your 'friend'.";
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 3))] = "Theodore:So talk and maybe you'll get a bigger hole for the rest of your life!";
							}
						}
						else if((Engine.engine.getGameAttribute("Q2") : Bool))
						{
							Engine.engine.setGameAttribute("Q2", false);
							if(((Engine.engine.getGameAttribute("QKarma") : String) == "good"))
							{
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore:You're obviously ill, tell me who gave the order to you might go to a psychatric hospital after that.";
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).splice(Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1)), 1);
							}
							else if(((Engine.engine.getGameAttribute("QKarma") : String) == "bad"))
							{
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore:Enough of that !";
								(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Theodore:Tell me the name now !";
							}
						}
						if(((Engine.engine.getGameAttribute("Levent") : String) == "Rapport20ans"))
						{
							_Rap20 = true;
						}
					}
					else
					{
						if(((Engine.engine.getGameAttribute("page_carnet") : Float) == 1))
						{
							Engine.engine.setGameAttribute("ShowFiche", false);
							g.setFont(getFont(25));
							g.drawString("" + "Mirror's Muderer", (getActor(12).getX() + 380), (getActor(12).getY() + 100));
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
						}
						else if(((Engine.engine.getGameAttribute("page_carnet") : Float) == 3))
						{
							Engine.engine.setGameAttribute("ShowFiche", false);
							g.setFont(getFont(25));
							g.drawString("" + "", (getActor(12).getX() + 380), (getActor(12).getY() + 100));
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
							if(_Rap20)
							{
								getActor(32).enableActorDrawing();
							}
							else
							{
								getActor(32).disableActorDrawing();
							}
							g.setFont(getFont(26));
							g.drawString("" + "Case #4701 : Mr Eric Johnson", (scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(28)) : Float), (scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(28), 0) : Float));
							g.drawString("" + "The 11 victimes of the Mirrors Murderer", (scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(27)) : Float), (scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(27), 0) : Float));
							g.drawString("" + "Case #4702 : Mr Jean Collibris", (scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(31)) : Float), (scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(31), 0) : Float));
							if(_Rap20)
							{
								g.drawString("" + "Case #4242 : Four kids missing", (scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(32)) : Float), (scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(32), 0) : Float));
							}
							if(_hoverpreuve1)
							{
								g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
								g.strokeSize = 5;
								g.drawRect((getActor(28).getX() - 10), (getActor(28).getY() - 10), 500, ((getActor(28).getHeight()) + 20));
							}
							else if(_hoverpreuve2)
							{
								g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
								g.strokeSize = 5;
								g.drawRect((getActor(27).getX() - 10), (getActor(27).getY() - 10), 500, ((getActor(27).getHeight()) + 20));
							}
							else if(_hoverpreuve3)
							{
								g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
								g.strokeSize = 5;
								g.drawRect((getActor(31).getX() - 10), (getActor(31).getY() - 10), 500, ((getActor(31).getHeight()) + 20));
							}
							else if((_hoverpreuve4 && _Rap20))
							{
								g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
								g.strokeSize = 5;
								g.drawRect((getActor(32).getX() - 10), (getActor(32).getY() - 10), 500, ((getActor(32).getHeight()) + 20));
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
					switchScene(GameModel.get().scenes.get(35).getID(), createFadeOut(1, Utils.getColorRGB(0,0,0)), createFadeIn(1, Utils.getColorRGB(0,0,0)));
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
		addMouseOverActorListener(getRegion(1), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(!((Engine.engine.getGameAttribute("ShowEvidences") : Bool)))
				{
					Engine.engine.setGameAttribute("page_carnet", 2);
					playSound(getSound(158));
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
					Engine.engine.setGameAttribute("ShowEvidences", false);
					playSound(getSound(158));
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
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(4), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
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
				if((!((Engine.engine.getGameAttribute("carnet_hide") : Bool)) && ((Engine.engine.getGameAttribute("page_carnet") : Float) == 4)))
				{
					Engine.engine.setGameAttribute("showFiche11victime", !((Engine.engine.getGameAttribute("showFiche11victime") : Bool)));
					Engine.engine.setGameAttribute("showFicheTexte", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hoverpreuve3 = true;
				if((!((Engine.engine.getGameAttribute("carnet_hide") : Bool)) && ((Engine.engine.getGameAttribute("page_carnet") : Float) == 4)))
				{
					Engine.engine.setGameAttribute("showFiche11victime", false);
					Engine.engine.setGameAttribute("nom_case", "Case #7402");
					Engine.engine.setGameAttribute("nom_temoin", "Mr Jean Collibris");
					Engine.engine.setGameAttribute("desc_perso", "35 years old <br> 1m82 <br> Chief at \"La Bonne Omelette\" <br> <br> Suspect for the case #7402");
					Engine.engine.setGameAttribute("texte_temoin", "He called himself Theodore Lawliet [...] he was tall, blond and got a reedy voice [...] <br> I also remember he was always licking his upper lip [...] <br> I met him while I was collecting mushroom int the forest. I was lost this day and I fell into some sort of cave [...] <br> the near wasn't properly cleared, but it was strange the cave <br> seemed to have been set up as an atomic bunker [...] <br> there was this big iron door wich was closed with a keypad next to it [...] <br> there was an railway near the place [...] <br> there was also an old mirador [...]");
					Engine.engine.setGameAttribute("showFicheTexte", true);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(12), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hoverpreuve4 = true;
				if(((!((Engine.engine.getGameAttribute("carnet_hide") : Bool)) && ((Engine.engine.getGameAttribute("page_carnet") : Float) == 4)) && _Rap20))
				{
					Engine.engine.setGameAttribute("showFiche11victime", false);
					Engine.engine.setGameAttribute("nom_case", "Case #4242");
					Engine.engine.setGameAttribute("nom_temoin", "Pierre Dubeaufeu");
					Engine.engine.setGameAttribute("desc_perso", "1m95");
					Engine.engine.setGameAttribute("texte_temoin", "He was found during his youth, in the same cave where he just got arrested, after having disappeared six days with Kevin Schmidt, Blanche Delafleure and Sophie Lys, the last one found dead, mutilated. <br>  The report on this case established that they ate the flesh of Sophie's body to stay alive, nothing suggest if she's dead from hunger or if it was a murder. <br> Those five kids were placed in a psychiatric hospital after being considered unsuitable for the society. <br> The 10 June 2010, they fled from the hospital, and completly disappeared withtout leaving a trace. ");
					Engine.engine.setGameAttribute("showFicheTexte", true);
				}
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
		addMouseOverActorListener(getRegion(12), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_hoverpreuve4 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(4), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((!((Engine.engine.getGameAttribute("carnet_hide") : Bool)) && ((Engine.engine.getGameAttribute("page_carnet") : Float) == 4)))
				{
					if(((Engine.engine.getGameAttribute("ask") : String) == "C1"))
					{
						Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
						Engine.engine.setGameAttribute("ShowNext", true);
						Engine.engine.setGameAttribute("ask", "null");
						Engine.engine.setGameAttribute("ShowPrec", -1);
						playSound(getSound(184));
						_PremierChoix = "John";
					}
					else if((((Engine.engine.getGameAttribute("ask") : String) == "C2") && (_PremierChoix == "Col")))
					{
						Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
						playSound(getSound(184));
						Engine.engine.setGameAttribute("ask", "null");
						Engine.engine.setGameAttribute("ShowNext", true);
						Engine.engine.setGameAttribute("ShowPrec", -1);
					}
					else
					{
						Engine.engine.setGameAttribute("Perd1Pv", true);
					}
					Engine.engine.setGameAttribute("carnet_hide", true);
					Engine.engine.setGameAttribute("ShowEvidences", false);
					Engine.engine.setGameAttribute("ShowFiche", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(5), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((!((Engine.engine.getGameAttribute("carnet_hide") : Bool)) && ((Engine.engine.getGameAttribute("page_carnet") : Float) == 4)))
				{
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("carnet_hide", true);
					Engine.engine.setGameAttribute("ShowEvidences", false);
					Engine.engine.setGameAttribute("ShowFiche", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((!((Engine.engine.getGameAttribute("carnet_hide") : Bool)) && ((Engine.engine.getGameAttribute("page_carnet") : Float) == 4)))
				{
					if(((Engine.engine.getGameAttribute("ask") : String) == "C1"))
					{
						Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
						Engine.engine.setGameAttribute("ask", "null");
						Engine.engine.setGameAttribute("ShowNext", true);
						playSound(getSound(184));
						Engine.engine.setGameAttribute("ShowPrec", -1);
						_PremierChoix = "Col";
					}
					else if((((Engine.engine.getGameAttribute("ask") : String) == "C2") && (_PremierChoix == "John")))
					{
						Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
						playSound(getSound(184));
						Engine.engine.setGameAttribute("ask", "null");
						Engine.engine.setGameAttribute("ShowNext", true);
						Engine.engine.setGameAttribute("ShowPrec", -1);
					}
					else
					{
						Engine.engine.setGameAttribute("Perd1Pv", true);
					}
					Engine.engine.setGameAttribute("carnet_hide", true);
					Engine.engine.setGameAttribute("ShowEvidences", false);
					Engine.engine.setGameAttribute("ShowFiche", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(12), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(_Rap20)
				{
					if((!((Engine.engine.getGameAttribute("carnet_hide") : Bool)) && ((Engine.engine.getGameAttribute("page_carnet") : Float) == 4)))
					{
						if(((Engine.engine.getGameAttribute("ask") : String) == "C3"))
						{
							Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
							playSound(getSound(184));
							Engine.engine.setGameAttribute("ask", "null");
							Engine.engine.setGameAttribute("ShowNext", true);
							Engine.engine.setGameAttribute("ShowPrec", -1);
						}
						else
						{
							Engine.engine.setGameAttribute("Perd1Pv", true);
						}
						Engine.engine.setGameAttribute("carnet_hide", true);
						Engine.engine.setGameAttribute("ShowEvidences", false);
						Engine.engine.setGameAttribute("ShowFiche", false);
					}
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
					playSound(getSound(224));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Theodore:No, he mentioned two women...";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					getActor(21).disableActorDrawing();
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
				}
				else if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_2"))
				{
					playSound(getSound(224));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Theodore:Okay Blanche gave the order I get that.";
					getActor(21).disableActorDrawing();
					Engine.engine.setGameAttribute("ShowPrec", -1);
					Engine.engine.setGameAttribute("ask", "null");
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					Engine.engine.setGameAttribute("ShowNext", true);
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
					playSound(getSound(224));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Theodore:So a woment told you to kill eleven poor girl?";
					getActor(21).disableActorDrawing();
					Engine.engine.setGameAttribute("ShowPrec", -1);
					Engine.engine.setGameAttribute("ask", "null");
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					Engine.engine.setGameAttribute("ShowNext", true);
				}
				else if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_2"))
				{
					playSound(getSound(224));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Theodore:No, Sophie was never founded, she is probably dead.";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					getActor(21).disableActorDrawing();
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