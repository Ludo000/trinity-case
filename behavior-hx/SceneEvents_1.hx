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



class SceneEvents_1 extends SceneScript
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

public var _curfont:String;

public var _taillemotespace:Float;

 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Interlocuteur", "_Interlocuteur");
_Interlocuteur = "";
nameMap.set("Word List", "_WordList");
_WordList = [];
nameMap.set("Current Line", "_CurrentLine");
_CurrentLine = 0.0;
nameMap.set("Line List", "_LineList");
_LineList = [];
nameMap.set("Dialogue List", "_DialogueList");
_DialogueList = [];
nameMap.set("line lenght", "_linelenght");
_linelenght = 0.0;
nameMap.set("PersoFeel", "_PersoFeel");
_PersoFeel = "";
nameMap.set("recap", "_recap");
_recap = "";
nameMap.set("recap_list", "_recaplist");
_recaplist = [];
nameMap.set("desc_perso", "_descperso");
_descperso = [];
nameMap.set("descc", "_descc");
_descc = "";
nameMap.set("Choix1", "_Choix1");
_Choix1 = false;
nameMap.set("Choix2", "_Choix2");
_Choix2 = false;
nameMap.set("Choix3", "_Choix3");
_Choix3 = false;
nameMap.set("descr_perso", "_descrperso");
_descrperso = [];
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
nameMap.set("cur_font", "_curfont");
_curfont = "";
nameMap.set("taille motespace", "_taillemotespace");
_taillemotespace = 0.0;

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        scripts.SceneEvents_3._customBlock_reinitialisation_pour_nouvelle_scene();
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(20),Engine.engine.getGameAttribute("pos_vie_x"),Engine.engine.getGameAttribute("pos_vie_y"));
        getActor(19).setY(Engine.engine.getGameAttribute("pos_fleche_karma_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(18),Engine.engine.getGameAttribute("pos_karma_bar_x"),Engine.engine.getGameAttribute("pos_karma_bar_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(6),Engine.engine.getGameAttribute("pos_choix_gauche_x"),Engine.engine.getGameAttribute("pos_choix_gauche_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(10),Engine.engine.getGameAttribute("pos_choix_centre_x"),Engine.engine.getGameAttribute("pos_choix_centre_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(7),Engine.engine.getGameAttribute("pos_choix_droite_x"),Engine.engine.getGameAttribute("pos_choix_droite_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(4),Engine.engine.getGameAttribute("pos_fleche_x"),Engine.engine.getGameAttribute("pos_fleche_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(3),Engine.engine.getGameAttribute("pos_points_x"),Engine.engine.getGameAttribute("pos_points_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(2),Engine.engine.getGameAttribute("pos_dialog"),Engine.engine.getGameAttribute("pos_dialog_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(5),Engine.engine.getGameAttribute("pos_carnet_icone_x"),Engine.engine.getGameAttribute("pos_carnet_icone_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(12),Engine.engine.getGameAttribute("pos_carnet_x"),Engine.engine.getGameAttribute("pos_carnet_y"));
        scripts.SceneEvents_3._customBlock_pos_actor_to(getActor(21),Engine.engine.getGameAttribute("pos_qcm_x"),Engine.engine.getGameAttribute("pos_qcm_y"));
        Engine.engine.setGameAttribute("pos_table_x", getActor(15).getX());
        Engine.engine.setGameAttribute("pos_table_y", getActor(15).getY());
        getActor(17).disableActorDrawing();
        getActor(21).disableActorDrawing();
        _HoverQCMChoix1 = false;
propertyChanged("_HoverQCMChoix1", _HoverQCMChoix1);
        _HoverQCMChoix2 = false;
propertyChanged("_HoverQCMChoix2", _HoverQCMChoix2);
        _hoverpreuve1 = false;
propertyChanged("_hoverpreuve1", _hoverpreuve1);
        _hoverpreuve2 = false;
propertyChanged("_hoverpreuve2", _hoverpreuve2);
        _hoverpreuve3 = false;
propertyChanged("_hoverpreuve3", _hoverpreuve3);
        _linelenght = asNumber(0);
propertyChanged("_linelenght", _linelenght);
        _CurrentLine = asNumber(0);
propertyChanged("_CurrentLine", _CurrentLine);
        _descc = "20 years old <br> 1m80 <br> Technician at \"Le Bonheur\" <br>";
propertyChanged("_descc", _descc);
        _recap = "The killer seems to have approached the young woman, they had met beforehand during multiple rendez-vous. He rented a karaoke studio with the victim, pretending a romantic evening. The killer, with the help of an accomplice, prepared the scene so that the camera would be pluged on the TV rather than displaying the lyrics. <br> He then strangled the women in front of the camera, making her witness her own death. <br> <br> <b> Clues found~x00a0: </b> <br> Some partial fingerprint on the screen and on the camera, probably left by the accomplice. <br> The gag which was used to silence the young woman. <br> Numerous trace of strangling on the victim's neck. <br> The tape left by the killer, but he took care to not be shown on it. <br> <br> <b> Witness~x00a0: </b> <br> A couple who affirms to have seen the victim with a male person, blond, strongly built, a face as innocent as a child one. <br> <br> <b> Suspect : </b> <br> The technician in charge of this room.";
propertyChanged("_recap", _recap);
    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if((Engine.engine.getGameAttribute("NumDialogue") <= Engine.engine.getGameAttribute("MaxDialogue")))
{
            if(((0 < Engine.engine.getGameAttribute("ShowPrec")) && Engine.engine.getGameAttribute("carnet_hide")))
{
                g.setFont(getFont(2));
                g.drawString("" + Engine.engine.getGameAttribute("ShowPrec"), 1811, 884);
}

            if((Engine.engine.getGameAttribute("ShowChoice") && Engine.engine.getGameAttribute("carnet_hide")))
{
                g.setFont(getFont(16));
                g.drawString("" + "Good cops", 1740, 460);
                g.setFont(getFont(19));
                g.drawString("" + "Bad cops", 1420, 460);
}

            if(Engine.engine.getGameAttribute("carnet_hide"))
{
                if((Engine.engine.getGameAttribute("PersoFeel") == "surpris"))
{
                    getActor(11).setAnimation("" + "surpris");
}

                else if((Engine.engine.getGameAttribute("PersoFeel") == "colere"))
{
                    getActor(11).setAnimation("" + "colere");
}

                else if((Engine.engine.getGameAttribute("PersoFeel") == "normal"))
{
                    getActor(11).setAnimation("" + "normal");
}

                if((Engine.engine.getGameAttribute("ask") == "C1"))
{
                    getActor(17).enableActorDrawing();
                    Engine.engine.setGameAttribute("ShowNext", false);
                    Engine.engine.setGameAttribute("ShowPrec", -1);
}

                else if(((Engine.engine.getGameAttribute("ask") == "Q1") || ((Engine.engine.getGameAttribute("ask") == "Q2") || (Engine.engine.getGameAttribute("ask") == "Q3"))))
{
                    Engine.engine.setGameAttribute("ShowChoice", true);
                    Engine.engine.setGameAttribute("ShowNext", false);
}

                else if((Engine.engine.getGameAttribute("ask") == "QCM_1"))
{
                    Engine.engine.setGameAttribute("ShowNext", false);
                    getActor(21).enableActorDrawing();
                    g.setFont(getFont(26));
                    g.drawString("" + "- Trust him.", (getActor(21).getX() + 20), (getActor(21).getY() + 50));
                    g.drawString("" + "- Don't trust him.", (getActor(21).getX() + 20), (getActor(21).getY() + 80));
                    if(_HoverQCMChoix1)
{
                        g.fillColor = Utils.getColorRGB(0,0,0);
                        g.strokeSize = Std.int(5);
                        g.drawRect((getActor(21).getX() + 15), (getActor(21).getY() + 45), 600, 30);
}

                    else if(_HoverQCMChoix2)
{
                        g.fillColor = Utils.getColorRGB(0,0,0);
                        g.strokeSize = Std.int(5);
                        g.drawRect((getActor(21).getX() + 15), (getActor(21).getY() + 75), 600, 30);
}

}

                else
{
                    Engine.engine.setGameAttribute("ShowChoice", false);
                    getActor(17).disableActorDrawing();
                    getActor(21).disableActorDrawing();
}

                if(Engine.engine.getGameAttribute("Q1"))
{
                    Engine.engine.setGameAttribute("Q1", false);
                    if((Engine.engine.getGameAttribute("QKarma") == "good"))
{
                        Engine.engine.getGameAttribute("LineList")[Std.int(Engine.engine.getGameAttribute("NumDialogue"))] = "Theodore:You want to go home right ?";
                        Engine.engine.getGameAttribute("LineList")[Std.int((Engine.engine.getGameAttribute("NumDialogue") + 1))] = "Theodore:So sooner you speak to me sooner you'll leave.";
                        Engine.engine.getGameAttribute("LineList").splice(Std.int((Engine.engine.getGameAttribute("NumDialogue") + 2)), 1);
}

                    else if((Engine.engine.getGameAttribute("QKarma") == "bad"))
{
                        Engine.engine.getGameAttribute("LineList")[Std.int(Engine.engine.getGameAttribute("NumDialogue"))] = "Theodore:Ok, so maybe you didn't notice but a murder occured in the karaoke you work in.";
                        Engine.engine.getGameAttribute("LineList")[Std.int((Engine.engine.getGameAttribute("NumDialogue") + 1))] = "Theodore:So when I ask you 'Where were you ?'.";
                        Engine.engine.getGameAttribute("LineList")[Std.int((Engine.engine.getGameAttribute("NumDialogue") + 2))] = "Theodore:Nowehere in particular is not a right answer.";
}

}

                if(Engine.engine.getGameAttribute("Q2"))
{
                    Engine.engine.setGameAttribute("Q2", false);
                    if((Engine.engine.getGameAttribute("QKarma") == "good"))
{
                        Engine.engine.getGameAttribute("LineList")[Std.int(Engine.engine.getGameAttribute("NumDialogue"))] = "Theodore:Calm down nobody accusing you of anything but you need to tell me the truth.";
                        Engine.engine.getGameAttribute("LineList").splice(Std.int((Engine.engine.getGameAttribute("NumDialogue") + 1)), 1);
}

                    else if((Engine.engine.getGameAttribute("QKarma") == "bad"))
{
                        Engine.engine.getGameAttribute("LineList")[Std.int(Engine.engine.getGameAttribute("NumDialogue"))] = "Theodore:We got your prints on a crime scene.";
                        Engine.engine.getGameAttribute("LineList")[Std.int((Engine.engine.getGameAttribute("NumDialogue") + 1))] = "Theodore:So you better answer or else it's the jail.";
}

}

                if(Engine.engine.getGameAttribute("Q3"))
{
                    Engine.engine.setGameAttribute("Q3", false);
                    if((Engine.engine.getGameAttribute("QKarma") == "good"))
{
                        Engine.engine.getGameAttribute("LineList")[Std.int(Engine.engine.getGameAttribute("NumDialogue"))] = "Inspector : Very well, describe this man to me.";
}

                    else if((Engine.engine.getGameAttribute("QKarma") == "bad"))
{
                        Engine.engine.getGameAttribute("LineList")[Std.int(Engine.engine.getGameAttribute("NumDialogue"))] = "Inspector : Describe this man to me ! : surpris";
}

}

}

            else
{
                if((Engine.engine.getGameAttribute("page_carnet") == 1))
{
                    g.setFont(getFont(25));
                    g.drawString("" + "Eric Johnson", (getActor(12).getX() + 380), (getActor(12).getY() + 100));
                    g.setFont(getFont(26));
                    _CurrentLine = asNumber(0);
propertyChanged("_CurrentLine", _CurrentLine);
                    _linelenght = asNumber(0);
propertyChanged("_linelenght", _linelenght);
                    _descperso = ("" + _descc).split(" ");
propertyChanged("_descperso", _descperso);
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
                            _linelenght += (getFont(26).font.getTextWidth(item)/Engine.SCALE + 10);
propertyChanged("_linelenght", _linelenght);
}

                        if(((_linelenght > 400) || (item == "<br>")))
{
                            _CurrentLine += (getFont(26).getHeight()/Engine.SCALE + 5);
propertyChanged("_CurrentLine", _CurrentLine);
                            _linelenght = asNumber(0);
propertyChanged("_linelenght", _linelenght);
}

}

}

                else if((Engine.engine.getGameAttribute("page_carnet") == 2))
{
                    g.setFont(getFont(26));
                    g.drawString("" + "Mr Johnson's fingerprints", cast((scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(8))), Float), cast((scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(8),0)), Float));
                    g.drawString("" + "found on the camera.", cast((scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(8))), Float), cast((scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(8),20)), Float));
                    g.drawString("" + "Tissue founds near the body.", cast((scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(13))), Float), cast((scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(13),0)), Float));
                    g.drawString("" + "SD Card, countains video of the scene.", cast((scripts.SceneEvents_3._customBlock_X_to_the_right_of(getActor(14))), Float), cast((scripts.SceneEvents_3._customBlock_Y_to_the_right_of(getActor(14),0)), Float));
                    if(_hoverpreuve1)
{
                        g.fillColor = Utils.getColorRGB(0,0,0);
                        g.strokeSize = Std.int(5);
                        g.drawRect((getActor(8).getX() - 10), (getActor(8).getY() - 10), 500, 150);
}

                    else if(_hoverpreuve2)
{
                        g.fillColor = Utils.getColorRGB(0,0,0);
                        g.strokeSize = Std.int(5);
                        g.drawRect((getActor(13).getX() - 10), (getActor(13).getY() - 10), 500, 150);
}

                    else if(_hoverpreuve3)
{
                        g.fillColor = Utils.getColorRGB(0,0,0);
                        g.strokeSize = Std.int(5);
                        g.drawRect((getActor(14).getX() - 10), (getActor(14).getY() - 10), 500, 150);
}

}

                else if((Engine.engine.getGameAttribute("page_carnet") == 3))
{
                    g.setFont(getFont(25));
                    g.drawString("" + "Murder at the karaoke \"Le Bohneur\"", (getActor(12).getX() + 380), (getActor(12).getY() + 100));
                    g.setFont(getFont(26));
                    _CurrentLine = asNumber(0);
propertyChanged("_CurrentLine", _CurrentLine);
                    _linelenght = asNumber(0);
propertyChanged("_linelenght", _linelenght);
                    _recaplist = ("" + _recap).split(" ");
propertyChanged("_recaplist", _recaplist);
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
                            _linelenght += (getFont(26).font.getTextWidth(item)/Engine.SCALE + 10);
propertyChanged("_linelenght", _linelenght);
}

                        if(((_linelenght > 400) || (item == "<br>")))
{
                            _CurrentLine += (getFont(26).getHeight()/Engine.SCALE + 5);
propertyChanged("_CurrentLine", _CurrentLine);
                            _linelenght = asNumber(0);
propertyChanged("_linelenght", _linelenght);
}

}

}

                else if((Engine.engine.getGameAttribute("page_carnet") == 4))
{
                    g.setFont(getFont(26));
                    g.drawString("" + "You don't have any of this for now.", (getActor(12).getX() + 380), (getActor(12).getY() + 200));
}

}

}

        else
{
            switchScene(GameModel.get().scenes.get(30).getID(), createFadeOut(1, Utils.getColorRGB(0,0,0)), createFadeIn(1, Utils.getColorRGB(0,0,0)));
}

}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(0), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        if(!(Engine.engine.getGameAttribute("carnet_hide")))
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
        if(!(Engine.engine.getGameAttribute("ShowEvidences")))
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
        if(!(Engine.engine.getGameAttribute("carnet_hide")))
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
        if(!(Engine.engine.getGameAttribute("carnet_hide")))
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
propertyChanged("_hoverpreuve1", _hoverpreuve1);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(5), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 1 == mouseState)
{
        _hoverpreuve2 = true;
propertyChanged("_hoverpreuve2", _hoverpreuve2);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 1 == mouseState)
{
        _hoverpreuve3 = true;
propertyChanged("_hoverpreuve3", _hoverpreuve3);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(4), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && -1 == mouseState)
{
        _hoverpreuve1 = false;
propertyChanged("_hoverpreuve1", _hoverpreuve1);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(5), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && -1 == mouseState)
{
        _hoverpreuve2 = false;
propertyChanged("_hoverpreuve2", _hoverpreuve2);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && -1 == mouseState)
{
        _hoverpreuve3 = false;
propertyChanged("_hoverpreuve3", _hoverpreuve3);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(4), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        if((!(Engine.engine.getGameAttribute("carnet_hide")) && (Engine.engine.getGameAttribute("page_carnet") == 2)))
{
            if((Engine.engine.getGameAttribute("ask") == "C1"))
{
                Engine.engine.setGameAttribute("NumDialogue", (Engine.engine.getGameAttribute("NumDialogue") + 1));
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
        if((!(Engine.engine.getGameAttribute("carnet_hide")) && (Engine.engine.getGameAttribute("page_carnet") == 2)))
{
            Engine.engine.setGameAttribute("carnet_hide", true);
            Engine.engine.setGameAttribute("ShowEvidences", false);
            Engine.engine.setGameAttribute("Perd1Pv", true);
}

}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(6), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        if((!(Engine.engine.getGameAttribute("carnet_hide")) && (Engine.engine.getGameAttribute("page_carnet") == 2)))
{
            Engine.engine.setGameAttribute("carnet_hide", true);
            Engine.engine.setGameAttribute("ShowEvidences", false);
            Engine.engine.setGameAttribute("Perd1Pv", true);
}

}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(7), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        if((Engine.engine.getGameAttribute("ask") == "QCM_1"))
{
            playSound(getSound(224));
            Engine.engine.getGameAttribute("LineList")[Std.int((Engine.engine.getGameAttribute("NumDialogue") + 1))] = "himself:It's all I can get from him.";
            Engine.engine.setGameAttribute("ShowNext", true);
            Engine.engine.setGameAttribute("ask", "null");
            getActor(21).disableActorDrawing();
            Engine.engine.setGameAttribute("ShowPrec", -1);
            Engine.engine.setGameAttribute("NumDialogue", (Engine.engine.getGameAttribute("NumDialogue") + 1));
}

}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(8), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        if((Engine.engine.getGameAttribute("ask") == "QCM_1"))
{
            playSound(getSound(224));
            Engine.engine.getGameAttribute("LineList")[Std.int((Engine.engine.getGameAttribute("NumDialogue") + 1))] = "Jonhson:I tell you the truth please believe me !";
            Engine.engine.setGameAttribute("Perd1Pv", true);
            Engine.engine.setGameAttribute("ShowNext", false);
            Engine.engine.setGameAttribute("ShowPrec", 1);
            getActor(21).disableActorDrawing();
            Engine.engine.setGameAttribute("NumDialogue", (Engine.engine.getGameAttribute("NumDialogue") + 1));
}

}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(7), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 1 == mouseState)
{
        _HoverQCMChoix1 = true;
propertyChanged("_HoverQCMChoix1", _HoverQCMChoix1);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(8), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 1 == mouseState)
{
        _HoverQCMChoix2 = true;
propertyChanged("_HoverQCMChoix2", _HoverQCMChoix2);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(7), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && -1 == mouseState)
{
        _HoverQCMChoix1 = false;
propertyChanged("_HoverQCMChoix1", _HoverQCMChoix1);
}
});
    
/* ========================== On Region =========================== */
addMouseOverActorListener(getRegion(8), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && -1 == mouseState)
{
        _HoverQCMChoix2 = false;
propertyChanged("_HoverQCMChoix2", _HoverQCMChoix2);
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}