//
// Channel.swift
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

public struct Channel: Codable {
    public let id: String?
    public let created: Int?
    public let creator: String?
    public var name: String?
    public var isArchived: Bool?
    public var isGeneral: Bool?
    public var isChannel: Bool?
    public var isGroup: Bool?
    public let isIm: Bool?
    public let isMpim: Bool?
    public var user: String?
    public var isUserDeleted: Bool?
    public var isOpen: Bool?
    public var topic: Topic?
    public var purpose: Topic?
    public var isMember: Bool?
    public var lastRead: String?
    public var latest: Message?
    public var unreadCount: Int?
    public var unreadCountDisplay: Int?
    public var hasPins: Bool?
    public var members: [String]?
    // Client use
    public var pinnedItems: [Item]? = []
    public var usersTyping: [String]? = []
    public var messages: [String: Message]? = [:]

    @available(*, unavailable, renamed: "isMpim")
    public var isMPIM: Bool? {
        return isMpim
    }
    
    @available(*, unavailable, renamed: "isIm")
    public var isIM: Bool? {
        return isIm
    }
    
    @available(*, unavailable, renamed: "unreadCount")
    public var unread: Int? {
        return unreadCount
    }

    public init(id: String?) {
        self.id = id
        created = nil
        creator = nil
        isChannel = true
        isGroup = false
        isIm = false
        isMpim = false
    }
}
