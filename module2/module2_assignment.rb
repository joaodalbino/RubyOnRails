class LineAnalyzer
	attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number
	def initialize(line_of_text, line_number)
		@content = line_of_text
		@line_number = line_number
		calculate_word_frequency
	end

	def calculate_word_frequency
		highest_wf_words_count = Hash.new(0)
		@content.split.each do |word|
			highest_wf_words_count[word.downcase] += 1
		end
		@highest_wf_count = highest_wf_words_count.values.max
		@highest_wf_words = Array.new
    	highest_wf_words_count.each_pair do |word, count|
    		@highest_wf_words << word if count == @highest_wf_count
    	end
	end
end

class Solution
	attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines


	def initialize
		@analyzers = Array.new
	end
	
	def analyze_file
		if File.exists? "test.txt"
			line_number = 0
     		File.foreach ('test.txt') do |line|
        		@analyzers << LineAnalyzer.new(line, line_number += 1)
     		end
		end
	end
	
	def calculate_line_with_highest_frequency
    	highest_word_count_across_lines = Hash.new(0)
    	@analyzers.each do |line|
			line.content.split.each do |word|
				highest_word_count_across_lines[word] += 1
			end
		end
		@highest_count_across_lines = highest_word_count_across_lines.values.max
		@highest_count_words_across_lines = Array.new
		@analyzers.each do |line|
			line.highest_wf_words.each do |word|
				@highest_count_words_across_lines << line if highest_word_count_across_lines[word] == @highest_count_across_lines
			end
		end	
	end
	
	def print_highest_word_frequency_across_lines
		puts "The following words have the highest word frequency per line:"
		@analyzers.each do |analyzer|
			puts "#{analyzer.highest_wf_words} (appears in line #{analyzer.line_number})"
		end
	end
end