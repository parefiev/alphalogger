import std.stdio;
import streamlogger;
import loglevel;
import iloggerback;
import coloriseconsoleformatter;

class TtyLogger : ILoggerBack
{
	protected StreamLogger streamLogger;

	public this()
	{
		streamLogger = new StreamLogger(stdout, stderr, new ColoriseConsoleFormatter);
	}

	public void log(LogLevel l, string message)
	{
		streamLogger.log(l, message);
	}
}

