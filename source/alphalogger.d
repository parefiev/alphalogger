import ilogger;
import loglevel;

abstract class AlphaLogger : ILogger
{
	public:
		void info(string m)
		{
			log(LogLevel.INFO, m);
		}

		void debug_(string m)
		{
			log(LogLevel.DEBUG, m);
		}

		void emergency(string m)
		{
			log(LogLevel.EMERGENCY, m);
		}

		void alert(string m)
		{
			log(LogLevel.ALERT, m);
		}

		void critical(string m)
		{
			log(LogLevel.CRITICAL, m);
		}

		void error(string m)
		{
			log(LogLevel.ERROR, m);
		}

		void warning(string m)
		{
			log(LogLevel.WARNING, m);
		}

		void notice(string m)
		{
			log(LogLevel.NOTICE, m);
		}
}

