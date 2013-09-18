/**
 * User: Jessie
 * Date: 11.09.12
 * Time: 2:22
 */
package ru.dch.oac.mvc
{

public class Model
{
    private var relatedViews:Vector.<IView>;

    public function Model()
    {
        relatedViews = new Vector.<IView>();
    }

    public function addListener(value:IView):void
    {
        relatedViews.push(value);
    }

    public function removeView(value:IView):void
    {
        if (relatedViews.indexOf(value))
        {
            relatedViews.splice(relatedViews.indexOf(value), 1);
        }
    }

    public function update():void
    {
        if(relatedViews.length)
        {
            for each(var value:IView in relatedViews)
            {
                value.update();
            }
        }
    }
}
}
