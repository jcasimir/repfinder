require 'minitest/autorun'
require './lib/printer_service'
require 'bunny'
require './test/support/attendee_data'

class PrinterServiceTest < Minitest::Test
  include AttendeeData

  def test_it_exists
    assert PrinterServiceTest
  end

  def test_it_generates_output_based_on_a_queue_message
    # 1. connect to RabbitMQ
    connection = Bunny.new
    connection.start
    channel = connection.create_channel
    queue   = channel.queue("printer.to_print")

    # 2. push a sample message
    queue.publish(attendee_data.to_json)

    # 3. fire up the PrinterService
    service = PrinterService.new(queue)

    # 4. wait a second?
    sleep 1

    # 5. check that the file is output
    assert File.exist?('./output/00001_casimir_jeff.txt')
    `rm ./output/00001_casimir_jeff.txt`
  end
end
