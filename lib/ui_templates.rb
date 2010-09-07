require 'rails'

module UiTemplates
  class Engine < Rails::Engine
    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

   rake_tasks do
      load "#{root}/lib/railties/tasks.rake"
   end 
  end
end

