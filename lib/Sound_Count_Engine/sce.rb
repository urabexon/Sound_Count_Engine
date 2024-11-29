# frozen_string_literal: true

require 'nkf'
require 'natto'
module Sound_Count_Engine
	class Sce
		attr_reader :original_str, :parsed_morphemes

		EXCLUDING_COUNTING_RUBY_BY_TANKA = /ァ|ィ|ォ|ャ|ュ|ョ/
		EXCLUDING_COUNTING_LEXICAL_CATEGORIES = %w[記号].freeze
		HIRAGANA_AND_KATAKANA = /\A[ぁ-んァ-ヶー－]+\z/

		def initialize(str, ref_sce = nil)
			@original_str = str
			@parsed_morphemes = parse_to_hash(str, ref_sce)
		end

		def yomigana
			@parsed_morphemes.map {_1[:ruby] }.join
		end

		private

		def parse_to_hash(str, ref_sce)
			parsed_str_enum = natto.enum_parse(convert_number(str))

			parsed_str_enum.each_with_object([]) do |result, array|
				next if result.is_eos?

				morpheme = separated_element(result)
				morpheme[:ruby] = correct_ruby(morpheme, ref_sce)

				array << morpheme
		end
	rescue Natto::MeCabError
		raise Sound_Count_Engine::ParseError
	end
	