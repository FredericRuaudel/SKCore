//
// Attachment.swift
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

public struct Attachment: Codable {
    public let fallback: String?
    public let callbackID: String?
    public let type: String?
    public let color: String?
    public let pretext: String?
    public let authorName: String?
    public let authorLink: String?
    public let authorIcon: String?
    public let title: String?
    public let titleLink: String?
    public let text: String?
    public let fields: [AttachmentField]?
//    public let actions: [Action]?
    public let imageURL: String?
    public let thumbURL: String?
    public let footer: String?
    public let footerIcon: String?
    public let ts: Int?
    public let markdownEnabledFields: Set<AttachmentTextField>?

    public init(
        fallback: String,
        title: String?,
        callbackID: String? = nil,
        type: String? = nil,
        colorHex: String? = nil,
        pretext: String? = nil,
        authorName: String? = nil,
        authorLink: String? = nil,
        authorIcon: String? = nil,
        titleLink: String? = nil,
        text: String? = nil,
        fields: [AttachmentField]? = nil,
        actions: [Action]? = nil,
        imageURL: String? = nil,
        thumbURL: String? = nil,
        footer: String? = nil,
        footerIcon: String? = nil,
        ts: Int? = nil,
        markdownFields: Set<AttachmentTextField>? = nil
    ) {
        self.fallback = fallback
        self.callbackID = callbackID
        self.type = type
        self.color = colorHex
        self.pretext = pretext
        self.authorName = authorName
        self.authorLink = authorLink
        self.authorIcon = authorIcon
        self.title = title
        self.titleLink = titleLink
        self.text = text
        self.fields = fields
//        self.actions = actions
        self.imageURL = imageURL
        self.thumbURL = thumbURL
        self.footer = footer
        self.footerIcon = footerIcon
        self.ts = ts
        self.markdownEnabledFields = markdownFields
    }
    
    enum CodingKeys: String, CodingKey {
        case fallback
        case callbackID = "callbackId"
        case type = "attachmentType"
        case color
        case pretext
        case authorName
        case authorLink
        case authorIcon
        case title
        case titleLink
        case text
        case fields
//        case actions
        case imageURL = "imageUrl"
        case thumbURL = "thumbUrl"
        case footer
        case footerIcon
        case ts
        case markdownEnabledFields = "mrkdwnIn"
    }
}

public enum AttachmentColor: String, Codable {
    case good, warning, danger
}

public enum AttachmentTextField: String, Codable {
    case fallback = "fallback"
    case pretext = "pretext"
    case authorName = "author_name"
    case title = "title"
    case text = "text"
    case fields = "fields"
    case footer = "footer"
}
