import iloggerback;
import iloggerfront;
import loglevel;

abstract class AlphaLogger : ILoggerFront
{
	protected ILoggerBack back;

	public:
		void info(string m)
		{
			back.log(LogLevel.INFO, m);
		}

		void debug_(string m)
		{
			back.log(LogLevel.DEBUG, m);
		}

		void emergency(string m)
		{
			back.log(LogLevel.EMERGENCY, m);
		}

		void alert(string m)
		{
			back.log(LogLevel.ALERT, m);
		}

		void critical(string m)
		{
			back.log(LogLevel.CRITICAL, m);
		}

		void error(string m)
		{
			back.log(LogLevel.ERROR, m);
		}

		void warning(string m)
		{
			back.log(LogLevel.WARNING, m);
		}

		void notice(string m)
		{
			back.log(LogLevel.NOTICE, m);
		}
}

