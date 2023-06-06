//struct ContentView: View {
//    @State private var items: [Item] = [] // Assuming Item is a model representing the database items
//
//    var body: some View {
//        List {
//            ForEach(items, id: \.id) { item in
//                Text(item.name)
//            }
//            .onDelete(perform: deleteItem)
//        }
//        .onAppear {
//            fetchItems() // Fetch items from the database when the view appears
//        }
//    }
//
//    func deleteItem(at offsets: IndexSet) {
//        for offset in offsets {
//            let item = items[offset]
//            // Perform delete operation on the database for the selected item
//            deleteItemFromDatabase(item)
//            // Remove the item from the local array
//            items.remove(at: offset)
//        }
//    }
//
//    func fetchItems() {
//        // Fetch items from the database and populate the local array
//        items = fetchItemsFromDatabase()
//    }
//
//    func deleteItemFromDatabase(_ item: Item) {
//        // Perform the delete operation on the database using the given item
//        // You'll need to replace this with your actual database deletion code
//        // This is just a placeholder to demonstrate the concept
//        // db.delete(item) or any other method specific to your database implementation
//        print("Deleted item: \(item)")
//    }
//
//    func fetchItemsFromDatabase() -> [Item] {
//        // Fetch items from the database
//        // You'll need to replace this with your actual database fetching code
//        // This is just a placeholder to demonstrate the concept
//        let item1 = Item(id: 1, name: "Item 1")
//        let item2 = Item(id: 2, name: "Item 2")
//        let item3 = Item(id: 3, name: "Item 3")
//        return [item1, item2, item3]
//    }
//}
//
//struct Item: Identifiable {
//    let id: Int
//    let name: String
//}
//
