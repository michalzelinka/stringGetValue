#include <iostream>

// Input:  ...<body><h1 style="text-align: left;">Hello!</h1>...
// Usage:  std::string str = string_get_value( &input, 3, "<h1", ">", "</" );
// Output: Hello!

std::string string_get_value( std::string* data, unsigned int argument_count, ... )
{
	va_list arg;
	std::string ret = "";
	std::string::size_type start = 0, end = 0;

	va_start( arg, argument_count );

	for ( unsigned int i = argument_count; i > 0; i-- ) {
		if ( i == 1 ) {
			end = data->find( va_arg( arg, char* ), start );
			if ( start == std::string::npos || end == std::string::npos )
				break;
			ret = data->substr( start, end - start );
		} else {
			std::string term = va_arg( arg, char* );
			start = data->find( term, start );
			if ( start == std::string::npos )
				break;
			start += term.length();
		}
	}

	va_end( arg );
	return ret;
}
