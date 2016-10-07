Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV[299384363778504], ENV[ecb73e567a1d59d288d50eb4516c8761]
end

