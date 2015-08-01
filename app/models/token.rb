class Token < ActiveRecord::Base
  def self.get_access_token
    if Token.where(:id=>1).first == nil
      Token.init_access_token
    end

    if Time.now - Token.where(id: 1).first.update_time > 7190
      token_access = Token.refresh_access_token
    else
      token_access = Token.where(:id=>1).first.access_token
    end
  end

  def self.refresh_access_token
    token = Token.where(:id=>1).first
    link = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=#{token.appid}&secret=#{token.appsecret}"
    token.access_token = JSON.parse(RestClient.get(link))["access_token"]
    token.update_time = Time.now
    token.save
  end
  
  def self.init_access_token
    if Token.where(:id=>1).first == nil
      token = Token.new
      token.appid = "wx02f639cfd30b9a3b"
      token.appsecret = "110bc5b5b33257ae3098bfddb8170a11"
      token.update_time = "2015-08-01 11:30:55 +0800"
      token.access_token = "KyDTZFAb8fx4S5zsW9KaCXXI_ViKjXQN2lM0CxsvDkBL6UdSbBdw3P9zuByxM4h5A335A54zw9p0-U8_F-FLKWClPrXF43Tc7CzIEabVYh0"
      token.save
    end
  end
end
