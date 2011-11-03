package se.salomonsson.ttt.view 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Tommislav
	 */
	public class GridView extends Sprite implements IGridView 
	{
		
		public function GridView() 
		{
			
		}
		
		
		/* INTERFACE se.salomonsson.ttt.view.IGridView */
		
		public function get displayObject():DisplayObject 
		{
			return this;
		}
		
		public function drawGrid(cellsW:uint, cellsH:uint, cells:Array):void
		{
			this.graphics.clear();
			this.graphics.lineStyle( 1, 0x000000 );
			this.graphics.beginFill( 0xffffff, 1 );
			
			var width:Number = 32;
			var height:Number = 32;
			
			for (var i:int = 0; i < cells.length; i++ )
			{
				var y:Number = Math.floor(i / cellsW) * height;
				var x:Number = (i % cellsW) * width;
				this.graphics.drawRect( x, y, width, height );
			}
		}
		
	}

}