import Foundation

struct Article : Codable {

	let comments : Int?
	let content : String?
	let createdAt : String?
	let id : String?
	let likes : Int?
	let media : [Media]?
	let user : [User]?


	enum CodingKeys: String, CodingKey {
		case comments = "comments"
		case content = "content"
		case createdAt = "createdAt"
		case id = "id"
		case likes = "likes"
		case media = "media"
		case user = "user"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		comments = try values.decodeIfPresent(Int.self, forKey: .comments)
		content = try values.decodeIfPresent(String.self, forKey: .content)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		likes = try values.decodeIfPresent(Int.self, forKey: .likes)
		media = try values.decodeIfPresent([Media].self, forKey: .media)
		user = try values.decodeIfPresent([User].self, forKey: .user)
	}
}
