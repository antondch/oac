/**
 * Created by Jessie on 18.09.13.
 */
package ru.dch.oac
{
import flash.events.EventDispatcher;

public class TableModel extends EventDispatcher
{
    private var _table:Vector.<Vector.<String>>;
    private var _lineThickness:int = 4;
    private var _cellSize:int = 200;

    public function TableModel():void
    {
        init();
    }

    private function init():void
    {
        _table = new Vector.<Vector.<String>>();
        for (var i:int = 0; i < 3; i++)
        {
            _table.push(new Vector.<String>())
        }
    }

    public function get lineThickness():int
    {
        return _lineThickness;
    }

    public function set lineThickness(value:int):void
    {
        _lineThickness = value;
    }

    public function get cellSize():int
    {
        return _cellSize;
    }

    public function set cellSize(value:int):void
    {
        _cellSize = value;
    }
}
}
