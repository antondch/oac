/**
 * Created by Jessie on 19.09.13.
 */
package ru.dch.oac
{
import flash.events.Event;

public class CellEvent extends Event
{
    public static const CELL_CHANGED:String = "cell_changed";
    public static const CELL_CLICKED:String = "cell_clicked";
    public var row:int;
    public var col:int;
    public var cellType:String;

    public function CellEvent(type:String, col:int=0, row:int=0, cellType:String="", bubbles:Boolean = false, cancelable:Boolean = false)
    {
        this.row = row;
        this.col = col;
        this.cellType = cellType;
        super(type, bubbles, cancelable);
    }

    override public function clone():Event
    {
        return new CellEvent(type, col, row, cellType, bubbles, cancelable);
    }
}
}
