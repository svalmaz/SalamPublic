import SwiftUI

struct DataTab{
    let id = UUID()
    let name: String
    let imageName: String
    
}
struct DataList{
    static let openData = [
        DataTab(name: "Main", imageName:"house.circle" ),
        DataTab(name: "Like", imageName: "heart.circle"),
        DataTab(name: "Messenger", imageName: "message.circle"),
        DataTab(name: "Profile", imageName:"person.crop.circle.fill" )
    ]
}
