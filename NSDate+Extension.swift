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

        if components.year! > 0 {
            return Helper.string(from: "%%d%@yr", with: components.year!)
        }

        if components.month! > 0 {
            return Helper.string(from: "%%d%@mo", with: components.month!)
        }

        // TODO: localize for other calanders
        if components.day! >= 7 {
            let value = components.day!/7
            return Helper.string(from: "%%d%@w", with: value)
        }

        if components.day! > 0 {
            return Helper.string(from: "%%d%@d", with: components.day!)
        }

        if components.hour! > 0 {
            return Helper.string(from: "%%d%@h", with: components.hour!)
        }

        if components.minute! > 0 {
            return Helper.string(from: "%%d%@m", with: components.minute!)
        }

        if components.second! > 0 {
            return Helper.string(from: "%%d%@s", with: components.second! )
        }

        return ""
    }

    public var timeAgo: String {
        let components = self.dateComponents()

        if components.year! > 0 {
            if components.year! < 2 {
                return Helper.localizedStrings(for: "Last year")
            } else {
                return Helper.string(from: "%%d %@years ago", with: components.year!)
            }
        }

        if components.month! > 0 {
            if components.month! < 2 {
                return Helper.localizedStrings(for: "Last month")
            } else {
                return Helper.string(from: "%%d %@months ago", with: components.month!)
            }
        }

        // TODO: localize for other calanders
        if components.day! >= 7 {
            let week = components.day!/7
            if week < 2 {
                return Helper.localizedStrings(for: "Last week")
            } else {
                return Helper.string(from: "%%d %@weeks ago", with: week)
            }
        }

        if components.day! > 0 {
            if components.day! < 2 {
                return Helper.localizedStrings(for: "Yesterday")
            } else  {
                return Helper.string(from: "%%d %@days ago", with: components.day!)
            }
        }

        if components.hour! > 0 {
            if components.hour! < 2 {
                return Helper.localizedStrings(for: "An hour ago")
            } else  {
                return Helper.string(from: "%%d %@hours ago", with: components.hour!)
            }
        }

        if components.minute! > 0 {
            if components.minute! < 2 {
                return Helper.localizedStrings(for: "A minute ago")
            } else {
                return Helper.string(from: "%%d %@minutes ago", with: components.minute!)
            }
        }

        if components.second! > 0 {
            if components.second! < 5 {
                return Helper.localizedStrings(for: "Just now")
            } else {
                return Helper.string(from: "%%d %@seconds ago", with: components.second!)
            }
        }
        
        return ""
    }

    fileprivate func dateComponents() -> DateComponents {
        return Calendar.current.dateComponents([.second, .minute, .hour, .day, .month, .year], from: self, to: Date())
    }

}

