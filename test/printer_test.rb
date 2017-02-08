require 'minitest/autorun'
require './lib/printer'
require './test/support/attendee_data'

class PrinterTest < Minitest::Test

  include AttendeeData

  def test_it_exists
    assert Printer
  end

  def test_it_renders_the_content_of_a_file
    p = Printer.new
    output = p.render(attendee_data)
    expected = File.read('./test/support/output_for_jeff.txt')
    assert_equal expected, output
  end

  def test_it_generates_a_filename
    p = Printer.new
    output = p.filename_for(attendee_data)
    expected = "00001_casimir_jeff.txt"
    assert_equal expected, output
  end

  def test_it_generates_a_file
    p = Printer.new
    p.render_to_file(attendee_data)
    assert File.exist?('./output/00001_casimir_jeff.txt')
    `rm ./output/00001_casimir_jeff.txt`
  end
end
