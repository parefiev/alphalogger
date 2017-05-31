import iformatter;
import loglevel;
import loglevelconverter;
import std.datetime;
import std.format;
import net.masterthought.rainbow.R;

class ColoriseConsoleFormatter : IFormatter
{
	protected string embrace(string s)
	{
		const leftSep = '[';
		const rightSep = ']';
		return leftSep ~ s ~ rightSep;
	}

	protected string colorise(LogLevel l, string s)
	{
		R result;

		switch (l)
		{
			case LogLevel.EMERGENCY:
				result = s.rainbow.red;
				break;
			case LogLevel.ALERT:
			case LogLevel.CRITICAL:
			case LogLevel.ERROR:
			case LogLevel.WARNING:
				result = s.rainbow.yellow;
				break;
			case LogLevel.NOTICE:
			case LogLevel.INFO:
			case LogLevel.DEBUG:
				result = s.rainbow.green;
				break;
			default:
				/**
				  * @todo Add Exception throwing here, preferably some compile time
				  */
				assert(0);
		}

		return result.toString;
	}

	public string format(LogLevel l, SysTime currTime, string m)
	{
		const sep = ' ';

		/**
		  * @todo Reserve place for timezone
		  * @todo print timezone (+01:00, -02:00, etc.) anyway and always
		  */
		auto prefix = this.embrace(std.format.format("%-27s", currTime.toISOExtString()));
		prefix ~= this.embrace(this.colorise(l, LogLevelConverter.to4LetterString(l)));
		prefix ~= sep;

		return prefix;
	}
}

