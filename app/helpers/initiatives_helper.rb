module InitiativesHelper

	def developed(initiative)
		 if (initiative.votes_for).to_i >= 100
	     "Developed"
	     else
	     	
(link_to image_tag("/assets/thumbs_up.png"), vote_for_initiative_initiative_path(initiative),:method => :post)+" "+"#{initiative.votes_for}"+(link_to image_tag("/assets/thumbs_down.png"), vote_against_initiative_initiative_path(initiative), :method => :post)+" " +"#{initiative.votes_against}"
	     
	     end
	end


	
end
