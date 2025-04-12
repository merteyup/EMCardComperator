//
//  MockData.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 4.04.2025.
//


struct MockData {
    @MainActor static let creditCards: [CreditCard] = [
        CreditCard(
            number: "4321 5678 2109 6543",
            bank: Bank(
                name: "Akbank",
                size: .large,
                website: "https://www.akbank.com"
            ),
            yearlyUsageFee: 1025,
            isCheapest: false,
            isForStudent: false,
            campaignMessages: [
                "Yurt dışı harcamalarda %10 indirim fırsatı!",
                "Axess’e özel tatil kampanyaları seni bekliyor.",
                "Her 3 alışverişe 1 hediye kahve!"
            ]
        ),
        CreditCard(
            number: "1234 5678 9012 3456",
            bank: Bank(
                name: "Garanti Bankası",
                size: .large,
                website: "https://www.garantibbva.com.tr"
            ),
            yearlyUsageFee: 625,
            isCheapest: false,
            isForStudent: false,
            campaignMessages: [
                "Yıllık harcamalara göre %10 indirim!",
                "Bonus kullanıcılarına özel ekstra taksit fırsatı.",
                "Market alışverişlerinde %5 bonus kazan!"
            ]
        ),
        CreditCard(
            number: "4321 5678 9012 3456",
            bank: Bank(
                name: "Yapı Kredi Bankası",
                size: .large,
                website: "https://www.yapikredi.com.tr"
            ),
            yearlyUsageFee: 725,
            isCheapest: false,
            isForStudent: true,
            campaignMessages: [
                "Öğrencilere özel ilk yıl kart ücreti yok!",
                "İlk harcamaya 100 TL Worldpuan!",
                "Her ay sinema bileti kazanma şansı!"
            ]
        ),
        CreditCard(
            number: "4321 8765 9012 3456",
            bank: Bank(
                name: "Ziraat Bankası",
                size: .large,
                website: "https://www.ziraatbank.com.tr"
            ),
            yearlyUsageFee: 125,
            isCheapest: true,
            isForStudent: false,
            campaignMessages: []
        ),
        CreditCard(
            number: "4321 5678 2109 3456",
            bank: Bank(
                name: "QNB Finansbank",
                size: .large,
                website: "https://www.qnbfinansbank.com"
            ),
            yearlyUsageFee: 0,
            isCheapest: true,
            isForStudent: false,
            campaignMessages: [
                "Restoran harcamalarında %20 indirim!"
            ]
        ),
        CreditCard(
            number: "4321 8712 2109 6543",
            bank: Bank(
                name: "OdeaBank",
                size: .small,
                website: "https://www.odeabank.com.tr"
            ),
            yearlyUsageFee: 1225,
            isCheapest: false,
            isForStudent: false,
            campaignMessages: []
        ),
        CreditCard(
            number: "1298 8712 2109 6543",
            bank: Bank(
                name: "Fibabank",
                size: .medium,
                website: "https://www.fibabanka.com.tr"
            ),
            yearlyUsageFee: 425,
            isCheapest: false,
            isForStudent: true,
            campaignMessages: [
                "İlk 3 ay %0 faizli alışveriş imkanı.",
                "Faturalarda otomatik ödeme indirimi."
            ]
        )
    ]
    
    
    @MainActor static var defaultCard: CreditCard = CreditCard(
        number: "1298 8712 2109 6543",
        bank: Bank(
            name: "Fibabank",
            size: .medium,
            website: "https://www.fibabanka.com.tr"
        ),
        yearlyUsageFee: 425,
        isCheapest: true,
        isForStudent: true,
        campaignMessages: [
            "İlk 3 ay %0 faizli alışveriş imkanı.",
            "Faturalarda otomatik ödeme indirimi."
        ]
    )
}

