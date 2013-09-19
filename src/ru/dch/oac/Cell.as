/**
 * Created by Jessie on 19.09.13.
 */
package ru.dch.oac
{
import flash.display.Shape;
import flash.display.Sprite;
import flash.geom.Point;

public class Cell extends Sprite
{

    private var currentType:String = CellTypes.EMPTY_CELL;
    private var cellSize:int;
    private var lineThickness:int;
    private var ought:Sprite;
    private var cross:Sprite;
    private var _col:int;
    private var _row:int;

    public function Cell(lineThickness:int, cellSize:int, col:int, row:int):void
    {
        this.lineThickness = lineThickness;
        this.cellSize = cellSize;
        this._col = col;
        this._row = row;
        draw();
    }

    private function draw():void
    {
        graphics.clear();
        graphics.lineStyle(lineThickness);
        graphics.beginFill(0xFFFFFF);
        graphics.drawRect(0, 0, cellSize, cellSize);

        var shapeSize:int = cellSize - lineThickness * 4;

        ought = new Sprite();
        ought.graphics.lineStyle(lineThickness);
        ought.graphics.drawCircle(0, 0, shapeSize);
        ought.x = ought.y = lineThickness * 2;
        ought.visible = false;
        addChild(ought);

        cross = new Sprite();
        cross.graphics.lineStyle(lineThickness);
        cross.graphics.lineTo(shapeSize, shapeSize);
        cross.graphics.moveTo(shapeSize, 0);
        cross.graphics.lineTo(0, shapeSize);
        cross.x = cross.y = lineThickness * 2;
        cross.visible = false;
        addChild(cross);

        setType(CellTypes.EMPTY_CELL);
    }

    public function setType(type:String):void
    {
        if (currentType != type)
        {
            switch (type)
            {
                case CellTypes.OUGHT_CELL:
                {
                    ought.visible = true;
                    cross.visible = false;
                    break;
                }
                case CellTypes.CROSS_CELL:
                {
                    cross.visible = true;
                    ought.visible = false;
                    break;
                }
                default :
                {
                    cross.visible = false;
                    ought.visible = false;
                }
            }
        }
    }

    public function get col():int
    {
        return _col;
    }

    public function set col(value:int):void
    {
        _col = value;
    }

    public function get row():int
    {
        return _row;
    }

    public function set row(value:int):void
    {
        _row = value;
    }
}
}
