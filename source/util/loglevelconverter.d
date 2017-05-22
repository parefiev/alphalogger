import loglevel;

struct LogLevelConverter
{
	static string toFullString(LogLevel level)
	{
		switch(level)
		{
			case LogLevel.EMERGENCY:
				return "EMERGENCY";
			case LogLevel.ALERT:
				return "ALERT";
			case LogLevel.CRITICAL:
				return "CRITICAL";
			case LogLevel.ERROR:
				return "ERROR";
			case LogLevel.WARNING:
				return "WARNING";
			case LogLevel.NOTICE:
				return "NOTICE";
			case LogLevel.INFO:
				return "INFO";
			case LogLevel.DEBUG:
				return "DEBUG";
			default:
				/**
				  * @todo Add Exception throwing here, preferably some compile time
				  */
				assert(0);
		}
	}

	static string to3LetterString(LogLevel level)
	{
		switch(level)
		{
			case LogLevel.EMERGENCY:
				return "EMR";
			case LogLevel.ALERT:
				return "ALR";
			case LogLevel.CRITICAL:
				return "CRT";
			case LogLevel.ERROR:
				return "ERR";
			case LogLevel.WARNING:
				return "WRN";
			case LogLevel.NOTICE:
				return "NTC";
			case LogLevel.INFO:
				return "INF";
			case LogLevel.DEBUG:
				return "DBG";
			default:
				/**
				  * @todo Add Exception throwing here, preferably some compile time
				  */
				assert(0);
		}
	}

	static string to4LetterString(LogLevel level)
	{
		switch(level)
		{
			case LogLevel.EMERGENCY:
				return "EMRG";
			case LogLevel.ALERT:
				return "ALRT";
			case LogLevel.CRITICAL:
				return "CRIT";
			case LogLevel.ERROR:
				return "ERRR";
			case LogLevel.WARNING:
				return "WARN";
			case LogLevel.NOTICE:
				return "NOTC";
			case LogLevel.INFO:
				return "INFO";
			case LogLevel.DEBUG:
				return "DBUG";
			default:
				/**
				  * @todo Add Exception throwing here, preferably some compile time
				  */
				assert(0);
		}
	}
}

