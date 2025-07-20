let marineFord = ["Garp", "Kuzan", "Lava man", "Kizaru" ]
for boss in marineFord {
    print("The greatest one is \(boss)")
}
// for each method
marineFord.forEach {
    boss in 
    print("The greatest one is \(boss)")
}

// adding index to the loop
for (index, boss) in marineFord.enumerated() {
    print("The greatest one at index \(index) is \(boss)")
}

// using for each
marineFord.enumerated().forEach {
    (index, boss) in 
    print("The greatest one at index \(index) is \(boss)")
}

// filtering the array
marineFord.filter {
    boss in 
    boss.contains("K")
}.forEach {
    boss in
    print("The greatest one is \(boss)")
}

// mapping the array
let marineFord = ["Garp", "Kuzan", "Lava man", "Kizaru" ]
marineFord.map {
    boss in
    boss.uppercased()
}.forEach {
    boss in
    print("The greatest one is \(boss)")
}

// combining filtering and mapping
marineFord.filter {
boss in
    boss.contains("K")
}.map {
    boss in
    boss.uppercased()
}.forEach {
    boss in
    print("The greatest one is \(boss)")
}

// using where clause
for boss in marineFord where boss.contains("K") {
    print("The greatest one is \(boss)")
}

// adding custom function
let marineFord = ["Garp", "Kuzan", "Lava man", "Kizaru" ]

func describeBoss(boss: String) {
    print("Behold! \(boss) of marineford!")
}

marineFord.forEach {
    boss in
    describeBoss(boss: boss)
}

// using reduce to create string
let allBosses = marineFord.reduce("") {
    (result, boss) in
    result + boss + ","
}
print("Marineford's finest: \(allBosses)")
// result : Marineford's finest: Garp,Kuzan,Lava man,Kizaru,

// WHILE LOOP ------

let marineFord = ["Garp", "Kuzan", "Lava man", "Kizaru"]
var index = 0
var filteredMarineFord: [String] = []
var uppercasedMarineFord: [String] = []
var filteredAndUppercased: [String] = []

while index < marineFord.count {
    let boss = marineFord[index]
    print("The greatest one is \(boss)")
    index += 1
}

// filtering with the while loop
// manual filtering
while index < marineFord.count {
    let boss = marineFord[index]
    if boss.contains("K") {
        filteredMarineFord.append(boss)
    }
    index += 1
}

// mapping with while loop
while index < marineFord.count {
    let boss = marineFord[index]
    uppercasedMarineFord.append(boss.uppercased())
    index += 1
}

// using remove first to iterate
var marineFord = ["Garp", "Kuzan", "Lava man", "Kizaru"]

while !marineFord.isEmpty {
    let boss = marineFord.removeFirst()
    print("The greatest one is \(boss)")
}

var marineFord = ["Garp", "Kuzan", "Lava man", "Kizaru"]
var index = 0

while index < marineFord.count && marineFord[index] != "Lava man" {
    let boss = marineFord[index]
    print("Processing \(boss)")
    index += 1
}

if index < marineFord.count {
    print("Found Lava man at index \(index)")
} else {
    print("Lava man not found")
}

// processing until array is empty
var marineFord = ["Garp", "Kuzan", "Lava man", "Kizaru"]

while !marineFord.isEmpty {
  let boss = marineFord.removeFirst()
  print("Processing \(boss)")
}

print("Marineford is now empty")

