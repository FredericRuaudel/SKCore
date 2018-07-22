//
// Item.swift
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

public struct Item: Equatable, Codable {
    public let type: String?
    public let ts: String?
    public let channel: String?
    public let message: Message?
    private let expandableFile: Expandable<File>?
    public var file: File? {
        guard let expandableFile = expandableFile else { return nil }
        switch expandableFile {
        case .left(let id):
            return File(id: id)
        case .right(let file):
            return file
        }
    }
    private let expandableComment: Expandable<Comment>?
    public var comment: Comment? {
        guard let expandableComment = expandableComment else { return nil }
        switch expandableComment {
        case .left(let id):
            return Comment(id: id)
        case .right(let comment):
            return comment
        }
    }
    public var fileCommentID: String?
    
    enum CodingKeys: String, CodingKey {
        case type
        case ts
        case channel
        case message
        case expandableFile = "file"
        case expandableComment = "comment"
        case fileCommentID = "file_comment"
    }

    public static func == (lhs: Item, rhs: Item) -> Bool {
        return
            lhs.type == rhs.type &&
            lhs.channel == rhs.channel &&
            lhs.expandableFile == rhs.expandableFile &&
            lhs.expandableComment == rhs.expandableComment &&
            lhs.message == rhs.message
    }
}
