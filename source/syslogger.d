import iloggerback;
import loglevel;
import ttylogger;

static class SysLogger
{
	protected static ILoggerBack l;

	protected static this()
	{
		l = new TtyLogger();
	}

	public:
		static void info(string message)
		{
			log(LogLevel.INFO, message);
		}

		static void debug_(string message)
		{
			log(LogLevel.DEBUG, message);
		}

		static void emergency(string message)
		{
			log(LogLevel.EMERGENCY, message);
		}

		static void alert(string message)
		{
			log(LogLevel.ALERT, message);
		}

		static void critical(string message)
		{
			log(LogLevel.CRITICAL, message);
		}

		static void error(string message)
		{
			log(LogLevel.ERROR, message);
		}

		static void warning(string message)
		{
			log(LogLevel.WARNING, message);
		}

		static void notice(string message)
		{
			log(LogLevel.NOTICE, message);
		}

		static void log(LogLevel logLevel, string m)
		{
			l.log(logLevel, m);
		}
}

