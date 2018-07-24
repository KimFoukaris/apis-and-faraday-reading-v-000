class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'KCPJYKE3TISAHGFWPZF0ISQ4HLJJWQ4WKA3DWHPSB5WWXJQ1'
      req.params['client_secret'] = 'TJ10GRCRH2LXDDBT2AZRRZ1FBVYKLHBZTTE3Z31XX3JLIZVT'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
      body_hash = JSON.parse(@resp.body)
      @venues = body_hash["response"]["venues"]
      render 'search'
  end

end
