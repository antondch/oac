/**
 * Created by Jessie on 19.09.13.
 */
package ru.dch.oac
{
import flash.events.Event;

public class TextChangedEvent extends Event
{


    public var text:String;

    public function TextChangedEvent(type:String, text:String="", bubbles:Boolean = false, cancelable:Boolean = false)
    {
        this.text = text;
        super(type, bubbles, cancelable);
    }

    override public function clone():Event
    {
        return new TextChangedEvent(type, text, bubbles, cancelable);
    }
}
}
