module MyWorld
  def article
  	@article ||= Article.new
  end
  def user
    @user ||= User.new
  end
  def magento
    @magento ||=MagentoAPI.new($backendurl,ENV['MAGENTO_USERNAME'],ENV['MAGENTO_PASSWORD'])
  end
  def vat
    @vat = 0.19
  end
  def out(msg)
  	baby_steps = true
  	if baby_steps == true 
  		puts msg
  	end
  end
  def urlHttp
    @urlHttp = $shopurl
  end
  def urlHttps
    @urlHttps = $secure_shopurl
  end
end

World(MyWorld)

class Article
  def sku
  	@sku = '94770i1'
  end
  def amount
  	@amount = 10
  end
  def name
    @name = 'Loungetisch/Hocker Metropolitan'
  end
  def color
    @color = 'vintage wei&szlig;'
  end
  def size
    @size ='BxTxH=40x40x43 cm'
  end
  def packagingUnit
    @packagingUnit = 'Stk'
  end
  def deliveryState
    @deliveryState = 'sofort lieferbar'
  end
  def pricePerPiece
    @pricePerPiece = 54.99
  end
  def packContent
    @packContent = 1
  end
end

class User
  def eMail
    @eMail = "testmail@test.de"
  end
  def password
    @password = "123456"
  end
  def company
    @company = "Testfirma"
  end
  def firstname
    @firstname = "Vorname"
  end
  def lastname
    @lastname = "Nachname"
  end
  def prefix
    @prefix = "Herr"
  end
  def street
    @street = "Testweg"
  end
  def postcode
    @postcode = "12345"
  end
  def city
    @city = "Teststadt"
  end
  def telephone
    @telephone = "01234567"
  end
end
