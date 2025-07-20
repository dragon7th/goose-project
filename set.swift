// Set is an unordered collection of unique values of the same type
// Ensure Uniqueness
// Check for Membership
// Perform Set Operations

// Tracking Unique User IDs or Session IDs
var uniqueUserIDs: Set<String> = []

func trackUser(userID: String) {
    if !uniqueUserIDs.contains(userID) {
        uniqueUserIDs.insert(userID)
        // Perform other tracking logic (e.g., log to database)
        print("New unique user: \(userID)")
    } else {
        print("User already tracked: \(userID)")
    }
}

trackUser(userID: "user123") // New unique user: user123
trackUser(userID: "user456") // New unique user: user456
trackUser(userID: "user123") // User already tracked: user123

print("Total unique users: \(uniqueUserIDs.count)") // Total unique users: 2

//Filtering Duplicate Data from API Responses
struct Product {
    let id: Int
    let name: String
}

// Assume you have a function that fetches an array of Product from an API
func fetchProducts() -> [Product] {
    // ... (API call logic) ...
    return [
        Product(id: 1, name: "Shirt"),
        Product(id: 2, name: "Pants"),
        Product(id: 1, name: "Shirt"), // Duplicate
        Product(id: 3, name: "Shoes")
    ]
}

// Make Product Hashable (as shown in previous example)
extension Product: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
}

let products = fetchProducts()
let uniqueProducts = Set(products) // Convert array to a set, automatically removing duplicates

print("Unique Products:")
for product in uniqueProducts {
    print("ID: \(product.id), Name: \(product.name)")
}
// Output:
// Unique Products:
// ID: 2, Name: Pants
// ID: 3, Name: Shoes
// ID: 1, Name: Shirt

//  Implementing Feature Flags or Permissions
enum FeatureFlag: String {
    case premiumAccess = "premium_access"
    case advancedAnalytics = "advanced_analytics"
    case customThemes = "custom_themes"
}

class User {
    let userID: String
    var enabledFeatures: Set<FeatureFlag>

    init(userID: String, enabledFeatures: Set<FeatureFlag>) {
        self.userID = userID
        self.enabledFeatures = enabledFeatures
    }

    func hasFeature(feature: FeatureFlag) -> Bool {
        return enabledFeatures.contains(feature)
    }
}

let user1 = User(userID: "user789", enabledFeatures: [.premiumAccess, .advancedAnalytics])

if user1.hasFeature(feature: .premiumAccess) {
    print("User has premium access") // User has premium access
}

if user1.hasFeature(feature: .customThemes) {
    print("User has custom themes") // This won't be printed
}

// Checking for Valid Input Values
let validCountryCodes: Set<String> = ["US", "CA", "GB", "DE", "FR"]

func isValidCountryCode(code: String) -> Bool {
    return validCountryCodes.contains(code)
}

print(isValidCountryCode(code: "US")) // true
print(isValidCountryCode(code: "JP")) // false

//  Managing Game Inventory (Unique Items)
struct Item {
    let id: Int
    let name: String
}

extension Item: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
    }
}

class Player {
    var inventory: Set<Item> = []

    func addItem(item: Item) {
        inventory.insert(item)
    }

    func hasItem(item: Item) -> Bool {
        return inventory.contains(item)
    }
}

let player = Player()
let sword = Item(id: 101, name: "Excalibur")
let potion = Item(id: 202, name: "Healing Potion")

player.addItem(item: sword)
player.addItem(item: sword) // Doesn't add duplicate

print("Inventory count: \(player.inventory.count)") // Inventory count: 1

if player.hasItem(item: sword) {
    print("Player has Excalibur") // Player has Excalibur
}