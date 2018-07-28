//
// Message.swift
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

public final class Message: Equatable, Codable {
    public let type = "message"
    public let subtype: String?
    public var ts: String?
    public var threadTs: String?
    public let parentUserId: String?
    public var replyCount: Int?
    public var replies: [Reply]?
    public let user: String?
    public let channel: String?
    public var hidden: Bool?
    public var text: String?
    public let botId: String?
    public let username: String?
    public let deletedTs: String?
    public var purpose: String?
    public var topic: String?
    public var name: String?
    public var members: [String]?
    public var oldName: String?
    public let upload: Bool?
    public let itemType: String?
    public var isStarred: Bool?
    public var pinnedTo: [String]?
    public let comment: Comment?
    public let file: File?
    public var reactions: [Reaction]? = []
    public var attachments: [Attachment]?
    public var responseType: MessageResponseType?
    public var replaceOriginal: Bool?
    public var deleteOriginal: Bool?
    @available(*, unavailable, renamed: "botId")
    public var botID: String? {
        return botId
    }
    @available(*, unavailable, message: "is it still provided by Slack API?")
    public var icons: [String: Any]? {
        return [:]
    }

    public init(ts: String?) {
        self.ts = ts
        threadTs = nil
        parentUserId = nil
        subtype = nil
        user = nil
        channel = nil
        botId = nil
        username = nil
        deletedTs = nil
        upload = nil
        itemType = nil
        comment = nil
        file = nil
    }

    public static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.ts == rhs.ts && lhs.threadTs == rhs.threadTs && lhs.user == rhs.user && lhs.text == rhs.text
    }
}
