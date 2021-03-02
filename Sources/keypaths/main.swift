import Benchmark

extension Sequence {
	func sorted<T: Comparable>(
		by path: KeyPath<Element, T>
	) -> [Element] {
		self.sorted { lhs, rhs in lhs[keyPath: path] < rhs[keyPath: path] }
	}
	
	func sorted<T: Comparable>(
		by path: KeyPath<Element, T?>,
		defaultValue: @autoclosure () -> T
	) -> [Element] {
		self.sorted { lhs, rhs in (lhs[keyPath: path] ?? defaultValue()) < (rhs[keyPath: path] ?? defaultValue()) }
	}
	
	func sortedBy<T: Comparable>(
		_ closure: (Element) -> T
	) -> [Element] {
		self.sorted { lhs, rhs in closure(lhs) < closure(rhs) }
	}
}

struct Person {
	let age: Int
	let name: String
}

let people: [Person] = (1 ... 1_000)
	.map { _ in
		Person(
			age: Int.random(in: 1_000 ... 1_000_000),
			name: ["abc", "def", "ghi", "ABC", "DEF", "GHI"].randomElement()!
		)
	}

benchmark("key path sorted :: name") {
	let sorted = people.sorted(by: \.name)
	assert(sorted.last?.name == "ghi")
}

benchmark("key path sorted :: age") {
	let sorted = people.sorted(by: \.age)
	assert(sorted.last!.age > sorted.first!.age)
}

benchmark("key path expressions sorted :: name") {
	let sorted = people.sortedBy(\.name)
	assert(sorted.last?.name == "ghi")
}

benchmark("key path expressions sorted :: age") {
	let sorted = people.sortedBy(\.age)
	assert(sorted.last!.age > sorted.first!.age)
}

benchmark("functions sorted :: name") {
	let sorted = people.sortedBy { $0.name }
	assert(sorted.last?.name == "ghi")
}

benchmark("functions sorted :: age") {
	let sorted = people.sortedBy { $0.age }
	assert(sorted.last!.age > sorted.first!.age)
}

Benchmark.main()
