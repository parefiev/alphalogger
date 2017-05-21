import std.stdio;
import alphalogger;
import loglevel;

class StreamLogger : AlphaLogger
{
	protected File stdout;
	protected File stderr;

	public this(File stdout, File stderr)
	{
		this.stdout = stdout;
		this.stderr = stderr;
	}

	public void log(LogLevel l, string m)
	{
		switch(l)
		{
			case LogLevel.EMERGENCY:
			case LogLevel.ALERT:
			case LogLevel.CRITICAL:
			case LogLevel.ERROR:
			case LogLevel.WARNING:
				stderr.writeln(m);
				break;
			case LogLevel.NOTICE:
			case LogLevel.INFO:
			case LogLevel.DEBUG:
				stdout.writeln(m);
				break;
			default:
				/**
				  * @todo Add Exception throwing here, preferably some compile time
				  */
				assert(0);
		}
	}
}


