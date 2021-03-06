/**
 * Created by Jessie on 18.09.13.
 */
package ru.dch.oac
{
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;

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
        model.addEventListener(CellEvent.CELL_CHANGED, model_cell_changedHandler);
        model.addEventListener(GameEvent.CURRENT_PLAYER_CHANGED, model_current_player_changedHandler);
        model.addEventListener(GameEvent.NEXT_GAME, model_next_game_handler);

        tableContainer = new Sprite();
        tableContainer.y = 100;
        addChild(tableContainer);
        infoTextField = new TextField();
        infoTextField.text = "Player1";
        addChild(infoTextField);

        scoreTextField = new TextField();
        scoreTextField.text = "Player1:";
        scoreTextField.y = 30;
        addChild(scoreTextField);

        cells = new Vector.<Cell>();
        var lineThickness:int = model.lineThickness;
        var cellSize:int = model.cellSize;
        for (var row:int = 0; row < model.tableSize; row++)
        {
            for (var col:int = 0; col < model.tableSize; col++)
            {
                var cell:Cell = new Cell(lineThickness, cellSize, col, row);
                cell.x = col * cellSize;
                cell.y = row * cellSize;
                cell.addEventListener(MouseEvent.CLICK, cell_clickHandler);
                cells.push(cell);
                tableContainer.addChild(cell);
            }
        }

        reset();
    }

    private function model_cell_changedHandler(event:CellEvent):void
    {
        cells[event.col + event.row * model.tableSize].setType(event.cellType);
    }

    private function cell_clickHandler(event:MouseEvent):void
    {
        dispatchEvent(new CellEvent(CellEvent.CELL_CLICKED, Cell(event.target).col, Cell(event.target).row));
    }

    private function model_current_player_changedHandler(event:GameEvent):void
    {
        setInfoText(Player(model.getPlayer(model.currentPlayer)).name + "'s turn.");
    }

    private function model_next_game_handler(event:GameEvent):void
    {
        reset();
    }

    private function reset():void
    {
        for each(var cell:Cell in cells)
        {
            cell.setType(CellTypes.EMPTY_CELL);
        }
        setScoreText(Player(model.getPlayer(0)).name + " score: " + Player(model.getPlayer(0)).score + "\n" + Player(model.getPlayer(1)).name + " score: " + Player(model.getPlayer(1)).score);
        model_current_player_changedHandler(null);
    }
}
}
