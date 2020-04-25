//
//  main.swift
//  KFC
//
//  Created by Kittinun Chobtham on 12/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

func registrationNewUsers() {
    let registrationNewUser = RegistrationController()
    
    registrationNewUser.registerWithName("ประยุทธทองดี",
                                         optionalSurname: "ฟันขาว",
                                         optionalAddress: "13/1",
                                         optionalTelephoneNumber: "028864321",
                                         optionalEmail: "prayut@gmail.com",
                                         optionalPassword: "1234")
    registrationNewUser.registerWithName("ประยุทธ",
                                         optionalSurname: "ชา",
                                         optionalAddress: "13/1",
                                         optionalTelephoneNumber: "028864321",
                                         optionalEmail: "prayut@gmail.com",
                                         optionalPassword: "1234")
    registrationNewUser.registerWithName("ทองดี",
                                         optionalSurname: "ฟันขาว",
                                         optionalAddress: "13/1",
                                         optionalTelephoneNumber: "028864321",
                                         optionalEmail: "prayut@gmail.com",
                                         optionalPassword: "1234")
    registrationNewUser.registerWithName("ดี",
                                         optionalSurname: "ฟันขาว",
                                         optionalAddress: "13/1",
                                         optionalTelephoneNumber: "028864321",
                                         optionalEmail: "prayut@gmail.com",
                                         optionalPassword: "1234")
    registrationNewUser.registerWithName("ทอง",
                                         optionalSurname: "ฟันขาว",
                                         optionalAddress: "13/1",
                                         optionalTelephoneNumber: "028864321",
                                         optionalEmail: "prayut@gmail.com",
                                         optionalPassword: "1234")
    
}

func login(email: String,
           password: String) {
    let loginController = LoginController()
    
    print("")
    loginController.loginWithEmail(email,
                                   password: password)
}

func getMenuItems() {
    let menuController = MenuController()
    
    menuController.getMenuItems()    
}

func getPromotionItem() {
    print("")
    let promotionController = PromotionController()
    
    promotionController.getPromotion()
    print("")
}

func userActionWhenLoginCompleted() {
    guard let user = currentUser else { return }
    
    addShoppingCart()
    print("")
    printMenuItemsInCartFromUser(user: user)
    print("")
    printTotalCostInCartFromUser(user: user)
    
    let shipping = Shipping(address: "131/23 หมบานเพอแมว เขต บางมด แขวง บางมด กทม. 10563",
                            cost: 25)
    user.shipping = shipping
    
    createCheckout(user: user)
    payMoney(money: 2100.0)
}

func payMoney(money: Float) {
    let const = currentUser?.checkout?.totalCost() ?? 0
    
    let getMoney = money - const
    
    print("Get Money: \(getMoney)")
    
    let currency = Int(getMoney.rounded(.toNearestOrAwayFromZero))

    
    print("***********************************")
    print("Input Currency: \(currency)")
    print("***********************************")
    
    let bank1000 = currency / 1_000
    print("Bank 1000 = \(bank1000)")
    var remain = currency % 1000
    let bank500 = remain / 500
    print("Bank 500 = \(bank500)")
    remain = remain % 500
    let bank100 = remain / 100
    print("Bank 100 = \(bank100)")
    remain = remain % 100
    let bank50 = remain / 50
    print("Bank 50 = \(bank50)")
    remain = remain % 50
    let bank20 = remain / 20
    print("Bank 20 = \(bank20)")
    remain = remain % 20
    let coin10 = remain / 10
    print("Coin 10 = \(coin10)")
    remain = remain % 10
    let coin5 = remain / 5
    print("Coin 5 = \(coin5)")
    remain = remain % 5
    let coin2 = remain / 2
    print("Coin 2 = \(coin2)")
    remain = remain % 2
    print("Coin 1 = \(remain)")
    print("***********************************")
    
}

func createCheckout(user: User) {
    let checkoutController: CheckoutController = CheckoutController()
    let promotions = totalPromotions(menuItems: user.shoppingCart.menuItems)
    checkoutController.addItemsToCheckout(items: user.shoppingCart.menuItems,
                                          shipping: user.shipping!,
                                          promotions: promotions)
}

func totalPromotions(menuItems: [MenuItem]) -> [Promotion]? {
    let quantityMenu1 = menuItems[MenuNumber.One.rawValue].quantity
    let quantityMenu2 = menuItems[MenuNumber.Two.rawValue].quantity
    let quantityMenu3 = menuItems[MenuNumber.Three.rawValue].quantity
    
    let minimumQuantity
        = min(quantityMenu1, quantityMenu2, quantityMenu3)
    
    if quantityMenu1 >= minimumQuantity
        && quantityMenu2 >= minimumQuantity
        && quantityMenu3 >= minimumQuantity {
        var totalPromotions: [Promotion] = []
        
        for _ in 0..<minimumQuantity {
            totalPromotions.append(currentPromotion!)
        }
        
        return totalPromotions
    }
    
    return nil
}

func addShoppingCart() {
    guard let menuItems = mockMenuItems else { return }
    
    let cartController: CartController = CartController()
    
    cartController.addMenuItemToShoppingCart(
        menuItem: MenuItem(name: menuItems[MenuNumber.One.rawValue].name,
                           price:  menuItems[MenuNumber.One.rawValue].price,
                           quantity: 3))
    cartController.addMenuItemToShoppingCart(
        menuItem: MenuItem(name: menuItems[MenuNumber.Two.rawValue].name,
                           price:  menuItems[MenuNumber.Two.rawValue].price,
                           quantity: 2))
    cartController.addMenuItemToShoppingCart(
        menuItem: MenuItem(name: menuItems[MenuNumber.Three.rawValue].name,
                           price:  menuItems[MenuNumber.Three.rawValue].price,
                           quantity: 2))
}

func printMenuItemsInCartFromUser(user: User) {
    user.shoppingCart.menuItems.forEach { (item) in
        print("name: \(item.name)           price: \(item.price)         quantity: \(item.quantity)")
    }
}

func printTotalCostInCartFromUser(user: User) {
    print("TotalCost is \(user.shoppingCart.totalConst())")
}

// ============================================== Main =================================================================================


getMenuItems()
getPromotionItem()
registrationNewUsers()

login(email: "prayut@gmail.com",
      password: "1234")

userActionWhenLoginCompleted()
