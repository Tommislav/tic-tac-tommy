package se.salomonsson.ttt.enums
{

	/**
	 * <p>Enumeration class.</p>
	 * <p>Describes the different types of players that exist. Either a human or the computer.</p>
	 * @author Tommislav
	 */
	public class CellHighlightType
	{

		public static const WIN:CellHighlightType = makeEnum("win");

		public static const LEGAL_MOVES:CellHighlightType = makeEnum("legalMoves");


		private static var _locked:Boolean = true;
		private static function makeEnum(enumType:String):CellHighlightType
		{
			_locked = false;
			var value:CellHighlightType = new CellHighlightType(enumType);
			_locked = true;
			return value;
		}


		private var _enumeration:String;
		public function CellHighlightType(enumeration:String)
		{
			if (_locked)
				throw new Error("This is an enumeration, use of 'new' is not allowed");

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