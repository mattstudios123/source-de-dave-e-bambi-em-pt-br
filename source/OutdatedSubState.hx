package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;

	public static var needVer:String = "IDFK LOL";

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
		var txt:FlxText = null;
		if (FlxG.save.data.begin_thing)
		{
			txt = new FlxText(0, 0, FlxG.width,
				"Ola! \nEste mod usa shaders que podem atrapalhar algumas pessoas. \nSe voce quer desativar eles, \nDesative a opcao Eyesores no menu de opcoes. \n E Supernovae e Glitch não devem ser levados a sério e não são feitos pelo dono do jogo. \n Supernovae foi feito por ArchWk, e Glitch foi feito por The Boneyard. \nPressione Enter para continuar.",
				32);
		}
		else
		{
			txt = new FlxText(0, 0, FlxG.width,
				"Ola! \nEste mod usa shaders que podem atrapalhar algumas pessoas. \nSe voce quer desativar eles, \npressione N, ou se quiser deixar ativado,pressione Y. Voce pode trocar isso nas opcoes \n E Supernovae e Glitch não devem ser levados a sério e não são feitos pelo dono do jogo. \n Supernovae foi feito por ArchWk, e Glitch foi feito por The Boneyard.",
				32);
		}
		txt.setFormat("Comic Sans MS Bold", 32, FlxColor.WHITE, CENTER);
		txt.screenCenter();
		txt.antialiasing = true;
		add(txt);
	}

	override function update(elapsed:Float)
	{
		if (controls.PAUSE && FlxG.save.data.begin_thing == true)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		if (FlxG.keys.justPressed.Y && FlxG.save.data.begin_thing != true)
		{
			FlxG.save.data.begin_thing = true;
			FlxG.save.data.eyesores = true;
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		if (FlxG.keys.justPressed.N && FlxG.save.data.begin_thing != true)
		{
			FlxG.save.data.begin_thing = true;
			FlxG.save.data.eyesores = false;
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
