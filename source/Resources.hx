import flixel.FlxG;
import haxe.Timer;

class Resources {
  static var lastTime:Float = 0;

  public static function update() {
    var timeDifference = (lastTime > 0 ? Timer.stamp() - lastTime : 0);

    Reg.inventory.kids += timeDifference * Math.log(Reg.inventory.fame + Math.exp(1));
    Reg.inventory.thralls += timeDifference * Reg.itemHeld("Beguiler")/100;

    lastTime = Timer.stamp();
    
    if (FlxG.keys.justPressed.Q) Reg.inventory.blood += 1000;
    if (FlxG.keys.justPressed.W) Reg.inventory.fame += 1000000;
    if (FlxG.keys.justPressed.W) Reg.inventory.thralls += 1000;

    if (FlxG.keys.justPressed.SPACE) Transition.to(new SpaceState());
  }

  public static function harvestBlood() {
    if (Reg.inventory.blood == null) Reg.inventory.blood = 0;
    Reg.inventory.blood += Reg.inventory.kids + (0.1 * Reg.itemHeld("Rite of Blood"));
    Reg.inventory.kids = 0;
  }

  public static function harvestInfluence() {
    if (Reg.inventory.fame == null) Reg.inventory.fame = 0;
    Reg.inventory.fame += Reg.inventory.kids / 100;
    Reg.inventory.kids = 0;
  }
}
