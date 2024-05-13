import Cocoa
import Combine

var greeting = "Hello, playground"

let subject = PassthroughSubject<Int?, Never>()

//subject.sink { data in
//    print(data)
//}

subject
    .compactMap({$0})
    .sink { data in
    print(data)
}

subject.send(1)
subject.send(nil)
subject.send(2)
subject.send(3)
subject.send(4)
subject.send(5)

extension Notification.Name {
    static let newTrickDownloaded = Notification.Name("newTrickDownloaded")
    static let newTrickDownloadedFlatmap = Notification.Name("newTrickDownloadedFlatmap")
}
struct MagicTrick: Codable {
    let data: String
}
struct NoMagicTrick: Codable {
    let noTrick: String
}
let trickNamePublisher = NotificationCenter.default.publisher(for: .newTrickDownloaded)
    .map { notification in
        return notification.userInfo?["data"] as! Data
    }
    .decode(type: MagicTrick.self, decoder: JSONDecoder())
    .catch {_ in 
        return Just(MagicTrick(data: "recovery"))
    }
    .sink { trick in
        print(trick.data)
    }

NotificationCenter.default.post(name: .newTrickDownloaded, object: nil, userInfo: 
                                    ["data": try! JSONEncoder().encode(MagicTrick(data: "new trick"))])
NotificationCenter.default.post(name: .newTrickDownloaded, object: nil, userInfo:
                                    ["data": try! JSONEncoder().encode(NoMagicTrick(noTrick: " no magic"))])
// this will not work because we send wrong data catch will send just publisher so it work one so connection broken solve it using flat map below.
NotificationCenter.default.post(name: .newTrickDownloaded, object: nil, userInfo:
                                    ["data": try! JSONEncoder().encode(MagicTrick(data: "new trick-1"))])
// Flat map
let trickNamePublisherFlatmap = NotificationCenter.default.publisher(for: .newTrickDownloadedFlatmap)
    .map { notification in
        return notification.userInfo?["data"] as! Data
    }
    .flatMap{ data in
        return Just(data)
            .decode(type: MagicTrick.self, decoder: JSONDecoder())
            .catch {_ in
                return Just(MagicTrick(data: "recovery trick"))
            }
    }
    .sink { trick in
        print(trick.data)
    }

NotificationCenter.default.post(name: .newTrickDownloadedFlatmap, object: nil, userInfo:
                                    ["data": try! JSONEncoder().encode(MagicTrick(data: "new trick"))])
NotificationCenter.default.post(name: .newTrickDownloadedFlatmap, object: nil, userInfo:
                                    ["data": try! JSONEncoder().encode(NoMagicTrick(noTrick: "no magic"))])
NotificationCenter.default.post(name: .newTrickDownloadedFlatmap, object: nil, userInfo:
                                    ["data": try! JSONEncoder().encode(MagicTrick(data: "new trick-1"))])

let search = PassthroughSubject<String, Never>()
let cancel = search
    .debounce(for: .seconds(1), scheduler: RunLoop.main)
    .sink { s in
    print(s)
}
search.send("a")
search.send("am")
search.send("am1")
search.send("am12")
search.send("am123")
search.send("am1234")
DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
    search.send("am12345t")
})
