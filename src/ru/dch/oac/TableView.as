/**
 * Created by Jessie on 18.09.13.
 */
package ru.dch.oac
{
import flash.display.Sprite;
import flash.events.MouseEvent;

public class TableView extends Sprite
{
    private var cells:Vector.<Cell>;

    private var _model:TableModel;

    public function TableView(model:TableModel):void
    {
        this.model = model;
        init();
    }

    private function init():void
    {
        model.addEventListener(CellChangedEvent.CELL_CHANGED, model_cell_changedHandler);
        cells = new Vector.<Cell>();
        var lineThickness:int = model.lineThickness;
        var cellSize:int = model.cellSize;
        for (var row:int = 0; row < 3; row++)
        {
            for (var col:int = 0; col < 3; col++)
            {
                var cell:Cell = new Cell(lineThickness, cellSize, col, row);
                cell.x = col * cellSize;
                cell.y = row * cellSize;
                cell.addEventListener(MouseEvent.CLICK, cell_clickHandler);
                addChild(cell);
            }
        }
    }


    public function set model(value:TableModel):void
    {
        _model = value;
    }

    public function get model():TableModel
    {
        return _model;
    }

    private function model_cell_changedHandler(event:CellChangedEvent):void
    {
        trace("changed");
    }

    private function cell_clickHandler(event:MouseEvent):void
    {
        trace("clicked");
    }
}
}
