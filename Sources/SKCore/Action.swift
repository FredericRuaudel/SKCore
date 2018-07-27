//
// Action.swift
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

public struct Action: Codable {
    public let name: String?
    public let text: String?
    public let type: String?
    public let value: String?
    public let style: ActionStyle?
    public let confirm: Confirm?
    public let options: [Option]?
    public let dataSource: DataSource?

    public init(name: String, text: String, type: String = "button", style: ActionStyle = .defaultStyle, value: String? = nil,
                confirm: Confirm? = nil, options: [Option]? = nil, dataSource: DataSource? = nil) {
        self.name = name
        self.text = text
        self.type = type
        self.value = value
        self.style = style
        self.confirm = confirm
        self.options = options
        self.dataSource = dataSource
    }

    public struct Confirm: Codable {
        public let title: String?
        public let text: String?
        public let okText: String?
        public let dismissText: String?

        public init(text: String, title: String? = nil, okText: String? = nil, dismissText: String? = nil) {
            self.text = text
            self.title = title
            self.okText = okText
            self.dismissText = dismissText
        }
    }

    public struct Option: Codable {
        public let text: String?
        public let value: String?

        public init(text: String, value: String) {
            self.text = text
            self.value = value
        }
    }

    public enum DataSource: String, Codable {
        case users
        case channels
        case conversations
    }
}

public enum ActionStyle: String, Codable {
    case defaultStyle = "default"
    case primary = "primary"
    case danger = "danger"
}

public enum MessageResponseType: String, Codable {
    case inChannel = "in_channel"
    case ephemeral = "ephemeral"
}
