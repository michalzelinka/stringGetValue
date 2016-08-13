//
//  String+GetValue.swift
//
//  Created by Michal Zelinka on 13/8/16.
//  Copyright (c) 2016. All rights reserved.
//

// Input:  ...<body><h1 style="text-align: left;">Hello!</h1>...
// Usage:  var p = s.parsedValue(starters: [ "<h1", ">" ], ending: "</")
// Output: Hello!

import Foundation

extension String {

	func parsedValue(starters starters: [String]? = nil, ending: String? = nil) -> String? {

		var range = self.rangeOfString(self)!

		if starters != nil && starters!.count > 0 {
			for starter in starters! {
				if starter.lengthOfBytesUsingEncoding(NSASCIIStringEncoding) == 0 { continue }
				if let tmp = self.rangeOfString(starter, options: [], range: range) {
					range.startIndex = tmp.endIndex
				}
				else { return nil }
			}
		}

		if ending != nil && ending!.lengthOfBytesUsingEncoding(NSASCIIStringEncoding) > 0 {
			if let tmp = self.rangeOfString(ending!, options: [], range: range) {
				range.endIndex = tmp.startIndex
			}
			else { return nil }
		}

		return self.substringWithRange(range)
	}
}
