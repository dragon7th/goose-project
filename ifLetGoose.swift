class Author {
    var name: String?
}

class Book {
    var title: String
    var author: Author?

    init(title: String, author: Author? = nil) {
        self.title = title
        self.author = author
    }
}

func printAuthorName(book: Book) {
    // Using if let and optional chaining
    if let author = book.author, let name = author.name {
        print("The author of '\(book.title)' is \(name).")
    } else {
        print("The author of '\(book.title)' is unknown.")
    }
}

func printAuthorNameWithGuard(book: Book) {
    // Using guard let and optional chaining
    guard let author = book.author, let name = author.name else {
        print("The author of '\(book.title)' is unknown.")
        return
    }

    print("The author of '\(book.title)' is \(name).")
}


let author1 = Author()
author1.name = "Jane Austen"
let book1 = Book(title: "Pride and Prejudice", author: author1)

let book2 = Book(title: "Unknown")
let author2 = Author()
let book3 = Book(title: "Unknown", author: author2)

printAuthorName(book: book1)        // Output: The author of 'Pride and Prejudice' is Jane Austen.
printAuthorName(book: book2)        // Output: The author of 'Unknown' is unknown.
printAuthorName(book: book3) // Output: The author of 'Unknown' is unknown.

printAuthorNameWithGuard(book: book1) // Output: The author of 'Pride and Prejudice' is Jane Austen.
printAuthorNameWithGuard(book: book2) // Output: The author of 'Unknown' is unknown.
printAuthorNameWithGuard(book: book3) // Output: The author of 'Unknown' is unknown.

func processInput(userInput: String?) {
    // Using if let
    if let input = userInput, let number = Int(input) {
        let doubled = number * 2
        print("The doubled value is: \(doubled)")
    } else {
        print("Invalid input. Please enter a valid number.")
    }
}

processInput(userInput: "10")      // Output: The doubled value is: 20
processInput(userInput: "abc")     // Output: Invalid input. Please enter a valid number.
processInput(userInput: nil)       // Output: Invalid input. Please enter a valid number.

/*
Imagine you're building an app that takes user input from a text field, 
attempts to convert it to an integer, and then performs a calculation.
*/
func processInputWithGuard(userInput: String?) {
    // Using guard let
    guard let input = userInput, let number = Int(input) else {
        print("Invalid input. Please enter a valid number.")
        return
    }

    let doubled = number * 2
    print("The doubled value is: \(doubled)")
}

processInputWithGuard(userInput: "10")      // Output: The doubled value is: 20
processInputWithGuard(userInput: "abc")     // Output: Invalid input. Please enter a valid number.
processInputWithGuard(userInput: nil)       // Output: Invalid input. Please enter a valid number.


//Let's say you have an array of optional integers and you want to calculate their sum, 
//ignoring any nil values.

func sumOfOptionalNumbers(numbers: [Int?]) -> Int {
    var sum = 0
    for number in numbers {
        if let num = number {
            sum += num
        }
    }
    return sum
}

let optionalNumbers: [Int?] = [1, 2, nil, 4, nil, 6]
let total = sumOfOptionalNumbers(numbers: optionalNumbers)
print("Sum of optional numbers: \(total)") 
// Output: Sum of optional numbers: 13

func sumOfOptionalNumbersWithGuard(numbers: [Int?]) -> Int {
    var sum = 0
    for number in numbers {
        guard let num = number else {
            continue // Skip nil values
        }
        sum += num
    }
    return sum
}

let optionalNumbers2: [Int?] = [1, 2, nil, 4, nil, 6]
let total2 = sumOfOptionalNumbersWithGuard(numbers: optionalNumbers2)
print("Sum of optional numbers with guard: \(total2)") 
// Output: Sum of optional numbers with guard: 13


//Imagine you have a function to validate user data, 
//requiring both a username and an email address.

func validateUserData(username: String?, email: String?) -> Bool {
    guard let username = username, !username.isEmpty,
          let email = email, !email.isEmpty, email.contains("@") else {
        print("Invalid username or email.")
        return false
    }

    print("User data is valid.")
    return true
}

validateUserData(username: "testuser", email: "test@example.com") 
// Output: User data is valid.
validateUserData(username: nil, email: "test@example.com")      
// Output: Invalid username or email.
validateUserData(username: "testuser", email: "invalid-email")    
// Output: Invalid username or email.