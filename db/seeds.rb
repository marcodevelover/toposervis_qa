# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create(name:"admin" description: "Administrador")
Role.create(name:"customer" description: "Cliente")
User.create(email: "admin@email.com", name: "admin", lastname: "admin", password: "12345678", phone: "1234567890", role_id: 1)
Accessory.create(name:"Accesorio Uno", description: "Esto es una descripción")
Currency.create(name:"México", description: "Esto es una descripción", abbreviation: "MX", exchange_rate: 1.0)
Currency.create(name:"EEUU", description: "Esto es una descripción", abbreviation: "USD", exchange_rate: 25.0)
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
CategoryType.create(name:"Tipo de categoria Uno", description: "Esto es una descripción")
Category.create(name:"Categoria Uno", description: "Esto es una descripción", category_type_id: 1)
Subcategory.create(name:"Subcategoria Uno", description: "Esto es una descripción", category_id: 1)
Condition.create(name:"Terminos", description: "El texto incluido aquí es un término de acuerdo al catálogo de términos y condiciones que se tenga por producto o servicio, sin embargo, el usuario podrá modificarlo.", default: 1)
Tax.create(name:"IVA", description: "Impuesto al Valor Agregado", amount: 0.16, value:0.16, default: 1)
TypeServiceOrder.create(name:"Mantenimiento", description: "Servicio de mantenimiento")
TypeServiceOrder.create(name:"Reparación", description: "Servicio de reparación")
TypeServiceOrder.create(name:"Otro", description: "Otros servicios")
DiagnosisType.create(name:"Reparación general", description: "Esto es una descripción")
DiagnosisType.create(name:"Mantenimiento general", description: "Esto es una descripción")
DiagnosisType.create(name:"Limpieza y mantenimiento", description: "Esto es una descripción")
DiagnosisType.create(name:"Reparación", description: "Esto es una descripción")
DiagnosisType.create(name:"Garantia de servicios", description: "Esto es una descripción")
DiagnosisType.create(name:"Garantia de piezas", description: "Esto es una descripción")
PaymentMethod.create(name:"Efectivo", description: "Esto es una descripción")
PaymentMethod.create(name:"Cheque nominativo", description: "Esto es una descripción")
PaymentMethod.create(name:"Transferencia electrónica de fondos", description: "Esto es una descripción")
PaymentMethod.create(name:"Tarjeta de crédito", description: "Esto es una descripción")
PaymentMethod.create(name:"Tarjeta de débito", description: "Esto es una descripción")
PaymentMethod.create(name:"Por definir", description: "Esto es una descripción")
PaymentWay.create(name:"Pago en una sola exhibición", description: "Esto es una descripción")
PaymentWay.create(name:"Pago en parcialidades o diferido", description: "Esto es una descripción")

