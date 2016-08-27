Rails.application.routes.draw do
  root to: 'game#play'
  mount ActionCable.server => '/cable'
end
