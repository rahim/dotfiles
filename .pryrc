begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
rescue LoadError => err

end

begin
  require 'hirb'
rescue LoadError
  # Missing goodies, bummer
end

if defined? Hirb
  Hirb.enable

  old_print = Pry.config.print
  Pry.config.print = proc do |output, value|
    Hirb::View.view_or_page_output(value) || old_print.call(output, value)
  end
end

# Launch Pry with access to the entire Rails stack.
# See https://github.com/pry/pry/wiki/Setting-up-Rails-or-Heroku-to-use-Pry#wiki-pry_rails
# If you have Pry in your Gemfile, you can pass: ./script/console --irb=pry instead.
# If you don't, you can load it through the lines below :)
rails = File.join Dir.getwd, 'config', 'environment.rb'

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails

  if defined?(Rails) && Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
  elsif defined?(Rails) && [3,4,5,6].include?(Rails.version[0..0].to_i)
    require 'rails/console/app'
    require 'rails/console/helpers'

    if Rails.env
      extend Rails::ConsoleMethods
    end
  else
    warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
  end
end

# Prompt with ruby version

prompt_procs =
  if defined?(Rails)
    [
      proc {
        current_app = Rails.application.class.parent_name.underscore.gsub("_", "-")
        rails_env = Rails.env.downcase

        # shorten some common long environment names
        rails_env = "dev" if rails_env == "development"
        rails_env = "prod" if rails_env == "production"

        "#{current_app} [#{rails_env}] ᐅ "
      },
      proc { "> "}
    ]
  else
    [
      proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " },
      proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }
    ]
  end

begin # pry >= 0.13
  Pry.config.prompt = Pry::Prompt.new(
    'rahim', 'rahim rails prompt', prompt_procs
  )
rescue ArgumentError # pry < 0.13
  Pry.config.prompt = prompt_procs
end
