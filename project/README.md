# SantanderSample in Swift!

this is a demo application where you can:
- insert an email/cpf and a password to login
- after login has completed you will see some account informations
- you can logout too.

in the first screen it will show the last valid user, if it exists.

obs.
- cpf must have 11 numbers 
- password must have 1 Uppercase, 1 alphanumeric and 1 especial character


Although simple, it is being used:
- Clean Swift architecture
- API Restful
- Unit tests
- Keychain for secure information persistence

CocoaPods:
- Swinject, a simple way to inject dependencies avoiding coupling
- Quick / Nimble, it's more simple and readable.
- IQKeyboardManager, 
- SwiftKeychainWrapper, for persistance of safe data
