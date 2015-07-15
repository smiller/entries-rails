class EntryBuilder
  def initialize(raw_lines)
    @raw_lines = raw_lines
  end

  def build
    Entry.new(build_lines)
  end

  private

  def build_lines
    @raw_lines.inject([]) do |result, raw_line|
      result << new_line(raw_line, previous_indent(result))
      result
    end
  end

  def previous_indent(result)
    result.last ? result.last.indent : 0
  end

  def new_line(raw_line, last_indent)
    c = raw_line.split("> ")
    return Line.new("") if c.size == 0
    Line.new(new_indent(c.length - 1, last_indent), c.last)
  end

  def new_indent(current, previous)
    current == 0 ? previous : current
  end
end
