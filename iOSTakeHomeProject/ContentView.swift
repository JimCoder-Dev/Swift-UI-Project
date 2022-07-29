import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear{
                print("USERS RESPONSE 🖥")
                dump(
                    try? StaticJSONMapper.decode(file: "UserStaticData", type: UsersResponse.self)
                )
                print("SINGLE USER ⌨️")
                dump(
                    try? StaticJSONMapper.decode(file: "SingleUserData", type: UserDetailResponse.self)
                )
                
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
