import SwiftUI

struct CreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var vm = CreateViewModel()
    
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
            .onChange(of: vm.state){ formState in
                if formState == .successful{
                    dismiss()
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
        TextField("First name", text: $vm.person.firstName)
    }
    
    var lastname: some View{
        TextField("Last name", text: $vm.person.lastName)
    }
    
    var job: some View{
        TextField("Job", text: $vm.person.job)
    }
    
    var submit: some View{
        Button("Submit") {
            vm.create()
        }
    }
    
    var done: some View{
        Button("Done"){
            vm.create()
        }
    }
}
