import SwiftUI

struct CreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form{
                firstname
                lastname
                job
               
                Section{
                   submit
                }
            }
            .navigationTitle("Create")
            .toolbar{
                ToolbarItem(placement: .primaryAction){
                    done
                }
            }
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}


private extension CreateView{
    var firstname: some View{
        TextField("First name", text: .constant(""))
    }
    
    var lastname: some View{
        TextField("Last name", text: .constant(""))
    }
    
    var job: some View{
        TextField("Job", text: .constant(""))
    }
    
    var submit: some View{
        Button("Submit") {
            print("Hello World")
        }
    }
    
    var done: some View{
        Button("Done"){
            dismiss()
        }
    }
}
