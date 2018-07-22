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

import XCTest
@testable import SKCore

struct ChannelContainer: Codable {
    let channel: Channel
}

struct UserContainer: Codable {
    let user: User
}

struct MessageListContainer: Codable {
    let messages: [Message]
}

final class SKCoreTests: XCTestCase {
    let jsonDecoder = JSONDecoder()
    
    override func setUp() {
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func testEvents() throws {
        let data = Helper.JSONData.events
        let events = try jsonDecoder.decode([String:Event].self, from: data)
//        dump(events)
        XCTAssertEqual(events.keys.count, eventsKeys.count)
    }
    
    func testChannel() throws {
        let data = Helper.JSONData.channel
        let channelContainer = try jsonDecoder.decode(ChannelContainer.self, from: data)
//        dump(channelContainer.channel)
        let channel = channelContainer.channel
        XCTAssertNotNil(channel.id)
        XCTAssertNotNil(channel.created)
        XCTAssertNotNil(channel.creator)
        XCTAssertNotNil(channel.name)
        XCTAssertNotNil(channel.isArchived)
        XCTAssertNotNil(channel.isChannel)
        XCTAssertNotNil(channel.isGeneral)
        XCTAssertNotNil(channel.isMember)
        XCTAssertNotNil(channel.isMPIM)
        XCTAssertNotNil(channel.lastRead)
        XCTAssertNotNil(channel.unreadCount)
        XCTAssertNotNil(channel.unreadCountDisplay)
        XCTAssertNotNil(channel.members)
        XCTAssertNotNil(channel.topic?.value)
        XCTAssertNotNil(channel.topic?.creator)
        XCTAssertNotNil(channel.topic?.lastSet)
        XCTAssertNotNil(channel.purpose?.value)
        XCTAssertNotNil(channel.purpose?.creator)
        XCTAssertNotNil(channel.purpose?.lastSet)
        XCTAssertNotNil(channel.latest?.text)
        XCTAssertNotNil(channel.latest?.username)
        XCTAssertNotNil(channel.latest?.botId)
        XCTAssertNotNil(channel.latest?.type)
        XCTAssertNotNil(channel.latest?.subtype)
        XCTAssertNotNil(channel.latest?.ts)
    }
    
    func testConversation() throws {
        let data = Helper.JSONData.conversation
        let conversationContainer = try jsonDecoder.decode(ChannelContainer.self, from: data)
        let conversation = conversationContainer.channel
//        dump(conversation)
        XCTAssertNotNil(conversation.id)
        XCTAssertNotNil(conversation.created)
        XCTAssertNotNil(conversation.creator)
        XCTAssertNotNil(conversation.name)
        XCTAssertNotNil(conversation.isArchived)
        XCTAssertNotNil(conversation.isChannel)
        XCTAssertNotNil(conversation.isGeneral)
        XCTAssertNotNil(conversation.isMember)
        XCTAssertNotNil(conversation.lastRead)
        XCTAssertNotNil(conversation.isGroup)
        XCTAssertNotNil(conversation.isMPIM)
        XCTAssertNotNil(conversation.topic?.value)
        XCTAssertNotNil(conversation.topic?.creator)
        XCTAssertNotNil(conversation.topic?.lastSet)
        XCTAssertNotNil(conversation.purpose?.value)
        XCTAssertNotNil(conversation.purpose?.creator)
        XCTAssertNotNil(conversation.purpose?.lastSet)
    }
    
    func testFile() throws {
        let data = Helper.JSONData.file
        let file = try jsonDecoder.decode(File.self, from: data)
//        dump(file)
        XCTAssertNotNil(file.id)
        XCTAssertNotNil(file.created)
        XCTAssertNotNil(file.name)
        XCTAssertNotNil(file.title)
        XCTAssertNotNil(file.prettyType)
        XCTAssertNotNil(file.user)
        XCTAssertNotNil(file.mode)
        XCTAssertNotNil(file.editable)
        XCTAssertNotNil(file.isExternal)
        XCTAssertNotNil(file.externalType)
        XCTAssertNotNil(file.size)
        XCTAssertNotNil(file.urlPrivate)
        XCTAssertNotNil(file.urlPrivateDownload)
        XCTAssertNotNil(file.thumb64)
        XCTAssertNotNil(file.thumb80)
        XCTAssertNotNil(file.thumb360)
        XCTAssertNotNil(file.thumb360gif)
        XCTAssertNotNil(file.thumb360w)
        XCTAssertNotNil(file.thumb360h)
        XCTAssertNotNil(file.thumb480)
        XCTAssertNotNil(file.thumb480w)
        XCTAssertNotNil(file.thumb480h)
        XCTAssertNotNil(file.permalink)
        XCTAssertNotNil(file.editLink)
        XCTAssertNotNil(file.preview)
        XCTAssertNotNil(file.previewHighlight)
        XCTAssertNotNil(file.lines)
        XCTAssertNotNil(file.linesMore)
        XCTAssertNotNil(file.isPublic)
        XCTAssertNotNil(file.channels)
        XCTAssertNotNil(file.groups)
        XCTAssertNotNil(file.ims)
        XCTAssertNotNil(file.isStarred)
        XCTAssertNotNil(file.pinnedTo)
    }
    
    func testGroup() throws {
        let data = Helper.JSONData.group
        let group = try jsonDecoder.decode(Channel.self, from: data)
//        dump(group)
        XCTAssertNotNil(group.id)
        XCTAssertNotNil(group.created)
        XCTAssertNotNil(group.creator)
        XCTAssertNotNil(group.name)
        XCTAssertNotNil(group.isArchived)
        XCTAssertNotNil(group.lastRead)
        XCTAssertNotNil(group.isGroup)
        XCTAssertNotNil(group.isMPIM)
        XCTAssertNotNil(group.unreadCount)
        XCTAssertNotNil(group.unreadCountDisplay)
        XCTAssertNotNil(group.members)
        XCTAssertNotNil(group.topic?.value)
        XCTAssertNotNil(group.topic?.creator)
        XCTAssertNotNil(group.topic?.lastSet)
        XCTAssertNotNil(group.purpose?.value)
        XCTAssertNotNil(group.purpose?.creator)
        XCTAssertNotNil(group.purpose?.lastSet)
    }
    
    func testIm() throws {
        let data = Helper.JSONData.im
        let im = try jsonDecoder.decode(Channel.self, from: data)
//        dump(im)
        XCTAssertNotNil(im.id)
        XCTAssertNotNil(im.created)
        XCTAssertNotNil(im.user)
        XCTAssertNotNil(im.isIM)
        XCTAssertNotNil(im.isUserDeleted)
    }
    
    func testMpim() throws {
        let data = Helper.JSONData.mpim
        let mpim = try jsonDecoder.decode(Channel.self, from: data)
//        dump(mpim)
        XCTAssertNotNil(mpim.id)
        XCTAssertNotNil(mpim.created)
        XCTAssertNotNil(mpim.creator)
        XCTAssertNotNil(mpim.name)
        XCTAssertNotNil(mpim.lastRead)
        XCTAssertNotNil(mpim.isGroup)
        XCTAssertNotNil(mpim.isMPIM)
        XCTAssertNotNil(mpim.unreadCount)
        XCTAssertNotNil(mpim.unreadCountDisplay)
        XCTAssertNotNil(mpim.members)
    }
    
    func testUser() throws {
        let data = Helper.JSONData.user
        let userContainer = try jsonDecoder.decode(UserContainer.self, from: data)
        let user = userContainer.user
//        dump(user)
        XCTAssertNotNil(user.id)
        XCTAssertNotNil(user.name)
        XCTAssertNotNil(user.deleted)
        XCTAssertNotNil(user.profile?.realName)
        XCTAssertNotNil(user.profile?.email)
        XCTAssertNotNil(user.profile?.image24)
        XCTAssertNotNil(user.profile?.image32)
        XCTAssertNotNil(user.profile?.image48)
        XCTAssertNotNil(user.profile?.image72)
        XCTAssertNotNil(user.profile?.image192)
        XCTAssertNotNil(user.color)
        XCTAssertNotNil(user.isBot)
        XCTAssertNotNil(user.isAdmin)
        XCTAssertNotNil(user.isOwner)
        XCTAssertNotNil(user.isPrimaryOwner)
        XCTAssertNotNil(user.isRestricted)
        XCTAssertNotNil(user.isUltraRestricted)
        XCTAssertNotNil(user.timeZone)
        XCTAssertNotNil(user.timeZoneLabel)
        XCTAssertNotNil(user.timeZoneOffSet)
    }
    
    func testUserGroup() throws {
        let data = Helper.JSONData.usergroup
        let userGroup = try jsonDecoder.decode(UserGroup.self, from: data)
//        dump(userGroup)
        XCTAssertNotNil(userGroup.id)
        XCTAssertNotNil(userGroup.teamID)
        XCTAssertNotNil(userGroup.isUserGroup)
        XCTAssertNotNil(userGroup.name)
        XCTAssertNotNil(userGroup.description)
        XCTAssertNotNil(userGroup.handle)
        XCTAssertNotNil(userGroup.isExternal)
        XCTAssertNotNil(userGroup.dateCreated)
        XCTAssertNotNil(userGroup.dateUpdated)
        XCTAssertNotNil(userGroup.dateDeleted)
        XCTAssertNotNil(userGroup.autoType)
        XCTAssertNotNil(userGroup.createdBy)
        XCTAssertNotNil(userGroup.updatedBy)
        XCTAssertNotNil(userGroup.users)
        XCTAssertNotNil(userGroup.userCount)
        XCTAssertEqual(userGroup.users?.count, userGroup.userCount)
    }
    
    func testBot() throws {
        let data = Helper.JSONData.bot
        let bot = try jsonDecoder.decode(Bot.self, from: data)
//        dump(bot)
        XCTAssertNotNil(bot.id)
        XCTAssertNotNil(bot.name)
        XCTAssertNotNil(bot.icons?.image36)
        XCTAssertNotNil(bot.icons?.image48)
        XCTAssertNotNil(bot.icons?.image72)
    }
    
    func testMessages() throws {
        let data = Helper.JSONData.messages
        let messagesContainer = try jsonDecoder.decode(MessageListContainer.self, from: data)
        let messages = messagesContainer.messages
        dump(messages)
        
        XCTAssertEqual(messages.count, 4)
        for message in messages {
            XCTAssertNotNil(message.type)
            XCTAssertNotNil(message.ts)
        }
        
        let simpleMessage = messages[0]
        XCTAssertNotNil(simpleMessage.user)
        XCTAssertNotNil(simpleMessage.text)
        
        let messageWithReactions = messages[1]
        XCTAssertNotNil(messageWithReactions.user)
        XCTAssertNotNil(messageWithReactions.text)
        XCTAssertNotNil(messageWithReactions.isStarred)
        
        let messageWithAttachments = messages[3]
        XCTAssertNotNil(messageWithAttachments.username)
        XCTAssertNotNil(messageWithAttachments.botId)
        XCTAssertNotNil(messageWithAttachments.subtype)
        XCTAssertNotNil(messageWithAttachments.text)

    }
    
    let eventsKeys = [
        // Bot Event
        "bot_added","bot_changed",
        // Channel Event
        "channel_archive","channel_created","channel_deleted",
        "channel_joined", "channel_left", "channel_marked",
        "channel_rename","channel_unarchive",
        // Group Event
        "group_archive","group_close","group_joined",
        "group_left", "group_marked","group_rename","group_unarchive",
        // Im Event
        "im_close","im_created","im_marked","im_open", "manual_presence_change",
        // Message Event
        "message::channel_archive", "message::channel_join", "message::channel_leave", "message::channel_name",
        "message::group_archive", "message::group_join", "message::group_leave", "message::group_name", "message::group_unarchive",
        "message::message_changed", "message::message_deleted",
        // Preference Event
        "pref_change", "presence_change",
        // Reaction Event
        "reaction_added", "reaction_removed",
        // Team Event
        "team_domain_change", "team_join", "team_pref_change",
        "team_rename",
        // User Event
        "user_change", "user_typing"
    ]
    
    
    
    static var allTests = [
        ("testChannel", testChannel),
        ("testConversation", testConversation),
        ("testFile", testFile),
        ("testGroup", testGroup),
        ("testIm", testIm),
        ("TestMpim", testMpim),
        ("testUser", testUser),
        ("testUserGroup", testUserGroup),
        ("testEvents",testEvents)
    ]
}
