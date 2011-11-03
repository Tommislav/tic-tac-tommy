package utils 
{
	import org.osflash.signals.ISignal;
	/**
	 * Attach to a signal and you'll be able to count the number of times it has been invoked.
	 * You can reset it, and check the arguments that was passed as well.
	 * @author Tommy Salomonsson
	 */
	public class SignalWatcher
	{
		private var _count:int;
		private var _args:Array;
		
		public function SignalWatcher( signal:ISignal=null ) 
		{
			reset();
			
			if (signal != null)
				signal.add( this.signalCallback );
		}
		
		public function signalCallback( ...args ):void
		{
			_count++;
			_args.push( args );
		}
		
		public function reset():void
		{
			_count = 0;
			_args = new Array();
		}
		
		public function get count():int
		{
			return _count;
		}
	}
}