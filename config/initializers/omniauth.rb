Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '360627657455919', 'f8bbc55ad281e21b9c6be6c363fe6f2a'
  provider :twitter, 'H7IZgYt4sruDS8X77ZszXN3Jl', 'DghV6OhxV23vaC5l6zZE2aBDm6s7Qweemly2fqzJvdz8joN13B'
end