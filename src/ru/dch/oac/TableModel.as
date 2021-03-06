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
    private var _tableSize:int;
    private var _winSize:int;

    public function TableModel(tableSize:int = 3, winSize:int = 3):void
    {
        this._tableSize = tableSize;
        this._winSize = winSize;
        init();
    }

    private function init():void
    {
        players = new Vector.<Player>();
        players.push(new Player("Player1"));
        players.push(new Player("Player2"));
        players[0].cellType = CellTypes.CROSS_CELL;
        players[1].cellType = CellTypes.OUGHT_CELL;

        _table = new Vector.<Vector.<String>>();
        for (var i:int = 0; i < _tableSize; i++)
        {
            _table.push(new Vector.<String>());
            for (var j:int = 0; j < _tableSize; j++)
            {
                _table[i].push(CellTypes.EMPTY_CELL);
            }
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
        return result;
    }

    public function getPlayer(id:int):Player
    {
        if ((id < 2) && (id > -1))
        {
            return players[id];
        } else
        {
            return null;
        }
    }

    public function makeTurn(col:int, row:int):void
    {
        if (_table[col][row] == CellTypes.EMPTY_CELL)
        {
            _table[col][row] = players[currentPlayer].cellType;
            dispatchEvent(new CellEvent(CellEvent.CELL_CHANGED, col, row, players[currentPlayer].cellType));
            if (testWin(col, row))
            {
                players[currentPlayer].score++;
                nextGame();
            }
            currentPlayer == 0 ? currentPlayer = 1 : currentPlayer = 0;
        }
    }

    private function nextGame():void
    {
        for (var i:int = 0; i < _tableSize; i++)
        {
            for (var j:int = 0; j < _tableSize; j++)
            {
                _table[j][i] = CellTypes.EMPTY_CELL;
            }
        }
        dispatchEvent(new GameEvent(GameEvent.NEXT_GAME));
    }

    private function testWin(col:int, row:int):Boolean
    {
        var line:int = 1;

        //test west-east
        if (col - 1 > -1 && _table[col - 1][row] == _table[col][row])
        {
            line++;
        }
        if (col - 2 > -1 && _table[col - 2][row] == _table[col][row])
        {
            line++;
        }
        if (col + 1 < tableSize && _table[col + 1][row] == _table[col][row])
        {
            line++;
        }
        if (col + 2 < tableSize && _table[col + 2][row] == _table[col][row])
        {
            line++;
        }
        //test north-south
        if (line < 3)
        {
            line = 1;
            if (row - 1 > -1 && _table[col][row - 1] == _table[col][row])
            {
                line++;
            }
            if (row - 2 > -1 && _table[col][row - 2] == _table[col][row])
            {
                line++;
            }
            if (row + 1 < tableSize && _table[col][row + 1] == _table[col][row])
            {
                line++;
            }
            if (row + 2 < tableSize && _table[col][row + 2] == _table[col][row])
            {
                line++;
            }
        }
        //test nw-se
        if (line < 3)
        {
            line = 1;
            if (row - 1 > -1 && col - 1 > -1 && _table[col - 1][row - 1] == _table[col][row])
            {
                line++;
            }
            if (row - 2 > -1 && col - 2 > -1 && _table[col - 2][row - 2] == _table[col][row])
            {
                line++;
            }
            if (row + 1 < tableSize && col + 1 < tableSize && _table[col + 1][row + 1] == _table[col][row])
            {
                line++;
            }
            if (row + 2 < tableSize && col + 2 < tableSize && _table[col + 2][row + 2] == _table[col][row])
            {
                line++;
            }
        }
        //test ne-sw
        if (line < 3)
        {
            line = 1;
            if (row + 1 < tableSize && col - 1 > -1 && _table[col - 1][row + 1] == _table[col][row])
            {
                line++;
            }
            if (row + 2 < tableSize && col - 2 > -1 && _table[col - 2][row + 2] == _table[col][row])
            {
                line++;
            }
            if (col + 1 < tableSize && row - 1 > -1 && _table[col + 1][row - 1] == _table[col][row])
            {
                line++;
            }
            if (col + 2 < tableSize && row - 2 > -1 && _table[col + 2][row - 2] == _table[col][row])
            {
                line++;
            }
        }
        trace(line);
        return line > 2;
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
        dispatchEvent(new GameEvent(GameEvent.CURRENT_PLAYER_CHANGED));
    }

    public function get tableSize():int
    {
        return _tableSize;
    }

    public function get winSize():int
    {
        return _winSize;
    }
}
}
