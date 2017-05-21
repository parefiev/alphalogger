import std.stdio;
import alphalogger;
import streamlogger;
import loglevel;

class TtyLogger : AlphaLogger
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

