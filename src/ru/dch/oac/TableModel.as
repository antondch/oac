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
    private var _currentPlayer:int;
    private var _cellSize:int = 200;
    private var players:Vector.<Player>;

    public function TableModel():void
    {
        init();
    }

    private function init():void
    {
        players = new Vector.<Player>();
        players.push(new Player("Player1"));
        players.push(new Player("Player2"));
        players[0].cellType=CellTypes.CROSS_CELL;
        players[1].cellType=CellTypes.OUGHT_CELL;

        _table = new Vector.<Vector.<String>>();
        for (var i:int = 0; i < 3; i++)
        {
            _table.push(new Vector.<String>())
        }
    }

    public function changePlayerName(playerId:int, name:String):Boolean
    {
        var result:Boolean = players[playerId];
        if (result)
        {
            players[playerId].name = name;
            dispatchEvent(new GameEvent(GameEvent.PLAYER_NAME_CHANGED));
        }
    }

    public function getPlayer(id:int):Player
    {
        if ((id < 2) && (id > -1))
        {
            return players[id];
        }else
        {
            return null;
        }
    }

    public function makeTurn(cell:Cell):void
    {
        switch(currentPlayer)
        {
            case 0:
            {
                
            }
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

    public function get currentPlayer():int
    {
        return _currentPlayer;
    }

    public function set currentPlayer(value:int):void
    {
        _currentPlayer = value;
    }
}
}
