package se.salomonsson.ttt.view 
{
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	
	/**
	 * The graphical view for the game board
	 * @author Tommislav
	 */
	public class GridView extends Sprite implements IGridView 
	{
		private var _onClickedSignal:Signal = new Signal();
		private var _lastClickedCell:Point = new Point();
		
		private var _cellWidth:Number = 32;
		private var _cellHeight:Number = 32;
		
		public function GridView()
		{
			addEventListener( MouseEvent.CLICK, onClick );
		}
		
		
		private function onClick(e:MouseEvent):void 
		{
			// we calculate the index of the grid, not mouseX and mouseY... we might want the view to display different sizes
			// of the game board without having to update the logic in the application
			_lastClickedCell.x = Math.floor(mouseX / _cellWidth);
			_lastClickedCell.y = Math.floor(mouseY / _cellHeight);
			_onClickedSignal.dispatch();
		}
		
		
		
		
		/* INTERFACE se.salomonsson.ttt.view.IGridView */
		
		public function get displayObject():DisplayObject 	{ return this; }
		public function get onCellClickedSignal():ISignal 	{ return _onClickedSignal;}
		public function get lastClickedCell():Point 		{ return _lastClickedCell; }
		
		
		public function drawGrid(numCellsHorizontal:uint, numCellsVertical:uint, cells:Array):void
		{
			while (numChildren > 0)
				removeChildAt(0); // clear symbols
			
			this.graphics.clear();
			this.graphics.lineStyle( 1, 0x000000 );
			this.graphics.beginFill( 0xffffff, 1 );
			
			for (var i:int = 0; i < cells.length; i++ )
			{
				var cellValue:int = cells[i];
				
				var y:Number = Math.floor(i / numCellsHorizontal) * _cellWidth;
				var x:Number = (i % numCellsHorizontal) * _cellWidth;
				this.graphics.drawRect( x, y, _cellWidth, _cellHeight );
				
				if (cellValue != 0)
				{
					var symbolWidth:Number = 20;
					var offset:Number = (_cellWidth - 20) * 0.5;
					
					var symbol:Shape = new PlayerSymbol(cellValue);
					symbol.x = x + offset;
					symbol.y = y + offset;
					symbol.width = symbolWidth;
					symbol.height = symbolWidth;
					addChild(symbol);
				}
			}
		}
		
		
		
	}

}