Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      mount Shopping::Engine => '/'
    end
  end
end
