import Foundation

struct ProCompany: Decodable {
    var entityId = ""
    var companyName = ""
    var ratingCount = ""
    var compositeRating = ""
    var companyOverview = ""
    var canadianSP = false
    var spanishSpeaking = false
    var phoneNumber = ""
    var latitude: Double?
    var longitude: Double?
    var servicesOffered: String?
    var specialty = ""
    var primaryLocation = ""
    var email = ""
}
