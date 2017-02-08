require 'minitest/autorun'
require './lib/printer'

class PrinterTest < Minitest::Test

  def attendee_data
    {
      'attendee_first_name' => 'Jeff',
      'attendee_last_name' => 'Casimir',
      'attendee_id' => '1',
      'representatives' => [
        {
          'title' => 'Sen',
          'first_name' => 'Cory',
          'last_name' => 'Gardner',
          'party' => 'R',
          'phone_number' => '202-224-5941'
        },
        {
          'title' => 'Rep',
          'first_name' => 'Diana',
          'last_name' => 'DeGette',
          'party' => 'D',
          'phone_number' => '202-225-4431'
        }
      ]
    }
  end

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
