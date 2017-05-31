import std.stdio;
import std.datetime;
import loglevel;
import loglevelconverter;
import iloggerback;
import iformatter;

class StreamLogger : ILoggerBack
{
	protected IFormatter f;
	protected File stdout;
	protected File stderr;

	public this(File stdout, File stderr, IFormatter f)
	{
		this.stdout = stdout;
		this.stderr = stderr;
		this.f = f;
	}

	public void log(LogLevel l, string m)
	{
		/**
		  * @todo Reserve place for timezone
		  * @todo print timezone (+01:00, -02:00, etc.) anyway and always
		  */
		auto formattedMessage = f.format(l, Clock.currTime, m);

		switch(l)
		{
			case LogLevel.EMERGENCY:
			case LogLevel.ALERT:
			case LogLevel.CRITICAL:
			case LogLevel.ERROR:
			case LogLevel.WARNING:
				stderr.writeln(formattedMessage);
				break;
			case LogLevel.NOTICE:
			case LogLevel.INFO:
			case LogLevel.DEBUG:
				stdout.writeln(formattedMessage);
				break;
			default:
				/**
				  * @todo Add Exception throwing here, preferably some compile time
				  */
				assert(0);
		}
	}
}


