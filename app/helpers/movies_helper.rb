module MoviesHelper

  def formatted_date(date)
    date.strftime("%b %d, %Y")
  end

  def shortened(string_in, maxlength)
    return string_in if maxlength < 5
    unless string_in.length <= maxlength
      string_in[0,maxlength-2] << "…"
    else
      string_in
    end
  end

end