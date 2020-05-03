# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create(description: "admin")
User.create(email: "admin@email.com.mx", name: "admin", lastname: "admin", password: "12345678", phone: "1234567890", role_id: 1)
Accessory.create(name:"Accesorio Uno", description: "Esto es una descripción")
Currency.create(name:"México", description: "Esto es una descripción", abbreviation: "MX")
Currency.create(name:"EEUU", description: "Esto es una descripción", abbreviation: "USD")
Unit.create(name:"Pieza", description: "Esto es una descripción", abbreviation: "PZ")
ProductLine.create(name:"Línea Uno", description: "Esto es una descripción")
Provider.create(name:"Proveedor Uno", rfc:"XAXX010101000", business_name: "Proveedor S.A de C.V")
ProviderAddress.create(street:"32", number:"100", crossing:"32 y 34", colony:"Fracc. Américas", town:"Mérida", state:"Yucatán", country:"México", provider_id: 1)
ProviderBank.create(beneficiary: "Dexter", account: "1234", clabe: "1234", bank_name: "BBVA", currency:"MXN", provider_id: 1)
ProviderContact.create(name: "Dexter", department:"Sistemas", phone:"9999999999", extension: "8", cellphone: "9999999999", email:"email@email.com", provider_id: 1)
Customer.create(name:"Cliente Uno", rfc:"XAXX010101000", business_name: "Proveedor S.A de C.V")
CustomerAddress.create(street:"32", number:"100", crossing:"32 y 34", colony:"Fracc. Américas", town:"Mérida", state:"Yucatán", country:"México", customer_id: 1)
CustomerBank.create(beneficiary: "Dexter", account: "1234", clabe: "1234", bank_name: "BBVA", currency:"MXN", customer_id: 1)
CustomerContact.create(name: "Dexter", department:"Sistemas", phone:"9999999999", extension: "8", cellphone: "9999999999", email:"email@email.com", customer_id: 1)