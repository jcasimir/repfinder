class Printer
  def render_to_file(data)
    file = File.open("./output/#{filename_for(data)}", 'w')
    file << render(data)
    file.close
  end

  def render(data)
    [
      "== #{data['attendee_first_name']} #{data['attendee_last_name']} ==",
      "",
      render_representatives(data['representatives']),
      ""
    ].join("\n")
  end

  def render_representatives(reps)
    reps.map{|rep| render_representative(rep)}
  end

  def render_representative(data)
    "#{data['title']} #{data['first_name']} #{data['last_name']} (#{data['party']}): #{data['phone_number']}"
  end

  def filename_for(data)
    "#{data['attendee_id'].rjust(5, '0')}_#{data['attendee_last_name'].downcase}_#{data['attendee_first_name'].downcase}.txt"
  end
end
