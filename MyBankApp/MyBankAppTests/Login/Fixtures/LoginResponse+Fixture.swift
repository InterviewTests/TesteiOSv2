@testable import MyBankApp

extension LoginResponse {
    static func fixture(
        userId: String = "1",
        email: String = "test@test.com",
        cpf: String = "123.456.789-10",
        name: String = "Test",
        accountNumber: String = "123456",
        agency: String = "123",
        balance: String = "R$ 1.000,00"
    ) -> LoginResponse {
        .init(
            userId: userId,
            email: email,
            cpf: cpf,
            name: name,
            accountNumber: accountNumber,
            agency: agency,
            balance: balance
        )
    }
}
