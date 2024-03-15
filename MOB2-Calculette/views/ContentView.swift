import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = CalculatorViewModel()
    
    let buttons: [[CalculatorButton]] = [
        [.clear, .negative, .modulo, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Text(viewModel.value)
                        .bold()
                        .font(.custom("AtkinsonHyperlegible-Bold", size: viewModel.value.count > 8 ? 40 : 80))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    
                }
                .padding()
                
                // Buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                viewModel.touch(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .frame(
                                        width: viewModel.buttonWidth(item: item),
                                        height: viewModel.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .cornerRadius(viewModel.buttonWidth(item: item) / 2)
                                    .foregroundColor(item.textColor)
                                    .font(.custom("AtkinsonHyperlegible-Regular", size: 32))

                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Erreur"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
