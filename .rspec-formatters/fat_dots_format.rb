# coding: utf-8
require 'rspec/core/formatters/progress_formatter'
class FatDotsFormat < RSpec::Core::Formatters::ProgressFormatter
  def example_passed(_notification)
    output.print success_color("●")
  end

  def example_pending(_notification)
    output.print pending_color("○")
  end
end
