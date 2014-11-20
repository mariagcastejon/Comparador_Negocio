class AddAtributesToCountries < ActiveRecord::Migration
  def change
  	add_column :countries, :impuesto_apertura, :integer
  	add_column :countries, :impuesto_sociedades, :integer
  	add_column :countries, :idh, :string
  	add_column :countries, :precio_medio_plato, :integer
  end
end
