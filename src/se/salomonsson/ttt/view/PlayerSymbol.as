package se.salomonsson.ttt.view 
{
	import flash.display.Shape;
	/**
	 * Graphical symbol representing a player.
	 * Draws a symbol from 0,0 to 10,10. Make sure to resize evenly.
	 * @author Tommislav
	 */
	public class PlayerSymbol extends Shape
	{
		private const SIZE:int = 10;
		
		public function PlayerSymbol(playerId:int) 
		{
			switch(playerId)
			{
				case 1:
					return drawCross();
				case 2:
					return drawCircle();
				default:
					return drawEmpty();
			}
		}
		
		private function drawCross():void 
		{
			this.graphics.lineStyle(1, 0);
			this.graphics.moveTo( 0, 0);
			this.graphics.lineTo( SIZE, SIZE );
			this.graphics.moveTo( SIZE, 0 );
			this.graphics.lineTo( 0, SIZE );
			this.graphics.endFill();
		}
		
		private function drawCircle():void 
		{
			this.graphics.lineStyle(1, 0);
			this.graphics.drawCircle( SIZE * 0.5, SIZE * 0.5, SIZE * 0.5 );
			this.graphics.endFill();
		}
		
		private function drawEmpty():void 
		{
			this.graphics.beginFill(0, 0);
			this.graphics.drawRect( 0, 0, SIZE, SIZE);
			this.graphics.endFill();
		}
	}

}