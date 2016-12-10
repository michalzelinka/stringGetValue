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

	func parsedValue(starters: [String]? = nil, ending: String? = nil) -> String? {

		var range = self.range(of: self)!

		if starters != nil && starters!.count > 0 {
			for starter in starters! {
				if starter.lengthOfBytes(using: .ascii) == 0 { continue }
				if let tmp = self.range(of: starter, options: [], range: range) {
					range = Range(uncheckedBounds: (tmp.upperBound, range.upperBound))
				}
				else { return nil }
			}
		}

		if ending != nil && ending!.lengthOfBytes(using: .ascii) > 0 {
			if let tmp = self.range(of: ending!, options: [], range: range) {
				range = Range(uncheckedBounds: (range.lowerBound, tmp.lowerBound))
			}
			else { return nil }
		}

		return self.substring(with: range)
	}
}
