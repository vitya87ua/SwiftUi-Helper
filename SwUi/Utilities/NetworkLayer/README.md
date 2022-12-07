#  NetworkLayer

This **NetworkLayer** it is only example!

* If you want to add token to *HTTPHeaderField* uncomment line 122-124 in *RequestManager -> createURLRequest(with model: RequestModel)* and add token from your token storage.

We recommend usage this NetworkLayer with @Injected pattern.


### Usage instruction: ###

class SomeClass {

    @Injected(\.network) private var network: NetworkLayer
    
    func signIn() {
        let credential: Credential = Credential(email: viktor@gmail.com, password: 123456)
        
        network.authentication.signIn(credential: credential) { [weak self] result in
            switch result {
            case .success(let response):
                // TO DO
            case .failure(let error):
                // TO DO
            }
        }
    }
}
