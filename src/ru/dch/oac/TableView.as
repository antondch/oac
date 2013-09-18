/**
 * Created by Jessie on 18.09.13.
 */
package ru.dch.oac
{
import flash.display.Sprite;

import ru.dch.oac.mvc.IView;

public class TableView extends Sprite implements IView
{
    private var cells:Vector.<Sprite>;

    private var _model:TableModel;

    public function TableView(model:TableModel):void
    {
        this.model = model;
        init();
    }

    private function init():void
    {
        cells = new Vector.<Sprite>();
        for (var i:int = 0; i < 9; i++)
        {
            var cell:Sprite = new Sprite();
        }
    }

    private function draw():void
    {

    }

    public function set model(value:TableModel):void
    {
        _model = value;
    }

    public function get model():TableModel
    {
        return _model;
    }

    private function draw():void
    {

    }

    public function update():void
    {

    }
}
}
