module MyWorld
  def article
  	@article ||= Article.new
  end
  def user
    @user ||= User.new
  end
  def magento
    @magento ||=MagentoAPI.new('http://magentointce.emmos.de',ENV['MAGENTO_USERNAME'],ENV['MAGENTO_PASSWORD'])
  end
  def vat
    @vat = 0.19
  end
  def out(msg)
  	baby_steps = true
  	if baby_steps then puts msg end
  end
  def urlHttp
    @urlHttp = 'http://intcewga.emmos.de/'
  end
  def urlHttps
    @urlHttps = 'https://intcewga.emmos.de/'
  end
end

World(MyWorld)




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