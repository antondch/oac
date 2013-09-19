/**
 * Created by Jessie on 19.09.13.
 */
package ru.dch.oac
{
import flash.events.Event;

public class GameEvent extends Event
{
    public static const NEXT_GAME:String = "next_game";
    public static const PLAYER_NAME_CHANGED:String = "player_name_changed";
    public static const CURRENT_PLAYER_CHANGED:String = "info_text_changed";

    public function GameEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
    {
        super(type, bubbles, cancelable);
    }
}
}
