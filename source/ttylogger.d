import std.stdio;
import streamlogger;
import loglevel;
import iloggerback;

class TtyLogger : ILoggerBack
{
	protected StreamLogger streamLogger;

	public this()
	{
		streamLogger = new StreamLogger(stdout, stderr);
	}

	public void log(LogLevel l, string message)
	{
		streamLogger.log(l, message);
	}
}

