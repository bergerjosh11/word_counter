# Function to analyze and print top N frequent words in a text file
def top_words(file_path, n)
  # Read file and split content into words
  words = File.read(file_path).scan(/\w+/).map(&:downcase)

  # Count occurrences of each word
  word_count = Hash.new(0)
  words.each { |word| word_count[word] += 1 }

  # Sort words by frequency in descending order and print top N
  sorted_words = word_count.sort_by { |word, count| -count }.first(n)

  # Print the results
  puts "Top #{n} frequent words in #{file_path}:"
  sorted_words.each_with_index do |(word, count), index|
    puts "#{index + 1}. #{word}: #{count} occurrences"
  end
end

# Example usage:
file_path = 'path/to/your/text/file.txt'
top_words(file_path, 10)
