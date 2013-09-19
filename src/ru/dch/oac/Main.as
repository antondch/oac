package ru.dch.oac
{

import flash.display.Sprite;
import flash.text.TextField;
[SWF(width=604,height=604)]
public class Main extends Sprite
{
    private var tableModel:TableModel;
    private var tableView:TableView;

    public function Main()
    {
        tableModel = new TableModel();
        tableView = new TableView(tableModel);
        addChild(tableView);
    }
}
}
