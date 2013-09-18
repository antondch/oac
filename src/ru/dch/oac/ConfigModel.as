/**
 * Created by Jessie on 18.09.13.
 */
package ru.dch.oac
{
import ru.dch.oac.mvc.Model;

public class ConfigModel extends Model
{
    private var _cellSize:int = 200;

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
