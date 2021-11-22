namespace :relation_bill do
  
  desc "Creates relation bill SAT"
  relation_bills = [
    {name: "Nota de crédito de los documentos relacionados", description: "", relation_key: "01"},
    {name: "Nota de débito de los documentos relacionados", description: "", relation_key: "02"},
    {name: "Devolución de mercancía sobre facturas o traslados previos", description: "", relation_key: "03"},
    {name: "Sustitución de los CFDI previos", description: "", relation_key: "04"},
    {name: "Traslados de mercancias facturados previamente", description: "", relation_key: "05"},
    {name: "Factura generada por los traslados previos", description: "", relation_key: "06"},
    {name: "CFDI por aplicación de anticipo", description: "", relation_key: "07"},
    {name: "Factura generada por pagos en parcialidades", description: "", relation_key: "08"},
    {name: "Factura generada por pagos diferidos", description: "", relation_key: "09"}
  ]
  task insert_data: :environment do
    relation_bills.each do |relation_bill|
      RelationBill.create(relation_bill)
    end
  end

end
