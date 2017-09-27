//
//  NSDate+Extension.swift
//  Tasty
//
//  Created by Vitaliy Kuzmenko on 17/10/14.
//  http://github.com/vitkuzmenko
//  Copyright (c) 2014 Vitaliy Kuz'menko. All rights reserved.
//

import Foundation

private struct Helper {
    
    static let bundle: Bundle? = {
        let resourcePath: String?
        if let frameworkBundle = Bundle(identifier: "com.kevinlawler.NSDateTimeAgo") {
            // Load from Framework
            resourcePath = frameworkBundle.resourcePath
        } else {
            // Load from Main Bundle
            resourcePath = Bundle.main.resourcePath
        }
        guard let pathString = resourcePath else {
            return nil
        }
        let path = URL(fileURLWithPath: pathString).appendingPathComponent("NSDateTimeAgo.bundle")
        return Bundle(url: path)
    }()
    
    static func localizedStrings(for key: String) -> String {
        guard let bundle = bundle else {
            return ""
        }
        return NSLocalizedString(key, tableName: "NSDateTimeAgo", bundle: bundle, comment: "")
    }
    
    static func string(from format: String, with value: Int) -> String {
        let localeFormat = String(format: format, localeFormatUnderscores(with: Double(value)))
        return String(format: localizedStrings(for: localeFormat), value)
    }
    
    static func localeFormatUnderscores(with value: Double) -> String {
        guard let localeCode = Locale.preferredLanguages.first else {
            return ""
        }
        
        // Russian (ru) and Ukrainian (uk)
        if localeCode.hasPrefix("ru") || localeCode.hasPrefix("uk") {
            let XY = Int(floor(value)) % 100
            let Y = Int(floor(value)) % 10
            
            if Y == 0 || Y > 4 || (XY > 10 && XY < 15) {
                return ""
            }
            
            if Y > 1 && Y < 5 && (XY < 10 || XY > 20) {
                return "_"
            }
            
            if Y == 1 && XY != 11 {
                return "__"
            }
        }
        
        return ""
    }
}

extension Date {
    
    // shows 1 or two letter abbreviation for units.
    // does not include 'ago' text ... just {value}{unit-abbreviation}
    // does not include interim summary options such as 'Just now'
    public var timeAgoSimple: String {
        let components = self.dateComponents()
        
        if let year = components.year, year > 0 {
            return Helper.string(from: "%%d%@yr", with: year)
        }

        if let month = components.month, month > 0 {
            return Helper.string(from: "%%d%@mo", with: month)
        }

        // TODO: localize for other calanders
        if let day = components.day  {
            if day >= 7 {
                let value = day / 7
                return Helper.string(from: "%%d%@w", with: value)
            } else if day > 0 {
                return Helper.string(from: "%%d%@d", with: day)
            }
        }

        if let hour = components.hour, hour > 0 {
            return Helper.string(from: "%%d%@h", with: hour)
        }

        if let minute = components.minute, minute > 0 {
            return Helper.string(from: "%%d%@m", with: minute)
        }

        if let second = components.second, second > 0 {
            return Helper.string(from: "%%d%@s", with: second)
        }

        return ""
    }

    public var timeAgo: String {
        let components = self.dateComponents()

        if let year = components.year, year > 0 {
            if year < 2 {
                return Helper.localizedStrings(for: "Last year")
            } else {
                return Helper.string(from: "%%d %@years ago", with: year)
            }
        }

        if let month = components.month, month > 0 {
            if month < 2 {
                return Helper.localizedStrings(for: "Last month")
            } else {
                return Helper.string(from: "%%d %@months ago", with: month)
            }
        }

        // TODO: localize for other calanders
        if let day = components.day {
            if day >= 7 {
                let week = day / 7
                if week < 2 {
                    return Helper.localizedStrings(for: "Last week")
                } else {
                    return Helper.string(from: "%%d %@weeks ago", with: week)
                }
            } else if day > 0  {
                if day < 2 {
                    return Helper.localizedStrings(for: "Yesterday")
                } else  {
                    return Helper.string(from: "%%d %@days ago", with: day)
                }
            }
        }

        if let hour = components.hour, hour > 0 {
            if hour < 2 {
                return Helper.localizedStrings(for: "An hour ago")
            } else  {
                return Helper.string(from: "%%d %@hours ago", with: hour)
            }
        }

        if let minute = components.minute, minute > 0 {
            if minute < 2 {
                return Helper.localizedStrings(for: "A minute ago")
            } else {
                return Helper.string(from: "%%d %@minutes ago", with: minute)
            }
        }

        if let second = components.second, second > 0 {
            if second < 5 {
                return Helper.localizedStrings(for: "Just now")
            } else {
                return Helper.string(from: "%%d %@seconds ago", with: second)
            }
        }
        
        return ""
    }

    fileprivate func dateComponents() -> DateComponents {
        return Calendar.current.dateComponents([.second, .minute, .hour, .day, .month, .year], from: self, to: Date())
    }

}

