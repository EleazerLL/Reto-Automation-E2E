Feature: Pruebas de web E2E flujo de venta completo

Background:
    * configure driver = { type: 'chrome', addOptions: ["--start-maximized"] }
    Given driver 'https://www.saucedemo.com/'
    And input('#user-name', 'standard_user')
    And input('#password', 'secret_sauce')
    When click('#login-button')
    And waitFor('.title')

Scenario: Comprar el producto más caro y validar el flujo del carrito
    Then match driver.url contains 'inventory.html'
    * def priceElements = locateAll('.inventory_item_price')
    * def prices = karate.map(priceElements, function(x){ return x.text.replace('$', '') * 1 })
    * def expensiveItems = prices.filter(x => x >= 49)
    And assert expensiveItems.length > 0
    * def precioAComprar = expensiveItems[0]
    * def btnComprar = "//div[text()='" + precioAComprar + "']/ancestor::div[@class='inventory_item_description']//button"
    And scroll(btnComprar)
    When click(btnComprar)
    * screenshot()
    And click('.shopping_cart_link')
    Then match text('.title') == 'Your Cart'
    And match driver.url contains 'cart.html'
    And click("//button[contains(text(),'Remove')]")
    And click('#continue-shopping')
    Then match text('.title') == 'Products'
    * screenshot()