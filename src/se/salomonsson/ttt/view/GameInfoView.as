package se.salomonsson.ttt.view 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * implementation for gameInfoView. Shows the player whos turn it is, or if any player has won.
	 * @author Tommislav
	 */
	public class GameInfoView extends Sprite implements IGameInfoView
	{
		private const PLAYER_SYMBOL_WIDTH:int = 8;
		
		private var _playerSymbol:PlayerSymbol;
		private var _textfield:TextField;
		
		
		public function GameInfoView() 
		{
			_textfield = new TextField();
			_textfield.defaultTextFormat = new TextFormat( "Verdana", 10 );
			_textfield.autoSize = TextFieldAutoSize.LEFT;
			_textfield.selectable = false;
			_textfield.y = -4;
			_textfield.x = 14;
			addChild(_textfield);
		}
		
		private function setPlayerSymbol(playerId:uint):void
		{
			clearPlayerSymbol();
			
			_playerSymbol = new PlayerSymbol(playerId);
			_playerSymbol.width = _playerSymbol.height = PLAYER_SYMBOL_WIDTH;
			addChild(_playerSymbol);
		}
		
		private function clearPlayerSymbol():void
		{
			if (_playerSymbol != null)
			{
				removeChild(_playerSymbol);
				_playerSymbol = null;
			}
		}
		
		/* INTERFACE se.salomonsson.ttt.view.IGameInfoView */
		
		public function showCurrentPlayer(name:String, playerId:uint):void 
		{
			setPlayerSymbol(playerId);
			_textfield.text = "IT'S YOUR TURN: " + name;
		}
		
		public function showWinner(name:String, playerId:uint):void 
		{
			setPlayerSymbol(playerId);
			_textfield.text = "A WINNER IS YOU: " + name;
		}
		
		public function reset():void 
		{
			clearPlayerSymbol();
			_textfield.text = "";
		}
		
	}

}