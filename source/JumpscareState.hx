import flixel.FlxSprite;
import flixel.FlxState;
import flixel.*;
import flixel.util.FlxTimer;
import flash.system.System;

class JumpscareState extends FlxState
{
    var sus:FlxSprite;

    public function new()
    {
        super();
    }
    override public function create()
    {
        super.create();

        sus = new FlxSprite(0, 0);
        sus.loadGraphic(Paths.image("hd/jumpscare/approv", "shared"));
        FlxG.sound.play(Paths.sound("prugatory", "shared"), 1, false);
        add(sus);
        new FlxTimer().start(10, jumpscare);
    }
    public function jumpscare(bruh:FlxTimer = null)
    {
        sus.loadGraphic(Paths.image("hd/jumpscare/disapprov", "shared"));
        FlxG.sound.play(Paths.sound("loud", "preload"), 1, false);
        new FlxTimer().start(0.6, closeGame);
    }
    public function closeGame(time:FlxTimer = null)
    {
        System.exit(0);
    }
}