class Page < ActiveRecord::Base

	validates	:url, :uniqueness => true



#FIND_SITEMAP
	def self.find_sitemap (domain_is)

		#what else shoudl be in the sitemap?

		@xml = '<?xml version="1.0" encoding="UTF-8"?>
			<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'

		@map = Page.all

		@map.each do |m|

			if m.url[0..2] != "scr"
				@xml += "<url><loc>http://#{domain_is}/#{m.url}</loc></url>"
			end

		end

		@xml += "</urlset>"

	end


#FIND_PAGE
	def self.find_page (section1, section2, section3, section4, page_name)

		@page_data = nil

	    if !section4.nil?
	      @page_data = Page.where(:section1 => section1, :section2 => section2, :section3 => params[section3], :section4 => section4, :page_name => page_name).first
	    elsif !section3.nil?
	      @page_data = Page.where(:section1 => section1, :section2 => section2, :section3 => section3, :page_name => page_name).first
	    elsif !section2.nil?
	      @page_data = Page.where(:section1 => section1, :section2 => section2, :page_name => page_name).first
	    elsif !section1.nil?
	      @page_data = Page.where(:section1 => section1, :page_name => page_name).first
	    else
	      @page_data = Page.where(:page_name => page_name).first
	    end

	    if @page_data.nil?
	    	@page_data = Page.where(:section1 => "help_pages", :page_name => "what_are_you_looking_for").first
	    end


	    @col_data_1 = ""

		(1..4).each do |i|

			content_is = @page_data.send("col1_#{i}")


			puts "content_is #{i} is #{content_is} and #{@page_data.send("col1_#{i}")}"

			if !content_is.nil? && content_is != 0
				@col_data_1 += Content.find(content_is).content
			else
				break
			end

		end


	    @col_data_2 = ""

		(1..4).each do |i|

			content_is = @page_data.send("col2_#{i}")

			if !content_is.nil? && content_is != 0
				@col_data_2 += Content.find(content_is).content
			else
				break
			end

		end


	    @col_data_3 = ""

		(1..4).each do |i|

			content_is = @page_data.send("col3_#{i}")

			if !content_is.nil? && content_is != 0
				@col_data_3 += Content.find(content_is).content
			else
				break
			end

		end


	    @col_data_4 = ""

		(1..4).each do |i|

			content_is = @page_data.send("col4_#{i}")

			if !content_is.nil? && content_is != 0
				@col_data_4 += Content.find(content_is).content
			else
				break
			end

		end



	    return @page_data, @col_data_1, @col_data_2, @col_data_3, @col_data_4


	end


end
