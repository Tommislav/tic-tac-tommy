package unittest.se.salomonsson.ttt.controllers.gamelogic 
{
	import org.hamcrest.assertThat;
	import org.hamcrest.assertThatBoolean;
	import org.hamcrest.collection.emptyArray;
	import org.hamcrest.core.not;
	import se.salomonsson.ttt.controllers.gamelogic.ThreeInARowLogic;
	/**
	 * Test the logic for three in a row
	 * @author Tommislav
	 */
	public class ThreeInARowLogicTest extends BaseGameLogicTest
	{
		[Test]
		public function testEmptyBoardNoWin():void
		{
			var board:String = "";
			board += "0,0,0\n";
			board += "0,0,0\n";
			board += "0,0,0";
			assertThat( testForWin(board, new ThreeInARowLogic()), not(true) );
			assertThat( getWinningCells(board, new ThreeInARowLogic()), emptyArray() );
		}
		
		[Test]
		public function testWinRows():void
		{
			var board:String;
			
			board = "";
			board += "1,1,1\n";
			board += "0,0,0\n";
			board += "0,0,0";
			assertThat( "top row", testForWin(board, new ThreeInARowLogic()) );
			
			board = "";
			board += "0,0,0\n";
			board += "1,1,1\n";
			board += "0,0,0";
			assertThat( "mid row", testForWin(board, new ThreeInARowLogic()) );
			
			board = "";
			board += "0,0,0\n";
			board += "0,0,0\n";
			board += "1,1,1";
			assertThat( "bottom row", testForWin(board, new ThreeInARowLogic()) );
		}
		
		[Test]
		public function testWinColumns():void
		{
			var board:String;
			
			board = "";
			board += "1,0,0\n";
			board += "1,0,0\n";
			board += "1,0,0";
			assertThat( "left column", testForWin(board, new ThreeInARowLogic()) );
			
			board = "";
			board += "0,1,0\n";
			board += "0,1,0\n";
			board += "0,1,0";
			assertThat( "mid column", testForWin(board, new ThreeInARowLogic()) );
			
			board = "";
			board += "0,0,1\n";
			board += "0,0,1\n";
			board += "0,0,1";
			assertThat( "right column", testForWin(board, new ThreeInARowLogic()) );
		}
		
		[Test]
		public function testWinDiagonals():void
		{
			var board:String;
			
			board = "";
			board += "1,0,0\n";
			board += "0,1,0\n";
			board += "0,0,1";
			assertThat( "diagonal \\", testForWin(board, new ThreeInARowLogic()) );
			
			board = "";
			board += "0,0,1\n";
			board += "0,1,0\n";
			board += "1,0,0";
			assertThat( "diagonal /", testForWin(board, new ThreeInARowLogic()) );
			
		}
	}

}