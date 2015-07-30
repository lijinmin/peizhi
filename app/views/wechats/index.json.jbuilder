json.array!(@wechats) do |wechat|
  json.extract! wechat, :id
  json.url wechat_url(wechat, format: :json)
end
