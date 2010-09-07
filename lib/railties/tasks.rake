require 'rake'

class UiTemplatesTasks

  def self.self_layouts_dir
    File.join(File.dirname(__FILE__), '..', '..', 'app', 'views', 'layouts')
  end

  def self.self_styles_dir
    File.join(File.dirname(__FILE__), '..', '..', 'public', 'stylesheets')
  end

  def self.rails_layouts_dir
    File.join(RAILS_ROOT, 'app', 'views', 'layouts')
  end

  def self.rails_styles_dir
    File.join(RAILS_ROOT, 'public', 'styleshets')
  end

namespace :ui_templates do

  desc "Copy the layout view to RAILS_ROOT/app/views"
  task :copy_layout => :environment do
    source = File.join(self_layouts_dir, 'ui_templates.html.erb')
    cp source, rails_layouts_dir
  end

  task :copy_styles => :environment do
    source = File.join(self_styles_dir, 'ui_templates.css')
    cp source, rails_styles_dir

    sh "mkdir -p #{rails_styles_dir}/themes/basecamp" unless File.exists?("#{rails_styles_dir}/themes/basecamp")
    source = File.join(self_styles_dir, 'themes', 'basecamp', 'application.css')
    cp source, "#{rails_styles_dir}/themes/basecamp"
  end
end

end
