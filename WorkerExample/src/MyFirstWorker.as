package
{
	import flash.display.Sprite;
	import flash.system.Worker;
	import flash.system.MessageChannel;
	
	public class MyFirstWorker extends Sprite
	{
		private var mainToWorker:MessageChannel;
		private var workerToMain:MessageChannel;
		
		public function MyFirstWorker()
		{
			super();
			
			mainToWorker = Worker.current.getSharedProperty("mainToWorker");//createMessageChannel(myFirstWorker);
			workerToMain =  Worker.current.getSharedProperty("workerToMain");//myFirstWorker.createMessageChannel(Worker.current);
			
			workerToMain.send("Hai main App");
		}
	}
}