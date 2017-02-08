module AttendeeData
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
end
