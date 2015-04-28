class Settings
  attr_accessor :urlHttp, :urlHttps, :urlBackend, :baby_steps, :vat
  
  def initialize
    @urlHttp = 'http://intcewga.emmos.de/'
    @urlHttps = 'https://intcewga.emmos.de/'
    @urlBackend = 'http://magentointce.emmos.de'
    @baby_steps = true
    @vat = 0.19
  end
end

class Article
  attr_accessor :sku, :amount, :name, :color, :size, :packagingUnit, :deliveryState, :pricePerPiece, :packContent
  
  def initialize
    @sku = '94770i1'
    @amount = 10
    @name = 'Loungetisch/Hocker Metropolitan'
    @color = 'vintage wei&szlig;'
    @size ='BxTxH=40x40x43 cm'
    @packagingUnit = 'Stk'
    @deliveryState = 'sofort lieferbar'
    @pricePerPiece = 54.99
    @packContent = 1
  end
end

class User
  attr_accessor :eMail, :password, :company, :firstname, :lastname, :prefix, :street, :postcode, :city, :telephone
  
  def initialize
    @eMail = "testmail@test.de"
    @password = "123456"
    @company = "Testfirma"
    @firstname = "Vorname"
    @lastname = "Nachname"
    @prefix = "Herr"
    @street = "Testweg"
    @postcode = "12345"
    @city = "Teststadt"
    @telephone = "01234567"
  end
end