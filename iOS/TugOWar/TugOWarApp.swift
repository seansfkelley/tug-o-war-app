import SwiftUI

@main
struct TugOWarApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    if let vendorId = UIDevice.current.identifierForVendor?.uuidString {
                        let url = URL(string: "http://127.0.0.1:8000/register/\(vendorId)")
                        var request = URLRequest(url: url!)
                        request.httpMethod = "POST"
                        
                        print(vendorId)
                        
                        do {
                            let (data, _) = try await URLSession.shared.data(for: request)
                        } catch {
                            print("registration failed: \(error.localizedDescription)")
                        }
                    }
                }
        }
    }
}
