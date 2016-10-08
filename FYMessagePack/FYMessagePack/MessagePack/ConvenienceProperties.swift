//
//  ConvenienceProperties.swift
//  FYMessagePack
//
//  Created by 杨飞宇 on 2016/9/20.
//  Copyright © 2016年 FY. All rights reserved.
//

extension MessagePackValue {
    
    public var count: Swift.Int? {
        switch self {
        case let .Array(array):
            return array.count
        case let .Map(dict):
            return dict.count
        default:
            return nil
        }
    }

    public subscript (i: Swift.Int) -> MessagePackValue? {
        switch self {
        case let .Array(array):
            return i < array.count ? array[i] : Optional.None
        default:
            return nil
        }
    }

    public subscript (key: MessagePackValue) -> MessagePackValue? {
        switch self {
        case let .Map(dict):
            return dict[key]
        default:
            return nil
        }
    }

    public var isNil: Swift.Bool {
        switch self {
        case .Nil:
            return true
        default:
            return false
        }
    }

    public var integerValue: Int64? {
        switch self {
        case let .Int(value):
            return value
        case let .UInt(value) where value < numericCast(Swift.Int64.max):
            return numericCast(value) as Int64
        default:
            return nil
        }
    }

    public var unsignedIntegerValue: UInt64? {
        switch self {
        case let .Int(value) where value >= 0:
            return numericCast(value) as UInt64
        case let .UInt(value):
            return value
        default:
            return nil
        }
    }

    public var arrayValue: [MessagePackValue]? {
        switch self {
        case let .Array(array):
            return array
        default:
            return nil
        }
    }

    public var boolValue: Swift.Bool? {
        switch self {
        case let .Bool(value):
            return value
        default:
            return nil
        }
    }

    public var floatValue: Swift.Float? {
        switch self {
        case let .Float(value):
            return value
        case let .Double(value):
            return Swift.Float(value)
        default:
            return nil
        }
    }

    public var doubleValue: Swift.Double? {
        switch self {
        case let .Float(value):
            return Swift.Double(value)
        case let .Double(value):
            return value
        default:
            return nil
        }
    }

    public var stringValue: Swift.String? {
        switch self {
        case .Binary(let data):
            var result = ""
            result.reserveCapacity(data.count)
            for byte in data {
                result.append(Character(UnicodeScalar(byte)))
            }
            return result
        case let .String(string):
            return string
        default:
            return nil
        }
    }

    public var dataValue: Data? {
        switch self {
        case let .Binary(bytes):
            return bytes
        case let .Extended(_, data):
            return data
        default:
            return nil
        }
    }

    public var extendedValue: (Int8, Data)? {
        switch self {
        case let .Extended(type, data):
            return (type, data)
        default:
            return nil
        }
    }

    public var extendedType: Int8? {
        switch self {
        case let .Extended(type, _):
            return type
        default:
            return nil
        }
    }

    public var dictionaryValue: [MessagePackValue : MessagePackValue]? {
        switch self {
        case let .Map(dict):
            return dict
        default:
            return nil
        }
    }
}
