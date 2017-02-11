//
//	YKLive.swift
//
//	Create by ben on 3/11/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct YKLive{

	var city : String!
	var creator : YKCreator!
	var group : Int!
	var id : String!
	var image : String!
	var link : Int!
	var multi : Int!
	var name : String!
	var onlineUsers : Int!
	var optimal : Int!
	var pubStat : Int!
	var roomId : Int!
	var rotate : Int!
	var shareAddr : String!
	var slot : Int!
	var status : Int!
	var streamAddr : String!
	var version : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		city = dictionary["city"] as? String
		if let creatorData = dictionary["creator"] as? NSDictionary{
				creator = YKCreator(fromDictionary: creatorData)
			}
		group = dictionary["group"] as? Int
		id = dictionary["id"] as? String
		image = dictionary["image"] as? String
		link = dictionary["link"] as? Int
		multi = dictionary["multi"] as? Int
		name = dictionary["name"] as? String
		onlineUsers = dictionary["online_users"] as? Int
		optimal = dictionary["optimal"] as? Int
		pubStat = dictionary["pub_stat"] as? Int
		roomId = dictionary["room_id"] as? Int
		rotate = dictionary["rotate"] as? Int
		shareAddr = dictionary["share_addr"] as? String
		slot = dictionary["slot"] as? Int
		status = dictionary["status"] as? Int
		streamAddr = dictionary["stream_addr"] as? String
		version = dictionary["version"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if city != nil{
			dictionary["city"] = city
		}
		if creator != nil{
			dictionary["creator"] = creator.toDictionary()
		}
		if group != nil{
			dictionary["group"] = group
		}
		if id != nil{
			dictionary["id"] = id
		}
		if image != nil{
			dictionary["image"] = image
		}
		if link != nil{
			dictionary["link"] = link
		}
		if multi != nil{
			dictionary["multi"] = multi
		}
		if name != nil{
			dictionary["name"] = name
		}
		if onlineUsers != nil{
			dictionary["online_users"] = onlineUsers
		}
		if optimal != nil{
			dictionary["optimal"] = optimal
		}
		if pubStat != nil{
			dictionary["pub_stat"] = pubStat
		}
		if roomId != nil{
			dictionary["room_id"] = roomId
		}
		if rotate != nil{
			dictionary["rotate"] = rotate
		}
		if shareAddr != nil{
			dictionary["share_addr"] = shareAddr
		}
		if slot != nil{
			dictionary["slot"] = slot
		}
		if status != nil{
			dictionary["status"] = status
		}
		if streamAddr != nil{
			dictionary["stream_addr"] = streamAddr
		}
		if version != nil{
			dictionary["version"] = version
		}
		return dictionary
	}

}