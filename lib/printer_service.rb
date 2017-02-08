require 'json'
require './lib/printer'

class PrinterService
  attr_reader :queue, :printer

  def initialize(queue)
    @queue = queue
    @printer = Printer.new
    start_listening
  end

  def start_listening
    queue.subscribe do |delivery_info, metadata, payload|
      data = JSON.parse(payload)
      printer.render_to_file(data)
    end
  end
end
