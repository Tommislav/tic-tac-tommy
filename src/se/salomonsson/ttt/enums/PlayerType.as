package se.salomonsson.ttt.enums
{
	
	/**
	 * <p>Enumeration class.</p>
	 * <p>Describes the different types of players that exist. Either a human or the computer.</p>
	 * @author Tommislav
	 */
	public class PlayerType 
	{
		
		public static const HUMAN:PlayerType = makeEnum("human");
		
		public static const CPU:PlayerType = makeEnum("cpu");
		
		
		
		
		private static var _locked:Boolean = true;
		private static function makeEnum( enumType:String ):PlayerType
		{
			_locked = false;
			var value:PlayerType = new PlayerType( enumType );
			_locked = true;
			return value;
		}
		
		
		private var _enumeration:String;
		public function PlayerType(enumeration:String) 
		{
			
			if (_locked)
				throw new Error( "This is an enumeration, use of 'new' is not allowed" );
			
			_enumeration = enumeration;
		}
		
		public function toString():String
		{
			return _enumeration;
		}
		
		public function valueOf():Object
		{
			return this;
		}
		
	}
	
}