module MyWorld
  def settings
    @settings ||= Settings.new
  end
  def article
  	@article ||= Article.new
  end
  def user
    @user ||= User.new
  end
  def magento
    @magento ||=MagentoAPI.new(settings.urlBackend,ENV['MAGENTO_USERNAME'],ENV['MAGENTO_PASSWORD'])
  end
  def out(msg)
  	if settings.baby_steps then puts msg end
  end
end

World(MyWorld)