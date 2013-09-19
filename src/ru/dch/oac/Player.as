/**
 * Created by Jessie on 19.09.13.
 */
package ru.dch.oac
{
public class Player
{
    private var _name:String;
    private var _score:int;

    public function Player(name:String):void
    {
        this.name = name;
    }

    public function get name():String
    {
        return _name;
    }

    public function set name(value:String):void
    {
        _name = value;
    }

    public function get score():int
    {
        return _score;
    }

    public function set score(value:int):void
    {
        _score = value;
    }
}
}
