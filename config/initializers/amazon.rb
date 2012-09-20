
Amazon::Ecs.configure do |options|
  options[:associate_tag] = ENV['AMAZON_ASSOCIATE_TAG']
  options[:AWS_access_key_id] = ENV['AMAZON_ACCESS_KEY_ID']
  options[:AWS_secret_key] = ENV['AMAZON_SECRET_KEY']
end