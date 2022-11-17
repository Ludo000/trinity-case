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



class Design_86_86_dialog extends SceneScript
{
	public var _DialogueList:Array<Dynamic>;
	public var _LineList:Array<Dynamic>;
	public var _WordList:Array<Dynamic>;
	public var _PersoFeel:String;
	public var _Interlocuteur:String;
	public var _curfont:String;
	public var _CurrentLine:Float;
	public var _linelenght:Float;
	public var _taillemotespace:Float;
	public var _xx:Float;
	public var _jj:Float;
	public var _dialog:Actor;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Dialogue List", "_DialogueList");
		nameMap.set("Line List", "_LineList");
		nameMap.set("Word List", "_WordList");
		nameMap.set("PersoFeel", "_PersoFeel");
		_PersoFeel = "";
		nameMap.set("Interlocuteur", "_Interlocuteur");
		_Interlocuteur = "";
		nameMap.set("cur_font", "_curfont");
		_curfont = "";
		nameMap.set("Current Line", "_CurrentLine");
		_CurrentLine = 0.0;
		nameMap.set("line lenght", "_linelenght");
		_linelenght = 0.0;
		nameMap.set("taille motespace", "_taillemotespace");
		_taillemotespace = 0.0;
		nameMap.set("xx", "_xx");
		_xx = 0.0;
		nameMap.set("jj", "_jj");
		_jj = 0.0;
		nameMap.set("dialog", "_dialog");
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		Engine.engine.setGameAttribute("LineList", _LineList);
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				Engine.engine.setGameAttribute("MaxDialogue", ((Engine.engine.getGameAttribute("LineList") : Array<Dynamic>).length - 1));
				if((Engine.engine.getGameAttribute("carnet_hide") : Bool))
				{
					Engine.engine.setGameAttribute("Dialog list", ("" + (Engine.engine.getGameAttribute("LineList") : Array<Dynamic>)[Std.int((Engine.engine.getGameAttribute("NumDialogue") : Float))]).split(":"));
					_WordList = ("" + (Engine.engine.getGameAttribute("Dialog list") : Array<Dynamic>)[1]).split(" ");
					Engine.engine.setGameAttribute("PersoFeel", StringTools.trim(("" + (Engine.engine.getGameAttribute("Dialog list") : Array<Dynamic>)[2])));
					Engine.engine.setGameAttribute("interlocuteur", StringTools.trim(("" + (Engine.engine.getGameAttribute("Dialog list") : Array<Dynamic>)[0])));
					Engine.engine.setGameAttribute("ask", StringTools.trim(("" + (Engine.engine.getGameAttribute("Dialog list") : Array<Dynamic>)[3])));
					Engine.engine.setGameAttribute("Levent", StringTools.trim(("" + (Engine.engine.getGameAttribute("Dialog list") : Array<Dynamic>)[4])));
					if((Engine.engine.getGameAttribute("ShowDialog") : Bool))
					{
						if(((Engine.engine.getGameAttribute("NumDialogue") : Float) <= (Engine.engine.getGameAttribute("MaxDialogue") : Float)))
						{
							/* DIALOGUE */
							if(((Engine.engine.getGameAttribute("interlocuteur") : String) == "himself"))
							{
								g.setFont(getFont(31));
								_dialog.setAnimation("normal");
								_curfont = "normal";
							}
							else if(((Engine.engine.getGameAttribute("interlocuteur") : String) == "Anna"))
							{
								if(((getCurrentSceneName() == "05 act1 scene01 interro") || ((getCurrentSceneName() == "08 act1 scene02 interro") || (getCurrentSceneName() == "11 act1 scene03 interro"))))
								{
									g.setFont(getFont(119));
									_dialog.setAnimation("evennement");
									g.drawString("" + (Engine.engine.getGameAttribute("interlocuteur") : String), (_dialog.getX() + 45), (_dialog.getY() + 25));
									g.setFont(getFont(118));
									_curfont = "eve";
								}
								else
								{
									_dialog.setAnimation("normal");
									g.setFont(getFont(82));
									g.drawString("" + (Engine.engine.getGameAttribute("interlocuteur") : String), (_dialog.getX() + 45), (_dialog.getY() + 25));
									g.setFont(getFont(2));
								}
							}
							else if(((Engine.engine.getGameAttribute("interlocuteur") : String) == "hors"))
							{
								_dialog.setAnimation("normal");
								g.setFont(getFont(2));
							}
							else
							{
								_dialog.setAnimation("normal");
								g.setFont(getFont(82));
								g.drawString("" + (Engine.engine.getGameAttribute("interlocuteur") : String), (_dialog.getX() + 45), (_dialog.getY() + 25));
								g.setFont(getFont(2));
							}
							_CurrentLine = 0;
							_linelenght = 0;
							for(item in cast(_WordList, Array<Dynamic>))
							{
								if((_curfont == "eve"))
								{
									_taillemotespace = (getFont(118).getTextWidth("" + convertToPseudoUnicode(item))/Engine.SCALE + getFont(118).getTextWidth(" ")/Engine.SCALE);
								}
								else if((_curfont == "himself"))
								{
									_taillemotespace = (getFont(31).getTextWidth("" + convertToPseudoUnicode(item))/Engine.SCALE + getFont(31).getTextWidth(" ")/Engine.SCALE);
								}
								else
								{
									_taillemotespace = (getFont(2).getTextWidth("" + convertToPseudoUnicode(item))/Engine.SCALE + getFont(2).getTextWidth(" ")/Engine.SCALE);
								}
								g.drawString("" + convertToPseudoUnicode(item), (_linelenght + (_dialog.getX() + 30)), (_CurrentLine + (_dialog.getY() + 80)));
								_linelenght += _taillemotespace;
								if((_linelenght > 1400))
								{
									_CurrentLine += (getFont(2).getHeight()/Engine.SCALE + 5);
									_linelenght = 0;
								}
							}
						}
					}
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}