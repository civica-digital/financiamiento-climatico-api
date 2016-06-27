module Projects
  def self.year_options
    (Time.now.year.to_i + 15).downto(Time.now.year.to_i - 15).to_a
  end

  def self.area_options
    %w{ Area\ 1 Area\ 2 Area\ 3}
  end

  def self.currency_options
    %w{ USD EUR }
  end

  def self.financing_options
    %w{ Donativo Servicio }
  end

  def self.region_options
    %w{
      Aguascalientes
      Baja\ California
      Baja\ California\ Sur
      Campeche
      Coahuila
      Colima
      Chiapas
      Chihuahua
      Distrito\ Federal
      Durango
      Guanajuato
      Guerrero
      Hidalgo
      Jalisco
      México
      Michoacán
      Morelos
      Nayarit
      Nuevo\ León
      Oaxaca
      Puebla
      Querétaro
      Quintana\ Roo
      San\ Luis\ Potosí
      Sinaloa
      Tabasco
      Tamaulipas
      Tlaxcala
      Veracruz
      Yucatán
      Zacatecas
    }
  end

  def self.status_options
    %w{ Abierto Cerrado En\ implementación}
  end

  def self.new_with_defaults(project_store)
    project_store.new(year: default_year_option)
  end

  private

  def self.default_year_option
    Time.now.year.to_i
  end
end
