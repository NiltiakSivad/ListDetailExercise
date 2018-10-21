import Foundation
import UIKit

struct ProCompanyViewModel {
    var entityId = ""
    var companyName = ""
    var ratingCount: Int = 0
    var compositeRating: Float = 0.0
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

    var formattedRating: String {
        if ratingCount > 0 {
            return "Ratings: \(compositeRating) | \(ratingCount) rating(s)"
        }
        return "References Available"
    }

    var ratingTextColor: UIColor {
        if compositeRating == 0 {
            return .black
        } else if compositeRating >= 4.0 {
            return .green
        } else if compositeRating >= 3.0 && compositeRating < 4.0 {
            return .orange
        } else {
            return .red
        }
    }

    init(proCompany: ProCompany) {
        entityId = proCompany.entityId
        companyName = proCompany.companyName

        if let ratingCountNum = Int(proCompany.ratingCount) {
            ratingCount = ratingCountNum
        }
        if let compositeRatingNum = Float(proCompany.compositeRating) {
            compositeRating = compositeRatingNum
        }
        companyOverview = proCompany.companyOverview
        canadianSP = proCompany.canadianSP
        spanishSpeaking = proCompany.spanishSpeaking
        phoneNumber = proCompany.phoneNumber
        latitude = proCompany.latitude
        longitude = proCompany.longitude
        servicesOffered = proCompany.servicesOffered
        specialty = proCompany.specialty
        primaryLocation = proCompany.primaryLocation
        email = proCompany.email
    }
}
