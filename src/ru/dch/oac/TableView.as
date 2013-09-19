/**
 * Created by Jessie on 18.09.13.
 */
package ru.dch.oac
{
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;

import ru.dch.oac.Player;

public class TableView extends Sprite
{
    private var cells:Vector.<Cell>;
    private var infoTextField:TextField;
    private var scoreTextField:TextField;
    private var tableContainer:Sprite;
    private var model:TableModel;

    public function TableView(model:TableModel):void
    {
        this.model = model;
        init();
    }

    private function setInfoText(text:String):void
    {
        infoTextField.text = text;
    }

    private function setScoreText(text:String):void
    {
        scoreTextField.text = text;
    }

    private function init():void
    {
        model.addEventListener(CellChangedEvent.CELL_CHANGED, model_cell_changedHandler);
        model.addEventListener(GameEvent.CURRENT_PLAYER_CHANGED, model_current_player_changedHandler);
        model.addEventListener(GameEvent.SCORE_CHANGED, model_score_text_changedHandler);

        tableContainer = new Sprite();
        tableContainer.y = 80;
        addChild(tableContainer);
        infoTextField = new TextField();
        infoTextField.text = "Player1";
        addChild(infoTextField);

        scoreTextField = new TextField();
        scoreTextField.text = "Player1:";
        addChild(infoTextField);

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
                tableContainer.addChild(cell);
            }
        }
    }

    private function model_cell_changedHandler(event:CellChangedEvent):void
    {
        trace("changed");
    }

    private function cell_clickHandler(event:MouseEvent):void
    {
        trace("clicked");
    }

    private function model_current_player_changedHandler(event:GameEvent):void
    {
        setInfoText(Player(model.getPlayer(model.currentPlayer)).name+"'s turn.");
    }

    private function model_score_text_changedHandler(event:GameEvent):void
    {
        setScoreText(Player(model.getPlayer(0)).name+": "+Player(model.getPlayer(0)).score+"\n"+Player(model.getPlayer(1)).name+": "+Player(model.getPlayer(1)).score);
    }
}
}
