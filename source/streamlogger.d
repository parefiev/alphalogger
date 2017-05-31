import std.stdio;
import loglevel;
import std.datetime;
import std.format : format;
import loglevelconverter;
import iloggerback;

class StreamLogger : ILoggerBack
{
	protected File stdout;
	protected File stderr;

	public this(File stdout, File stderr)
	{
		this.stdout = stdout;
		this.stderr = stderr;
	}

	protected string embrace(string s)
	{
		const leftSep = '[';
		const rightSep = ']';
		return leftSep ~ s ~ rightSep;
	}

	public void log(LogLevel l, string m)
	{
		/**
		  * @todo Reserve place for timezone
		  * @todo print timezone (+01:00, -02:00, etc.) anyway and always
		  */
		auto prefix = this.embrace(format("%-27s", Clock.currTime().toISOExtString()));
		prefix ~= this.embrace(LogLevelConverter.to4LetterString(l));
		prefix ~= " ";

		switch(l)
		{
			case LogLevel.EMERGENCY:
			case LogLevel.ALERT:
			case LogLevel.CRITICAL:
			case LogLevel.ERROR:
			case LogLevel.WARNING:
				stderr.writeln(prefix ~ m);
				break;
			case LogLevel.NOTICE:
			case LogLevel.INFO:
			case LogLevel.DEBUG:
				stdout.writeln(prefix ~ m);
				break;
			default:
				/**
				  * @todo Add Exception throwing here, preferably some compile time
				  */
				assert(0);
		}
	}
}


