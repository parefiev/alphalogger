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
				result = s.rainbow.lightRed;
				break;
			case LogLevel.ALERT:
				result = s.rainbow.magenta;
				break;
			case LogLevel.CRITICAL:
				result = s.rainbow.lightMagenta;
				break;
			case LogLevel.ERROR:
				result = s.rainbow.yellow;
				break;
			case LogLevel.WARNING:
				result = s.rainbow.lightYellow;
				break;
			case LogLevel.NOTICE:
				result = s.rainbow.cyan;
				break;
			case LogLevel.INFO:
				result = s.rainbow.lightCyan;
				break;
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

