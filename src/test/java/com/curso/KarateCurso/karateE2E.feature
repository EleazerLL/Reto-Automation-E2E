@e2e
Feature: Flujo de compra completo en SauceDemo

  Background:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * def loginData = read('datos_login.json')

  Scenario Outline: Comprar un <producto> exitosamente
    # 1. Login
    Given driver 'https://www.saucedemo.com/'
    And input('#user-name', loginData.user)
    And input('#password', loginData.password)
    And click('#login-button')
    
    # 2. Selección de Producto y Carrito
    # Buscamos el producto por texto y hacemos clic en su botón de "Add to cart"
    * def xpathBtn = "//div[text()='<producto>']/ancestor::div[@class='inventory_item']//button"
    And waitFor(xpathBtn)
    And click(xpathBtn)
    
    # 3. Ir al Carrito y Checkout
    And click('.shopping_cart_link')
    *  screenshot()
    And click('#checkout')
    
    # 4. Información de Envío (Checkout Step One)
    And input('#first-name', 'Job')
    And input('#last-name', 'Tester')
    And input('#postal-code', '4820000')
    And click('#continue')
    
    # 5. Finalizar (Checkout Step Two)
    And click('#finish')
    
    # 6. Validación de éxito
    Then waitFor('.complete-header')
    And match text('.complete-header') == 'Thank you for your order!'

    Examples:
      | producto                         |
      | Sauce Labs Backpack              |
      | Sauce Labs Bolt T-Shirt          |
      | Sauce Labs Onesie                |