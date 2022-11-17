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



class SceneEvents_11 extends SceneScript
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
	public var _Aclicks:Bool;
	public var _clic:Float;
	public var _Aclicks2:Bool;
	public var _chiffreclicked:Bool;
	public var _consoleclicked:Bool;
	public var _showzoomchiffre:Bool;
	public var _codeShow:Float;
	public var _couleur:Bool;
	public var _hashoot:Bool;
	public var _hoverconsole:Bool;
	public var _hoverchiffre:Bool;
	public var _hover1:Bool;
	public var _hover2:Bool;
	public var _hover3:Bool;
	public var _hover4:Bool;
	public var _hover5:Bool;
	public var _hover6:Bool;
	public var _hover7:Bool;
	public var _hover8:Bool;
	public var _hover9:Bool;
	public var _hover0:Bool;
	public var _wasplayed:Bool;
	
	
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
		nameMap.set("Aclicks", "_Aclicks");
		_Aclicks = false;
		nameMap.set("clic", "_clic");
		_clic = 0.0;
		nameMap.set("Aclicks2", "_Aclicks2");
		_Aclicks2 = false;
		nameMap.set("chiffre_clicked", "_chiffreclicked");
		_chiffreclicked = false;
		nameMap.set("console_clicked", "_consoleclicked");
		_consoleclicked = false;
		nameMap.set("show_zoom_chiffre", "_showzoomchiffre");
		_showzoomchiffre = false;
		nameMap.set("codeShow", "_codeShow");
		_codeShow = 0.0;
		nameMap.set("couleur", "_couleur");
		_couleur = false;
		nameMap.set("hashoot", "_hashoot");
		_hashoot = false;
		nameMap.set("hoverconsole", "_hoverconsole");
		_hoverconsole = false;
		nameMap.set("hoverchiffre", "_hoverchiffre");
		_hoverchiffre = false;
		nameMap.set("hover1", "_hover1");
		_hover1 = false;
		nameMap.set("hover2", "_hover2");
		_hover2 = false;
		nameMap.set("hover3", "_hover3");
		_hover3 = false;
		nameMap.set("hover4", "_hover4");
		_hover4 = false;
		nameMap.set("hover5", "_hover5");
		_hover5 = false;
		nameMap.set("hover6", "_hover6");
		_hover6 = false;
		nameMap.set("hover7", "_hover7");
		_hover7 = false;
		nameMap.set("hover8", "_hover8");
		_hover8 = false;
		nameMap.set("hover9", "_hover9");
		_hover9 = false;
		nameMap.set("hover0", "_hover0");
		_hover0 = false;
		nameMap.set("wasplayed", "_wasplayed");
		_wasplayed = false;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		scripts.SceneEvents_3._customBlock_reinitialisation_pour_nouvelle_scene();
		Engine.engine.setGameAttribute("showAnna", true);
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(25), (Engine.engine.getGameAttribute("pos_vie_x") : Float), (Engine.engine.getGameAttribute("pos_vie_y") : Float));
		getActor(24).setY((Engine.engine.getGameAttribute("pos_fleche_karma_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(23), (Engine.engine.getGameAttribute("pos_karma_bar_x") : Float), (Engine.engine.getGameAttribute("pos_karma_bar_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(6), (Engine.engine.getGameAttribute("pos_choix_gauche_x") : Float), (Engine.engine.getGameAttribute("pos_choix_gauche_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(10), (Engine.engine.getGameAttribute("pos_choix_centre_x") : Float), (Engine.engine.getGameAttribute("pos_choix_centre_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(7), (Engine.engine.getGameAttribute("pos_choix_droite_x") : Float), (Engine.engine.getGameAttribute("pos_choix_droite_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(4), (Engine.engine.getGameAttribute("pos_fleche_x") : Float), (Engine.engine.getGameAttribute("pos_fleche_y") : Float));
		scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(3), (Engine.engine.getGameAttribute("pos_points_x") : Float), (Engine.engine.getGameAttribute("pos_points_y") : Float));
		hideTileLayer(engine.getLayerByName("zomm_chifffre_bas"));
		hideTileLayer(engine.getLayerByName("cadavres"));
		getActor(17).disableActorDrawing();
		getActor(21).disableActorDrawing();
		_positionSurX = getActor(18).getX();
		_positionSurY = getActor(18).getY();
		getActor(26).disableActorDrawing();
		getActor(21).setX(_positionSurX);
		getActor(21).setY(_positionSurY);
		getActor(20).setX(_positionSurX);
		getActor(20).setY(_positionSurY);
		getActor(19).setX(_positionSurX);
		getActor(19).setY(_positionSurY);
		_wasplayed = false;
		_couleur = false;
		_Aclicks = false;
		_hashoot = false;
		_HoverQCMChoix2 = false;
		_HoverQCMChoix2 = false;
		_HoverQCMChoix1 = false;
		_HoverQCMChoix4 = false;
		_HoverQCMChoix5 = false;
		_hoverconsole = false;
		_hoverchiffre = false;
		_Aclicks2 = false;
		_consoleclicked = false;
		_chiffreclicked = false;
		_codeShow = 0;
		_clic = 0;
		_linelenght = 0;
		_CurrentLine = 0;
		_WordList = new Array<Dynamic>();
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				getActor(24).setX(((Engine.engine.getGameAttribute("pos_fleche_karma") : Float) + (Engine.engine.getGameAttribute("karma") : Float)));
				if(((Engine.engine.getGameAttribute("NumDialogue") : Float) <= (Engine.engine.getGameAttribute("MaxDialogue") : Float)))
				{
					if((Engine.engine.getGameAttribute("showAnna") : Bool))
					{
						getActor(20).enableActorDrawing();
						getActor(18).enableActorDrawing();
						getActor(19).enableActorDrawing();
					}
					else
					{
						getActor(20).disableActorDrawing();
						getActor(18).disableActorDrawing();
						getActor(19).disableActorDrawing();
					}
					if((0 < (Engine.engine.getGameAttribute("ShowPrec") : Float)))
					{
						g.setFont(getFont(2));
						g.drawString("" + (Engine.engine.getGameAttribute("ShowPrec") : Float), 1811, 884);
					}
					scripts.SceneEvents_3._customBlock_gestion_emotion_anna_adulte((Engine.engine.getGameAttribute("PersoFeel") : String), getActor(19), getActor(20), getLastCreatedActor(), getActor(18), getActor(21));
					if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_1"))
					{
						Engine.engine.setGameAttribute("ShowNext", false);
						getActor(26).enableActorDrawing();
						g.setFont(getFont(26));
						g.drawString("" + "- Shouting like madmans hopping someone hears us.", (getActor(26).getX() + 20), (getActor(26).getY() + 50));
						g.drawString("" + "- Ram the door until it gives away", (getActor(26).getX() + 20), (getActor(26).getY() + 80));
						g.drawString("" + "- Call help with my phone.", (getActor(26).getX() + 20), (getActor(26).getY() + 110));
						if(_HoverQCMChoix1)
						{
							g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
							g.strokeSize = 5;
							g.drawRect((getActor(26).getX() + 15), (getActor(26).getY() + 45), 600, 30);
						}
						else if(_HoverQCMChoix2)
						{
							g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
							g.strokeSize = 5;
							g.drawRect((getActor(26).getX() + 15), (getActor(26).getY() + 75), 600, 30);
						}
						else if(_HoverQCMChoix3)
						{
							g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
							g.strokeSize = 5;
							g.drawRect((getActor(26).getX() + 15), (getActor(26).getY() + 105), 600, 30);
						}
					}
					else if((((Engine.engine.getGameAttribute("ask") : String) == "clicks") || ((Engine.engine.getGameAttribute("ask") : String) == "clicks2")))
					{
						Engine.engine.setGameAttribute("showAnna", false);
						Engine.engine.setGameAttribute("ShowNext", false);
						Engine.engine.setGameAttribute("ShowDialog", false);
						g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
						g.strokeSize = 5;
						if(_hoverconsole)
						{
							g.drawRect(getRegion(3).getX(), getRegion(3).getY(), getRegion(3).getWidth(), getRegion(3).getHeight());
						}
						else if(_hoverchiffre)
						{
							g.drawRect(getRegion(4).getX(), getRegion(4).getY(), getRegion(4).getWidth(), getRegion(4).getHeight());
						}
					}
					else if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_2"))
					{
						Engine.engine.setGameAttribute("ShowNext", false);
						getActor(26).enableActorDrawing();
						g.setFont(getFont(26));
						g.drawString("" + "- You probably got it wrong, try the first code again !", (getActor(26).getX() + 20), (getActor(26).getY() + 50));
						g.drawString("" + "- It must be defective.", (getActor(26).getX() + 20), (getActor(26).getY() + 80));
						g.drawString("" + "- He denies the acces when the number doesn't match.", (getActor(26).getX() + 20), (getActor(26).getY() + 110));
						if(_HoverQCMChoix1)
						{
							g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
							g.strokeSize = 5;
							g.drawRect((getActor(26).getX() + 15), (getActor(26).getY() + 45), 600, 30);
						}
						else if(_HoverQCMChoix2)
						{
							g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
							g.strokeSize = 5;
							g.drawRect((getActor(26).getX() + 15), (getActor(26).getY() + 75), 600, 30);
						}
						else if(_HoverQCMChoix3)
						{
							g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
							g.strokeSize = 5;
							g.drawRect((getActor(26).getX() + 15), (getActor(26).getY() + 105), 600, 30);
						}
					}
					else if(((Engine.engine.getGameAttribute("ask") : String) == "show_chiffre"))
					{
						showTileLayer(engine.getLayerByName("zomm_chifffre_bas"));
						Engine.engine.setGameAttribute("showAnna", false);
					}
					else if(((Engine.engine.getGameAttribute("ask") : String) == "console"))
					{
						hideTileLayer(engine.getLayerByName("grotte_4"));
						g.drawString("" + _codeShow, getRegion(15).getX(), getRegion(15).getY());
						g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
						g.strokeSize = 5;
						if(_hover9)
						{
							g.drawRect(getRegion(13).getX(), getRegion(13).getY(), getRegion(13).getWidth(), getRegion(13).getHeight());
						}
						else if(_hover8)
						{
							g.drawRect(getRegion(12).getX(), getRegion(12).getY(), getRegion(12).getWidth(), getRegion(12).getHeight());
						}
						else if(_hover7)
						{
							g.drawRect(getRegion(11).getX(), getRegion(11).getY(), getRegion(11).getWidth(), getRegion(11).getHeight());
						}
						else if(_hover6)
						{
							g.drawRect(getRegion(10).getX(), getRegion(10).getY(), getRegion(10).getWidth(), getRegion(10).getHeight());
						}
						else if(_hover5)
						{
							g.drawRect(getRegion(9).getX(), getRegion(9).getY(), getRegion(9).getWidth(), getRegion(9).getHeight());
						}
						else if(_hover4)
						{
							g.drawRect(getRegion(8).getX(), getRegion(8).getY(), getRegion(8).getWidth(), getRegion(8).getHeight());
						}
						else if(_hover3)
						{
							g.drawRect(getRegion(7).getX(), getRegion(7).getY(), getRegion(7).getWidth(), getRegion(7).getHeight());
						}
						else if(_hover2)
						{
							g.drawRect(getRegion(6).getX(), getRegion(6).getY(), getRegion(6).getWidth(), getRegion(6).getHeight());
						}
						else if(_hover1)
						{
							g.drawRect(getRegion(5).getX(), getRegion(5).getY(), getRegion(5).getWidth(), getRegion(5).getHeight());
						}
						else if(_hover0)
						{
							g.drawRect(getRegion(14).getX(), getRegion(14).getY(), getRegion(14).getWidth(), getRegion(14).getHeight());
						}
						Engine.engine.setGameAttribute("ShowDialog", false);
						Engine.engine.setGameAttribute("showAnna", false);
						Engine.engine.setGameAttribute("ShowNext", false);
					}
					else if(((Engine.engine.getGameAttribute("ask") : String) == "console2"))
					{
						g.drawString("" + _codeShow, getRegion(15).getX(), getRegion(15).getY());
						Engine.engine.setGameAttribute("ShowDialog", false);
						Engine.engine.setGameAttribute("showAnna", false);
						Engine.engine.setGameAttribute("ShowNext", true);
					}
					else if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_3"))
					{
						Engine.engine.setGameAttribute("ShowNext", false);
						getActor(26).enableActorDrawing();
						g.setFont(getFont(26));
						g.drawString("" + "- Try to eat Anna, apparently, she tastes like chicken...", (getActor(26).getX() + 20), (getActor(26).getY() + 50));
						g.drawString("" + "- Dig a hole with my phone.", (getActor(26).getX() + 20), (getActor(26).getY() + 80));
						g.drawString("" + "- Examine the phone closely.", (getActor(26).getX() + 20), (getActor(26).getY() + 110));
						if(_HoverQCMChoix1)
						{
							g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
							g.strokeSize = 5;
							g.drawRect((getActor(26).getX() + 15), (getActor(26).getY() + 45), 600, 30);
						}
						else if(_HoverQCMChoix2)
						{
							g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
							g.strokeSize = 5;
							g.drawRect((getActor(26).getX() + 15), (getActor(26).getY() + 75), 600, 30);
						}
						else if(_HoverQCMChoix3)
						{
							g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
							g.strokeSize = 5;
							g.drawRect((getActor(26).getX() + 15), (getActor(26).getY() + 105), 600, 30);
						}
					}
					else if(((Engine.engine.getGameAttribute("ask") : String) == "phase_shout"))
					{
						hideTileLayer(engine.getLayerByName("grotte_7"));
						hideTileLayer(engine.getLayerByName("cadavres"));
						if(!(_wasplayed))
						{
							playSound(getSound(187));
							_wasplayed = true;
						}
						g.strokeSize = 5;
						if(_couleur)
						{
							g.fillColor = Utils.convertColor(Utils.getColorRGB(0,0,0));
						}
						else
						{
							g.fillColor = Utils.convertColor(Utils.getColorRGB(255,51,51));
						}
						if(!(_hashoot))
						{
							g.setFont(getFont(19));
							g.drawString("" + "Shoot", 780, 700);
							g.drawRect(getRegion(16).getX(), getRegion(16).getY(), getRegion(16).getWidth(), getRegion(16).getHeight());
						}
						Engine.engine.setGameAttribute("showAnna", false);
						Engine.engine.setGameAttribute("ShowDialog", false);
						Engine.engine.setGameAttribute("ShowNext", false);
						runLater(1000 * 2, function(timeTask:TimedTask):Void
						{
							if(!(_hashoot))
							{
								reloadCurrentScene(createPixelizeOut(0.2, Utils.getColorRGB(0,0,0)), createFadeIn(1, Utils.getColorRGB(0,0,0)));
							}
						}, null);
					}
					else if(((Engine.engine.getGameAttribute("ask") : String) == "dontnext"))
					{
						Engine.engine.setGameAttribute("ShowNext", false);
					}
					else if(((Engine.engine.getGameAttribute("ask") : String) == "anna_part"))
					{
						Engine.engine.setGameAttribute("showAnna", false);
					}
					else
					{
						getActor(17).disableActorDrawing();
						Engine.engine.setGameAttribute("ShowChoice", false);
						Engine.engine.setGameAttribute("ShowDialog", true);
						hideTileLayer(engine.getLayerByName("zomm_chifffre_bas"));
					}
					if(((Engine.engine.getGameAttribute("Levent") : String) == "grotte_1"))
					{
						hideTileLayer(engine.getLayerByName("grotte"));
					}
					else if(((Engine.engine.getGameAttribute("Levent") : String) == "grotte_2"))
					{
						hideTileLayer(engine.getLayerByName("grotte_1"));
					}
					else if(((Engine.engine.getGameAttribute("Levent") : String) == "grotte_4"))
					{
						hideTileLayer(engine.getLayerByName("grotte_3_2"));
					}
					else if(((Engine.engine.getGameAttribute("Levent") : String) == "grotte_6"))
					{
						hideTileLayer(engine.getLayerByName("grotte_5"));
						Engine.engine.setGameAttribute("showAnna", true);
					}
					else if(((Engine.engine.getGameAttribute("Levent") : String) == "grotte_7"))
					{
						Engine.engine.setGameAttribute("showAnna", true);
						hideTileLayer(engine.getLayerByName("grotte_6"));
						showTileLayer(engine.getLayerByName("cadavres"));
					}
					else if(((Engine.engine.getGameAttribute("Levent") : String) == "fondu"))
					{
						hideTileLayer(engine.getLayerByName("grotte_3"));
						Engine.engine.setGameAttribute("showAnna", false);
					}
					else if(((Engine.engine.getGameAttribute("Levent") : String) == "show_chiffre"))
					{
						showTileLayer(engine.getLayerByName("zomm_chifffre_bas"));
						Engine.engine.setGameAttribute("showAnna", false);
					}
					else
					{
						hideTileLayer(engine.getLayerByName("zomm_chifffre_bas"));
					}
					if((Engine.engine.getGameAttribute("ShowDialog") : Bool))
					{
						getActor(2).enableActorDrawing();
						/* DIALOGUE */
						if((_Interlocuteur == "himself"))
						{
							g.setFont(getFont(31));
							getActor(2).setAnimation("normal");
							_curfont = "normal";
						}
						else
						{
							getActor(2).setAnimation("normal");
							g.setFont(getFont(82));
							g.drawString("" + _Interlocuteur, (getActor(2).getX() + 45), (getActor(2).getY() + 25));
							g.setFont(getFont(2));
						}
						_CurrentLine = 0;
						_linelenght = 0;
						for(item in cast(_WordList, Array<Dynamic>))
						{
							if((_curfont == "eve"))
							{
								_taillemotespace = (getFont(118).getTextWidth("" + item)/Engine.SCALE + getFont(118).getTextWidth(" ")/Engine.SCALE);
							}
							else if((_curfont == "himself"))
							{
								_taillemotespace = (getFont(31).getTextWidth("" + item)/Engine.SCALE + getFont(31).getTextWidth(" ")/Engine.SCALE);
							}
							else
							{
								_taillemotespace = (getFont(2).getTextWidth("" + item)/Engine.SCALE + getFont(2).getTextWidth(" ")/Engine.SCALE);
							}
							g.drawString("" + item, (_linelenght + (getActor(2).getX() + 30)), (_CurrentLine + (getActor(2).getY() + 80)));
							_linelenght += _taillemotespace;
							if((_linelenght > 1400))
							{
								_CurrentLine += (getFont(2).getHeight()/Engine.SCALE + 5);
								_linelenght = 0;
							}
						}
					}
					else
					{
						getActor(2).disableActorDrawing();
					}
				}
				else
				{
					switchScene(GameModel.get().scenes.get(34).getID(), createFadeOut(1, Utils.getColorRGB(0,0,0)), createFadeIn(1, Utils.getColorRGB(0,0,0)));
				}
			}
		});
		
		/* ======================= Every N seconds ======================== */
		runPeriodically(1000 * 1, function(timeTask:TimedTask):Void
		{
			if(wrapper.enabled)
			{
				_couleur = !(_couleur);
			}
		}, null);
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(16), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("ask") : String) == "phase_shout"))
				{
					hideTileLayer(engine.getLayerByName("phase_shout"));
					runLater(1000 * 1, function(timeTask:TimedTask):Void
					{
						hideTileLayer(engine.getLayerByName("shout"));
						runLater(1000 * 1, function(timeTask:TimedTask):Void
						{
							hideTileLayer(engine.getLayerByName("hadshoot"));
							showTileLayer(engine.getLayerByName("cadavres"));
							Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
							Engine.engine.setGameAttribute("ShowDialog", true);
							Engine.engine.setGameAttribute("showAnna", true);
							Engine.engine.setGameAttribute("ShowPrec", -1);
							Engine.engine.setGameAttribute("ShowNext", true);
							Engine.engine.setGameAttribute("ask", "null");
						}, null);
					}, null);
					_hashoot = true;
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
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Anna : Don't say stupid things, we're like ten meter underground... : enerve";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					getActor(26).disableActorDrawing();
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
				}
				else if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_2"))
				{
					playSound(getSound(224));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Anna : Do you take my for a child ?! : enerve";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					getActor(26).disableActorDrawing();
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
				}
				else if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_3"))
				{
					playSound(getSound(224));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "himself : No that's not okay ! What's taking me !";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					getActor(26).disableActorDrawing();
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
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
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Ah men... This door looks like it was made with reinforced steel, it probably won't give : decu";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					getActor(26).disableActorDrawing();
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
				}
				else if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_2"))
				{
					playSound(getSound(224));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Anna : Don't think so, it's on and asking for a code. : decu";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					getActor(26).disableActorDrawing();
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
				}
				else if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_3"))
				{
					playSound(getSound(224));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "himself : What am I thinking ? We're on rocks !";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					getActor(26).disableActorDrawing();
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
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
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Anna : Good idea ! : content";
					getActor(26).disableActorDrawing();
					Engine.engine.setGameAttribute("ShowPrec", -1);
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					Engine.engine.setGameAttribute("ShowNext", true);
					Engine.engine.setGameAttribute("ask", "null");
				}
				else if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_2"))
				{
					playSound(getSound(224));
					Engine.engine.setGameAttribute("ShowNext", true);
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Anna : Yeah seems so, so we got a number but there's 4 more, it makes too much possibilities... : decu";
					getActor(26).disableActorDrawing();
					Engine.engine.setGameAttribute("ShowPrec", -1);
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					Engine.engine.setGameAttribute("ask", "null");
				}
				else if(((Engine.engine.getGameAttribute("ask") : String) == "QCM_3"))
				{
					playSound(getSound(224));
					Engine.engine.setGameAttribute("ShowNext", true);
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "himself : Hmmm...";
					getActor(26).disableActorDrawing();
					Engine.engine.setGameAttribute("ShowPrec", -1);
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
		addMouseOverActorListener(getRegion(1), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_HoverQCMChoix2 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(2), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_HoverQCMChoix3 = true;
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
		addMouseOverActorListener(getRegion(1), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_HoverQCMChoix2 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(2), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_HoverQCMChoix3 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(3), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((((Engine.engine.getGameAttribute("ask") : String) == "clicks") || ((Engine.engine.getGameAttribute("ask") : String) == "clicks2")))
				{
					if(!(_chiffreclicked))
					{
						Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
						Engine.engine.setGameAttribute("ShowNext", true);
						Engine.engine.setGameAttribute("ShowDialog", true);
						(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Anna : Looks like there's a command board on my side, yeah, there's a keypad, so there must be a code ! : content";
						(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Theodore : Good, let's try looking around. ";
						(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 2))] = " :  : : clicks2";
						Engine.engine.setGameAttribute("ShowPrec", -1);
						_consoleclicked = true;
						Engine.engine.setGameAttribute("ask", "null");
					}
					else if(_chiffreclicked)
					{
						Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
						Engine.engine.setGameAttribute("ShowNext", true);
						Engine.engine.setGameAttribute("ShowDialog", true);
						(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Anna : Looks like there's a command board on my side, yeah, there's a keypad, so there must be a code ! : content";
						(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Theodore : Good, let's try looking around.";
						Engine.engine.setGameAttribute("ShowPrec", -1);
						Engine.engine.setGameAttribute("ask", "null");
					}
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(4), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((((Engine.engine.getGameAttribute("ask") : String) == "clicks") || ((Engine.engine.getGameAttribute("ask") : String) == "clicks2")))
				{
					if(!(_consoleclicked))
					{
						Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
						Engine.engine.setGameAttribute("ShowNext", true);
						Engine.engine.setGameAttribute("ShowDialog", true);
						(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore : Here ! There is something written down with a marker ! : : : show_chiffre";
						(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Theodore : 52589, let's try looking around.";
						(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 2))] = " :  : : clicks2";
						_chiffreclicked = true;
						Engine.engine.setGameAttribute("ShowPrec", -1);
						Engine.engine.setGameAttribute("ask", "null");
					}
					else if(_consoleclicked)
					{
						Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
						Engine.engine.setGameAttribute("ShowNext", true);
						Engine.engine.setGameAttribute("ShowDialog", true);
						(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore : Here ! There is something written down with a marker ! : : : show_chiffre";
						(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int(((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1))] = "Theodore : Type 52589 on the keypad.";
						Engine.engine.setGameAttribute("ShowPrec", -1);
						Engine.engine.setGameAttribute("ask", "null");
					}
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(5), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("ask") : String) == "console"))
				{
					playSound(getSound(160));
					_codeShow = 0;
					_clic = 0;
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "himself : Access denied... : : dontnext";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					Engine.engine.setGameAttribute("ShowDialog", true);
					Engine.engine.setGameAttribute("showAnna", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((((Engine.engine.getGameAttribute("ask") : String) == "console") && (_clic == 3)))
				{
					_clic += 1;
					playSound(getSound(160));
					_codeShow = 5852;
				}
				else if(((Engine.engine.getGameAttribute("ask") : String) == "console"))
				{
					playSound(getSound(160));
					_codeShow = 0;
					_clic = 0;
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "himself : Access denied... : : dontnext";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					Engine.engine.setGameAttribute("ShowDialog", true);
					Engine.engine.setGameAttribute("showAnna", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(7), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((((Engine.engine.getGameAttribute("ask") : String) == "console") && (_clic == 4)))
				{
					_clic += 1;
					playSound(getSound(160));
					_codeShow = 58523;
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					Engine.engine.setGameAttribute("ShowNext", true);
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "Theodore : It's effectively 58523 ! : : console2";
					Engine.engine.setGameAttribute("ShowDialog", true);
					Engine.engine.setGameAttribute("ShowPrec", -1);
					Engine.engine.setGameAttribute("showAnna", false);
				}
				else if(((Engine.engine.getGameAttribute("ask") : String) == "console"))
				{
					_codeShow = 0;
					playSound(getSound(160));
					_clic = 0;
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "himself : Access denied...  : : dontnext";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					Engine.engine.setGameAttribute("ShowDialog", true);
					Engine.engine.setGameAttribute("showAnna", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(8), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("ask") : String) == "console"))
				{
					playSound(getSound(160));
					_codeShow = 0;
					_clic = 0;
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "himself : Access denied... : : dontnext";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowDialog", true);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					Engine.engine.setGameAttribute("showAnna", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(9), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((((Engine.engine.getGameAttribute("ask") : String) == "console") && (_clic == 0)))
				{
					_clic += 1;
					playSound(getSound(160));
					_codeShow = 5;
				}
				else if((((Engine.engine.getGameAttribute("ask") : String) == "console") && (_clic == 2)))
				{
					_clic += 1;
					playSound(getSound(160));
					_codeShow = 585;
				}
				else if(((Engine.engine.getGameAttribute("ask") : String) == "console"))
				{
					playSound(getSound(160));
					_codeShow = 0;
					_clic = 0;
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "himself : Access denied... : : dontnext";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowDialog", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					Engine.engine.setGameAttribute("showAnna", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(10), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("ask") : String) == "console"))
				{
					_codeShow = 0;
					_clic = 0;
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "himself : Access denied... : : dontnext";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowDialog", true);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					playSound(getSound(160));
					Engine.engine.setGameAttribute("showAnna", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(11), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("ask") : String) == "console"))
				{
					_codeShow = 0;
					_clic = 0;
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "himself : Access denied... : : dontnext";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowDialog", true);
					playSound(getSound(160));
					Engine.engine.setGameAttribute("ShowPrec", 1);
					Engine.engine.setGameAttribute("showAnna", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(12), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if((((Engine.engine.getGameAttribute("ask") : String) == "console") && (_clic == 1)))
				{
					_clic += 1;
					playSound(getSound(160));
					_codeShow = 58;
				}
				else if(((Engine.engine.getGameAttribute("ask") : String) == "console"))
				{
					_codeShow = 0;
					_clic = 0;
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "himself : Access denied... : : dontnext";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowDialog", true);
					playSound(getSound(160));
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					Engine.engine.setGameAttribute("showAnna", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(13), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("ask") : String) == "console"))
				{
					_codeShow = 0;
					_clic = 0;
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "himself : Access denied... : : dontnext";
					playSound(getSound(160));
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowDialog", true);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					Engine.engine.setGameAttribute("showAnna", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(14), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(((Engine.engine.getGameAttribute("ask") : String) == "console"))
				{
					_codeShow = 0;
					_clic = 0;
					Engine.engine.setGameAttribute("NumDialogue", ((Engine.engine.getGameAttribute("NumDialogue") : Float) + 1));
					(Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))] = "himself : Access denied... : : dontnext";
					Engine.engine.setGameAttribute("Perd1Pv", true);
					Engine.engine.setGameAttribute("ShowNext", false);
					Engine.engine.setGameAttribute("ShowDialog", true);
					Engine.engine.setGameAttribute("ShowPrec", 1);
					playSound(getSound(160));
					Engine.engine.setGameAttribute("showAnna", false);
				}
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(3), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hoverconsole = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(3), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_hoverconsole = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(4), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hoverchiffre = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(4), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_hoverchiffre = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(5), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hover1 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(5), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_hover1 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hover2 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_hover2 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(7), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hover3 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(7), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_hover3 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(8), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hover4 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(8), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_hover4 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(9), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hover5 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(9), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_hover5 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(10), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hover6 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(10), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_hover6 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(11), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hover7 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(11), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_hover7 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(12), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hover8 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(12), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_hover8 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(13), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hover9 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(13), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_hover9 = false;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(14), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				_hover0 = true;
			}
		});
		
		/* ========================== On Region =========================== */
		addMouseOverActorListener(getRegion(14), function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				_hover0 = false;
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}