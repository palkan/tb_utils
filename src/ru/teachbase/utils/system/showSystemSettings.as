/**
 * User: palkan
 * Date: 7/15/14
 * Time: 12:18 PM
 */
package ru.teachbase.utils.system {
import flash.display.Stage;
import flash.events.MouseEvent;
import flash.media.scanHardware;
import flash.system.Security;
import flash.utils.setTimeout;

public function showSystemSettings(type:String, complete:Function = null, stage:Stage = null):void{

    scanHardware();

    Security.showSettings(type);

    stage && setTimeout(stage.addEventListener,500,MouseEvent.MOUSE_MOVE, panelClosedHandler);

    function panelClosedHandler(e:MouseEvent):void{

        if (e.stageX >= 0 && e.stageX < stage.stageWidth && e.stageY >= 0 && e.stageY < stage.stageHeight){

            stage.removeEventListener(MouseEvent.MOUSE_MOVE,panelClosedHandler);
            complete && complete is Function && complete();
        }

    }

   }
}
