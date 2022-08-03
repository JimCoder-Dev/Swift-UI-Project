import SwiftUI

struct DetailView: View {
    
    @State private var userInfo: UserDetailResponse?
    
    var body: some View {
        ZStack {
            background
            
            ScrollView{
                VStack(alignment: .leading, spacing: 18){
                    
                    
                   avatar
                    
                    Group{
                        general
                        link
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 18)
                    .background(Theme.detailBackground, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                    
                    
                    
                    
                }
                .padding()
            }
        }
        .navigationTitle("Details")
        .onAppear{
            do{
                userInfo = try StaticJSONMapper.decode(file: "SingleUserData", type: UserDetailResponse.self)
            }catch{
                //TODO: Handle any errors
                print(error)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView()
        }
    }
}

private extension DetailView{
    var background: some View{
        Theme.background
            .ignoresSafeArea(edges: .top)
    }
}


private extension DetailView{
    
    var general: some View{
        VStack(alignment: .leading, spacing: 8){
            PillView(id: userInfo?.data.id ?? 0)
            Group{
                firstname
                lastname
                email
            }
            .foregroundColor(Theme.text)
            
            
        }
        
    }
    
    @ViewBuilder
    var avatar: some View{
        if let avatarAbsoluteString = userInfo?.data.avatar,
           let avatarUrl = URL(string: avatarAbsoluteString){
            
            AsyncImage(url: avatarUrl){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
            }placeholder: {
                ProgressView()
            }
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
    }
    
    @ViewBuilder
    var link: some View{
        
        
        if let supportAbsoluteString = userInfo?.support.url,
           let supportUrl = URL(string: supportAbsoluteString),
           let supportText = userInfo?.support.text{
            Link(destination: supportUrl) {
                VStack(alignment: .leading, spacing: 8){
                    Text(supportText)
                        .foregroundColor(Theme.text)
                        .font(
                            .system(.body, design: .rounded)
                            .weight(.semibold)
                        )
                        .multilineTextAlignment(.leading)
                    Text(supportAbsoluteString)
                }
                Spacer()
                    Symbols.link
                    .font(.system(.title3, design: .rounded))
            }
        }
        
       
    }
    
    
    @ViewBuilder
    var firstname: some View{
        
            
            Text("First Name")
                .font(
                    .system(.body, design: .rounded)
                    .weight(.semibold)
                )
        Text(userInfo?.data.firstName ?? "-")
                .font(.system(.subheadline, design: .rounded))
            Divider()
       
    }
    
    @ViewBuilder
    var lastname: some View{
        Text("Last Name")
            .font(
                .system(.body, design: .rounded)
                .weight(.semibold)
            )
        Text(userInfo?.data.lastName ?? "-")
            .font(.system(.subheadline, design: .rounded))
        Divider()
    }
    
    @ViewBuilder
    var email: some View{
        Text("Email")
            .font(
                .system(.body, design: .rounded)
                .weight(.semibold)
            )
        Text(userInfo?.data.email ?? "-")
            .font(.system(.subheadline, design: .rounded))
    }
}