array[startIndex..<endIndex]   // Half-open range operator
array[startIndex...endIndex]   // Closed range operator (less common for slicing)

let numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

// Example 1: Basic slicing
let slice1 = numbers[2..<5] // slice1 will be [2, 3, 4] (ArraySlice<Int>)
print(slice1)

// Example 2: Slicing from the beginning
let slice2 = numbers[..<3]  // slice2 will be [0, 1, 2] (ArraySlice<Int>)
print(slice2)

// Example 3: Slicing to the end
let slice3 = numbers[5...]  // slice3 will be [5, 6, 7, 8, 9] (ArraySlice<Int>)
print(slice3)

// Example 4: Creating a new Array from a slice
let slice4 = numbers[3..<7] // slice4 will be [3, 4, 5, 6] (ArraySlice<Int>)
let newArray = Array(slice4)  // newArray will be [3, 4, 5, 6] (Array<Int>)
print(newArray)

// Example 5: Modifying the original array (Copy-on-Write behavior)
var originalArray = [10, 20, 30, 40, 50]
var slice5 = originalArray[1..<4] // slice5 is [20, 30, 40]

print("Original array before modification: \(originalArray)") // [10, 20, 30, 40, 50]
print("Slice before modification: \(slice5)") // [20, 30, 40]

originalArray[2] = 333 // Modify the original array

print("Original array after modification: \(originalArray)") // [10, 20, 333, 40, 50]
print("Slice after modification: \(slice5)") // [20, 30, 40]   (slice is NOT changed because CoW)

slice5[1] = 333 //Modify the Slice

print("Original array after slice modification: \(originalArray)") // [10, 20, 333, 40, 50]
print("Slice after slice modification: \(slice5)") //  [20, 333, 40] (Original is NOT changed because CoW)