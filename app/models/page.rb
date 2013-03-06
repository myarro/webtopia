include ActionView::Helpers::SanitizeHelper

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



#FIND_RSS
	def self.find_rss (domain_is)

		@rss = '<?xml version="1.0" encoding="UTF-8"?>
		<rss version="2.0"  xmlns:atom="http://www.w3.org/2005/Atom">
		<channel>
		<title>Zimbi Juice Drinks RSS Feed</title>
		<link>http://www.drinkzimbi.com/</link>
		<description>RSS feed for Zimbi juice drinks and drinkzimbi.com.</description>
		<lastBuildDate>Mon, 12 Sep 2005 18:37:00 GMT</lastBuildDate>
		<language>en-us</language>
		<copyright>2012-13 Xymbiot, Inc. All rights reserved.</copyright>
		<atom:link href="http://www.drinkzimbi.com/rss.xml" rel="self" type="application/rss+xml" />'


		#join with blogs some how
		@feed_content = Page.order("updated_at DESC").limit(10)

		feed_count = 0

		@feed_content.each do |fc|

			if fc.section1 != "scr" #&& fc.id is greater than all the default pages

				if fc.col1_1 != 0

					end_string = fc.col1_1.index('_') + 1
					col_data = fc.col1_1[end_string..50].to_i

					body = Content.find(col_data)

					if body.updated_at > (Time.now - 30.days)

						h1_start = body.content.downcase.index('<h1>') + 4
						h1_end = body.content.downcase.index('</h1>') - 1
						body_start = h1_end + 6
						body_end = body_start + 200
						body_finish = ""

						if body.content.length > body_end
							body_finish = "..."
						end

						title = body.content[h1_start .. h1_end]
						description = strip_tags(body.content[body_start .. body_end])

						@rss += "<item>
						<title>#{title}</title>"
						@rss += "<link>#{domain_is}/#{fc.url}</link>"
						@rss += "<guid>#{domain_is}/#{fc.url}</guid>"
						@rss += "<pubDate>#{body.updated_at.strftime("%a, %d %b %Y %H:%M:%S GMT")}</pubDate>"
						@rss += "<description>#{description} #{body_finish}</description>"
						@rss += "</item>"

					end

				end

			end

			feed_count = feed_count + 1

			if feed_count > 10
				break
			end

		end


		@feed_blog = Blog.order("updated_at DESC").limit(10)

		feed_count = 0

		@feed_blog.each do |fb|

			if fb.updated_at > (Time.now - 10.days)

				body_end = 200
				body_finish = ""

				if fb.body.length > body_end
					body_finish = "..."
				end

				title = strip_tags(fb.subject)
				url = title.gsub(" ", "_").downcase
				url = url.gsub(".","")
				description = strip_tags(fb.body[0 .. body_end])

				@rss += "<item>
				<title>#{title}</title>"
				@rss += "<link>#{domain_is}/blog/#{fb.id}/#{url}</link>"
				@rss += "<guid>#{domain_is}/blog/#{fb.id}/#{url}</guid>"
				@rss += "<pubDate>#{fb.updated_at.strftime("%a, %d %b %Y %H:%M:%S GMT")}</pubDate>"
				@rss += "<description>#{description} #{body_finish}</description>"
				@rss += "</item>"

			end

			feed_count = feed_count + 1

			if feed_count > 10
				break
			end

		end

		@rss += "</channel>
		</rss>"

	end


#FIND_PAGE
	def self.find_page (section1, section2, section3, section4, page_name)

		@page_data = nil

	    if !section4.nil?
	      @page_data = Page.where(:section1 => section1, :section2 => section2, :section3 => section3, :section4 => section4, :page_name => page_name).first
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



	    if !@page_data.head_file.nil?
		    @header_data = ""
		    head_start = @page_data.head_file.index("_") + 1
		    header_files = @page_data.head_file[head_start..-1].split(",") 

		    header_files.each do |h|
		    	@header_data += Content.find(h).content + "\n"
		    end
		end


	    if !@page_data.body_1.nil?
		    @body_1_data = ""
		    body_1_start = @page_data.body_1.index("_") + 1
		    body_1_files = @page_data.body_1[body_1_start..-1].split(",") 
		    
		    body_1_files.each do |b1|
		    	@body_1_data += Content.find(b1).content + "\n"
		    end
		end


	    if !@page_data.footer_file.nil?
		    @footer_data = ""
		    footer_start = @page_data.footer_file.index("_") + 1
		    footer_files = @page_data.footer_file[footer_start..-1].split(",") 

		    footer_files.each do |f|
		    	@footer_data += Content.find(f).content + "\n"
		    end
		end


	    if !@page_data.end_of_page_file.nil?
		    @end_of_page_data = ""
		    end_of_page_start = @page_data.end_of_page_file.index("_") + 1
		    end_of_page_files = @page_data.end_of_page_file[end_of_page_start..-1].split(",") 

		    end_of_page_files.each do |e|
		    	@end_of_page_data += Content.find(e).content + "\n"
		    end
		end




	    @col_data_1 = ""

		(1..4).each do |i|


			content_is = @page_data.send("col1_#{i}")

			if !content_is.nil? && content_is != ""

				puts "**********checking content #{content_is[0..4]}"

				if content_is[0..10] == "list_topic_"
					list_name = content_is[11..100]

					list = List.where(["topic_1 like ? OR topic_2 like ? or topic_3 like ?", "%#{list_name}%", "%#{list_name}%", "%#{list_name}%"])


						@col_data_1 += "<hr><br/>"
						@col_data_1 += "<h2>Topic List: #{list_name.upcase}</h2>"

					list.each do |l|
						@col_data_1 += "<br/>"
						@col_data_1 += "<a href='#{l.url}'>#{l.title}</a>"
					end

					@col_data_1 += "<br/><br/>"
					
				elsif content_is[0..4] == "list_"
					list_name = content_is[5..100]

					list = List.where(:list_name => list_name)

					@col_data_1 += "<hr><br/>"
					@col_data_1 += "<h2>List: #{list_name.upcase}</h2>"

					list.each do |l|
						@col_data_1 += "<br/>"
						@col_data_1 += "<a href='#{l.url}'>#{l.title}</a>"
					end

					@col_data_1 += "<br/><br/>"

				elsif content_is[0..8] == "blog_feed"

					blog_limit = content_is[10..20].to_i

					Blog.order("updated_at DESC").limit(blog_limit).each do |b|

						url_subject = b.subject.gsub(" ","_")
						url_subject = url_subject.gsub(/\W/, "").downcase


						@col_data_1 += "<hr><br/>"
						@col_data_1 += "<a href='/blog/#{b.id}/#{url_subject}'><h2>#{b.subject}</h2></a>"
						@col_data_1 += "author : #{b.user_id}<br/>"
						@col_data_1 += "body : #{b.body}<br/><br/>"
						@col_data_1 += "tags : #{b.tags}<br/><br/>"

					end
				else
					page_content = content_is[8..18].to_i
					@col_data_1 += Content.find(page_content).content
				end
			else
				break
			end

		end


	    @col_data_2 = ""

		(1..4).each do |i|

			content_is = @page_data.send("col2_#{i}")

			if !content_is.nil? && content_is != ""
				page_content = content_is[8..18].to_i
				@col_data_2 += Content.find(page_content).content
			else
				break
			end

		end


	    @col_data_3 = ""

		(1..4).each do |i|

			content_is = @page_data.send("col3_#{i}")

			if !content_is.nil? && content_is != ""
				page_content = content_is[8..18].to_i				
				@col_data_3 += Content.find(page_content).content
			else
				break
			end

		end


	    @col_data_4 = ""

		(1..4).each do |i|

			content_is = @page_data.send("col4_#{i}")

			if !content_is.nil? && content_is != ""
				page_content = content_is[8..18].to_i
				@col_data_4 += Content.find(page_content).content
			else
				break
			end

		end


		#create and rss feed of latest articles, blog posts, news, etc.


	    return @page_data, @col_data_1, @col_data_2, @col_data_3, @col_data_4, @header_data, @body_1_data, @footer_data, @end_of_page_data


	end


end
