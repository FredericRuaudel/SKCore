//
// User.swift
//
// Copyright © 2017 Peter Zignego. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

public struct User: Codable {
    public struct Profile: Codable {
        public var firstName: String?
        public var lastName: String?
        public var realName: String?
        public var email: String?
        public var phone: String?
        public var image24: String?
        public var image32: String?
        public var image48: String?
        public var image72: String?
        public var image192: String?
        public var image512: String?
        public var image1024: String?
        public var customProfile: CustomProfile? = [:]

        enum CodingKeys: String, CodingKey {
            case firstName
            case lastName
            case realName
            case email
            case phone
            case image24
            case image32
            case image48
            case image72
            case image192
            case image512
            case image1024
            case customProfile = "fields"
        }
    }

    public let id: String?
    public var name: String?
    public var deleted: Bool?
    public var profile: Profile?
    public var doNotDisturbStatus: DoNotDisturbStatus?
    public var presence: String?
    public var color: String?
    public let isBot: Bool?
    public var isAdmin: Bool?
    public var isOwner: Bool?
    public var isPrimaryOwner: Bool?
    public var isRestricted: Bool?
    public var isUltraRestricted: Bool?
    public var has2fa: Bool?
    public var hasFiles: Bool?
    public var status: String?
    public var timeZone: String?
    public var timeZoneLabel: String?
    public var timeZoneOffSet: Int?
    public var preferences: [String: PreferenceValue]?
    // Client properties
    public var userGroups: [String: String]?

    public init(id: String?) {
        self.id = id
        self.isBot = nil
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case deleted
        case profile
        case doNotDisturbStatus
        case presence
        case color
        case isBot
        case isAdmin
        case isOwner
        case isPrimaryOwner
        case isRestricted
        case isUltraRestricted
        case has2fa
        case hasFiles
        case status
        case timeZone = "tz"
        case timeZoneLabel = "tzLabel"
        case timeZoneOffSet = "tzOffset"
        case preferences = "prefs"
        case userGroups
    }
}
