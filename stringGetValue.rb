#!/usr/bin/ruby
# encoding: utf-8

# Input:  ...<body><h1 style="text-align: left;">Hello!</h1>...
# Usage:  s = s.getValue(['<h1','>'],'</')
# Usage:  s = s.getValueAlt('<h1','>','</')
# Output: Hello!

class String

	def getValue(begins, end_)
		si = 0
		ei = 0
		begins.each {|b|
			si = self.index(b, si)
			return nil if si == nil
			si += b.length
		}
		ei = self.index(end_, si)
		return nil if ei == nil
		ei -= 1
		return self[si..ei]
	end

	def getValueAlt(*args)
		throw :few_arguments if args.size < 1

		patterns = args[0..args.size-2]
		terminator = args[args.size-1]
		start = 0
		end_ = 0

		patterns.each do|pattern|
			start = self.index(pattern, start)
			start += pattern.length
		end

		end_ = terminator == :eol ? -1 : self.index(terminator, start) - 1
		return self[start..end_]
	end

end
