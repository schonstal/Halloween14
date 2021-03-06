package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class BasementState extends GenericShopState
{
  override public function create():Void {
    if (Reg.inventory.Pumpkin >= 1 && Reg.inventory.Candle >= 1) {
      flavorText = "Oh, you have just what I need! I could make you a lovely Jack-O-Lantern, if you like.";
      availableItems = ["Jack-O-Lantern"];
      if (Reg.unlocks.boneDagger) {
        availableItems.push("10 Jack-O-Lanterns");
        availableItems.push("100 Jack-O-Lanterns");
      }
    } else {
      flavorText = "If I had a pumpkin and a candle, I would make you a wonderful Jack-O-Lantern.";
    }

    affordText = "I can't make any more Jack-O-Lanterns; you'll need to bring me the components.";
    purchaseText = "Here's a Jack-O-Lantern!";

    title = "Basement";
    Reg.unlockLocation("Basement");

    super.create();
  }

  override private function purchaseCallback(itemName:String):Void {
    if(itemName == "100 Jack-O-Lanterns") {
      Reg.addItem("Jack-O-Lantern", 100);
      Reg.inventory.fame += 100;
    } else if(itemName == "10 Jack-O-Lanterns") {
      Reg.addItem("Jack-O-Lantern", 10);
      Reg.inventory.fame += 10;
    } else {
      Reg.addItem("Jack-O-Lantern", 1);
      Reg.inventory.fame++;
    }

    if(Reg.itemHeld("Jack-O-Lantern") >= 10 && !Reg.unlocks.scrying) {
      affordText = purchaseText = "Wow! You really like Jack-O-Lanterns!!\n" +
                                  "I know it's not much, but why don't you take this weird thing I found? " +
                                  "I haven't had a friend in a long time...";
      Reg.unlocks.scrying = true;
    }
  }

  override private function buttonTitle(itemName):String {
    return "Forge " + itemName;
  }
}
