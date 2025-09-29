//
//  ContentView.swift
//  MyApp
//
//  Created by Muhammad Muzamal on 24/09/2025.
//

import SwiftUI
import Domain
import DataLayer
import Combine

struct ContentView: View {
    @StateObject var viewModel = ContentViewModelFactory.make()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Title: \(viewModel.title)")
            Button("Press Me") {
                viewModel.userPressButton()
            }
                .buttonStyle(.bordered)
        }
    }
}

#Preview {
    ContentView()
}

final class ContentViewModelFactory {
    static func make() -> ViewModel {
        let repository = LocalRepository()
        let useCase = DefaultUseCase(repository: repository)
        let viewModel = ViewModel(useCase: useCase)
        let presenter = Presenter(viewModel: viewModel)

        useCase.presenter = presenter
        
        return viewModel
    }
}


protocol ViewOutput: ObservableObject {
    var title: String { get }
    func userPressButton()
}

final class ViewModel: ViewOutput, PresenterOutput {
    @Published var title: String = ""
    var useCase: UseCaseInput
    init(useCase: UseCaseInput) {
        self.useCase = useCase
    }
    
    func displayText(_ value: String) {
        self.title = value
        print("ViewModel: \(title)")
    }
    
    func userPressButton() {
        useCase.execute("User press Button")
    }
}

// MARK: Presenter

protocol PresenterOutput: AnyObject {
    func displayText(_ value: String)
}

final class Presenter: UseCaseOutPut {
    weak var viewModel: PresenterOutput?
    
    init(viewModel: PresenterOutput) {
        self.viewModel = viewModel
    }
    
    func greetingComplete(_ value: String) {
        self.viewModel?.displayText(value)
    }
}
