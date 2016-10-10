class GithubMarkdown
  def initialize(string)
    @string = string
  end
  def render
    tempfile_path = "./tmp/github_markdown_file.tmp"
    File.open(tempfile_path, 'w') { |f| f.write @string }
    `cat "#{tempfile_path}" | pandoc -f markdown_github`
  end
end

# example code to test
=begin

  def test
    test_string = <<-MD
  # header
  ```txt
  code block
  ```
    MD
    html = GithubMarkdown.new(test_string).render
    puts html
  end

=end
